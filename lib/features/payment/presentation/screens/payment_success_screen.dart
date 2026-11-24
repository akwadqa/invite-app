import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_actions_controller.dart';
import 'package:invit/features/payment/presentation/controller/payment_success_controller.dart';
import 'package:invit/features/payment/presentation/utils/payment_constants.dart';
import 'package:invit/features/payment/presentation/utils/payment_order.dart';
import 'package:invit/features/payment/presentation/utils/recharge_format.dart';
import 'package:invit/features/payment/presentation/widgets/payment_success_screen/payment_success_screen_balance.dart';
import 'package:invit/features/payment/presentation/widgets/payment_success_screen/payment_success_screen_hero.dart';
import 'package:invit/features/payment/presentation/widgets/payment_success_screen/payment_success_screen_message.dart';
import 'package:invit/features/payment/presentation/widgets/payment_success_screen/payment_success_screen_steps.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Payment done: what was added, what happens next and the balance after.
/// When the payment was for resending failed invitations, they are resent
/// from here and the button leads to that event.
class PaymentSuccessScreen extends ConsumerStatefulWidget {
  const PaymentSuccessScreen({super.key, required this.order});

  final PaymentOrder order;

  @override
  ConsumerState<PaymentSuccessScreen> createState() =>
      _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends ConsumerState<PaymentSuccessScreen> {
  static const EdgeInsets _messagePadding = EdgeInsets.fromLTRB(28, 24, 28, 0);
  static const EdgeInsets _stepsPadding = EdgeInsets.fromLTRB(28, 22, 28, 0);
  static const EdgeInsets _balancePadding = EdgeInsets.fromLTRB(20, 24, 20, 24);
  static const EdgeInsets _buttonsPadding = EdgeInsets.fromLTRB(24, 0, 24, 22);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(paymentSuccessControllerProvider(widget.order).notifier).start();
    });
  }

  /// Back to the screen that opened the recharge flow.
  void _backToOrigin() {
    var remaining = PaymentConstants.pagesAboveOrigin;
    Navigator.of(context).popUntil((_) => remaining-- <= 0);
  }

  @override
  Widget build(BuildContext context) {
    final provider = paymentSuccessControllerProvider(widget.order);
    final state = ref.watch(provider.select((value) => value.value));
    if (state == null) return const SizedBox.shrink();

    final eventId = state.eventId;
    if (eventId != null) {
      ref.listen(
        eventDetailsActionsControllerProvider(
          eventId,
        ).select((actions) => actions.resendFailed),
        (previous, next) {
          if (previous == null || !previous.isLoading || !next.hasError) return;
          AppToast.errorToast(next.error.toString());
        },
      );
    }

    final balanceAfter = state.balanceAfter;

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PaymentSuccessScreenHero(),
                  Padding(
                    padding: _messagePadding,
                    child: PaymentSuccessScreenMessage(
                      messagesAdded: RechargeFormat.thousands(
                        state.messagesAdded,
                      ),
                      isSending: state.isSending,
                    ),
                  ),
                  Padding(
                    padding: _stepsPadding,
                    child: PaymentSuccessScreenSteps(
                      messagesAdded: state.messagesAdded,
                      planName: state.planName,
                      isSending: state.isSending,
                      guests: state.guests,
                    ),
                  ),
                  if (balanceAfter != null)
                    Padding(
                      padding: _balancePadding,
                      child: PaymentSuccessScreenBalance(
                        balance: balanceAfter,
                        isAfterSending: state.isSending,
                      ),
                    ),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: _buttonsPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 4,
                children: [
                  AppPrimaryButton(
                    label: state.isSending
                        ? 'payment_success_go_event'.tr()
                        : 'payment_success_done'.tr(),
                    onPressed: state.isSending
                        ? () =>
                              context.go(AppRoutes.eventDetails, extra: eventId)
                        : _backToOrigin,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => context.go(AppRoutes.mainScreen),
                    child: SizedBox(
                      height: 44,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'payment_success_home'.tr(),
                          style: AppTextStyle.outfitMedium15.copyWith(
                            color: AppColors.ink,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
