import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event_details/data/repositories/event_details_repository.dart';
import 'package:invit/features/event_details/domain/model/guest_report_model.dart';
import 'package:invit/features/event_details/domain/model/send_reminder_result_model.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/event_details/presentation/utils/reminder_audience.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_reminder_controller.freezed.dart';
part 'send_reminder_controller.g.dart';

@freezed
abstract class SendReminderState with _$SendReminderState {
  const factory SendReminderState({
    @Default(ReminderAudience.noReply) ReminderAudience audience,

    /// Sends the reminder. A low balance settles as an error holding a
    /// `NotEnoughMessagesException`.
    @Default(AsyncData(null)) AsyncValue<SendReminderResultModel?> send,
  }) = _SendReminderState;

  const SendReminderState._();

  /// The guests of the selected audience, what reminding them costs and the
  /// [homeBalance] it is checked against.
  ReminderCost costOf(GuestReportModel report, {required int? homeBalance}) {
    final guests = audience.countIn(report);
    return (
      guests: guests,
      cost: guests * CreateEventFlowConstants.messagesPerGuest,
      balance: homeBalance,
    );
  }
}

/// What sending costs and the balance it is checked against.
typedef ReminderCost = ({int guests, int cost, int? balance});

/// What pressing "Send" led to.
enum SendReminderOutcome {
  /// Nothing to send to.
  nothing,

  /// The balance does not cover the messages: go and recharge.
  needsTopUp,

  /// The reminder is being sent; `state.send` reports the result.
  started,
}

/// The audience picked on the "Send a reminder" screen and its sending.
@riverpod
class SendReminderController extends _$SendReminderController {
  @override
  SendReminderState build(String occasionId, ReminderAudience initial) =>
      SendReminderState(audience: initial);

  void select(ReminderAudience audience) =>
      state = state.copyWith(audience: audience);

  Future<SendReminderOutcome> send() async {
    if (state.send.isLoading) return SendReminderOutcome.nothing;
    final report =
        ref
            .read(eventDetailsControllerProvider(ocassionId: occasionId))
            .value
            ?.guestReport ??
        const GuestReportModel();
    final (:guests, :cost, :balance) = state.costOf(
      report,
      homeBalance: ref
          .read(homeControllerProvider)
          .value
          ?.remainingBalance
          ?.toInt(),
    );
    if (guests == 0) return SendReminderOutcome.nothing;

    if (balance != null && balance < cost) {
      return SendReminderOutcome.needsTopUp;
    }

    final repository = ref.read(eventDetailsRepositoryProvider);
    state = state.copyWith(send: const AsyncLoading());
    try {
      final result = await repository.sendReminder(
        occasionId,
        audience: state.audience.apiValue,
      );
      if (!ref.mounted) return SendReminderOutcome.started;
      state = state.copyWith(send: AsyncData(result));
      ref
          .read(eventDetailsControllerProvider(ocassionId: occasionId).notifier)
          .refresh();
      ref.read(homeControllerProvider.notifier).refresh();
    } catch (error, stackTrace) {
      if (!ref.mounted) return SendReminderOutcome.started;
      state = state.copyWith(send: AsyncError(error, stackTrace));
    }
    return SendReminderOutcome.started;
  }
}
