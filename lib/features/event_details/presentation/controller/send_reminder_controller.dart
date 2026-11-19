import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invit/features/event_details/domain/model/guest_report_model.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_actions_controller.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/event_details/presentation/utils/reminder_audience.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_reminder_controller.freezed.dart';
part 'send_reminder_controller.g.dart';

@freezed
abstract class SendReminderState with _$SendReminderState {
  const factory SendReminderState({
    @Default(ReminderAudience.noReply) ReminderAudience audience,
  }) = _SendReminderState;
}

/// What pressing "Send" led to.
enum SendReminderOutcome {
  /// Nothing to send to.
  nothing,

  /// The balance does not cover the messages: go and recharge.
  needsTopUp,

  /// The messages are being sent; the actions controller reports the result.
  started,

  /// There is no backend action for this audience yet.
  unavailable,
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
    final report =
        ref
            .read(eventDetailsControllerProvider(ocassionId: occasionId))
            .value
            ?.guestReport ??
        const GuestReportModel();
    final audience = state.audience;
    final guests = audience.countIn(report);
    if (guests == 0) return SendReminderOutcome.nothing;

    final balance = ref.read(homeControllerProvider).value?.remainingBalance;
    final cost = guests * CreateEventFlowConstants.messagesPerGuest;
    if (balance != null && balance < cost) {
      return SendReminderOutcome.needsTopUp;
    }

    switch (audience) {
      case ReminderAudience.notDelivered:
        await ref
            .read(eventDetailsActionsControllerProvider(occasionId).notifier)
            .resendFailed();
        return SendReminderOutcome.started;
      case ReminderAudience.noReply || ReminderAudience.confirmed:
        // TODO(backend): no endpoint sends a reminder to guests who have not
        // replied or to the confirmed ones. Call it here when it exists.
        return SendReminderOutcome.unavailable;
    }
  }
}
