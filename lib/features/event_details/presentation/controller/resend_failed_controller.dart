import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event_details/domain/model/guest_report_model.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_actions_controller.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resend_failed_controller.g.dart';

/// What pressing "Resend" led to.
enum ResendFailedOutcome {
  /// No failed invitation to send again.
  nothing,

  /// The balance does not cover the messages: go and recharge.
  needsTopUp,

  /// The invitations are being sent; the actions controller reports the result.
  started,
}

/// Sends the invitations that were not delivered again.
@riverpod
class ResendFailedController extends _$ResendFailedController {
  @override
  void build(String occasionId) {}

  Future<ResendFailedOutcome> resend() async {
    final report =
        ref
            .read(eventDetailsControllerProvider(ocassionId: occasionId))
            .value
            ?.guestReport ??
        const GuestReportModel();
    final guests = report.failed;
    if (guests == 0) return ResendFailedOutcome.nothing;

    final balance = ref.read(homeControllerProvider).value?.remainingBalance;
    final cost = guests * CreateEventFlowConstants.messagesPerGuest;
    if (balance != null && balance < cost) {
      return ResendFailedOutcome.needsTopUp;
    }

    await ref
        .read(eventDetailsActionsControllerProvider(occasionId).notifier)
        .resendFailed();
    return ResendFailedOutcome.started;
  }
}
