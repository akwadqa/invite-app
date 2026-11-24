import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_actions_controller.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:invit/features/payment/presentation/controller/payment_success_state.dart';
import 'package:invit/features/payment/presentation/utils/payment_order.dart';
import 'package:invit/features/payment/presentation/utils/recharge_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_success_controller.g.dart';

/// The result of a paid [PaymentOrder]: what was bought, what happens next
/// and the balance afterwards. For a failed-invitations resend it also runs
/// the resend once the payment is confirmed.
@riverpod
class PaymentSuccessController extends _$PaymentSuccessController {
  bool _hasStarted = false;

  PaymentSuccessState get _current => state.requireValue;

  @override
  FutureOr<PaymentSuccessState> build(PaymentOrder order) {
    final request = order.request;
    final eventId = request.eventId;
    final isSending =
        request.followUp == PaymentFollowUp.resendFailed && eventId != null;
    // The home feed has not been refreshed since the payment, so this is still
    // the balance before it.
    final balance = ref
        .read(homeControllerProvider)
        .value
        ?.remainingBalance
        ?.toInt();
    final consumed = isSending ? request.needed : 0;
    return PaymentSuccessState(
      messagesAdded: order.plan.messages,
      planName: order.plan.name,
      isSending: isSending,
      guests: request.needed ~/ CreateEventFlowConstants.messagesPerGuest,
      balanceAfter: balance == null
          ? null
          : balance + order.plan.messages - consumed,
      eventId: eventId,
    );
  }

  /// Resends the failed invitations (when that is what the payment was for)
  /// and refreshes the balance. Runs once per screen.
  Future<void> start() async {
    if (_hasStarted) return;
    _hasStarted = true;
    final homeController = ref.read(homeControllerProvider.notifier);
    final eventId = _current.eventId;
    if (_current.isSending && eventId != null) {
      await ref
          .read(eventDetailsActionsControllerProvider(eventId).notifier)
          .resendFailed();
      if (!ref.mounted) return;
    }
    await homeController.refresh();
  }
}
