import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/payment/presentation/utils/payment_order.dart';
import 'package:invit/features/payment/presentation/widgets/payment_failed_screen/payment_failed_screen_hero.dart';
import 'package:invit/features/payment/presentation/widgets/payment_failed_screen/payment_failed_screen_tips.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// The payment did not go through: nothing was charged, a few things to try,
/// and a way to start the payment again or go back to the order summary.
/// Static, so it has no controller.
class PaymentFailedScreen extends StatelessWidget {
  const PaymentFailedScreen({super.key, required this.order});

  final PaymentOrder order;

  static const EdgeInsets _messagePadding = EdgeInsets.fromLTRB(28, 32, 28, 0);
  static const EdgeInsets _tipsPadding = EdgeInsets.fromLTRB(20, 24, 20, 24);
  static const EdgeInsets _buttonsPadding = EdgeInsets.fromLTRB(24, 0, 24, 30);
  static const double _titleLetterSpacing = -0.9;

  /// Replaces this screen, so the stack keeps the same number of pages.
  void _tryAgain(BuildContext context) =>
      context.pushReplacement(AppRoutes.checkoutRedirectScreen, extra: order);

  void _backToOrder(BuildContext context) {
    if (context.canPop()) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    // "Saved" only holds when there is an event: the resend of an event's
    // failed invitations.
    final hasEvent = order.request.eventId != null;
    final body = [
      'payment_failed_body'.tr(),
      if (hasEvent) 'payment_failed_saved'.tr(),
    ].join(' ');

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PaymentFailedScreenHero(),
                  Padding(
                    padding: _messagePadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Text(
                          'payment_failed_title'.tr(),
                          style: AppTextStyle.outfitMedium30.copyWith(
                            color: AppColors.ink,
                            height: 1.1,
                            letterSpacing: _titleLetterSpacing,
                          ),
                        ),
                        Text(
                          body,
                          style: AppTextStyle.outfitRegular15.copyWith(
                            color: AppColors.inkBody,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: _tipsPadding,
                    child: PaymentFailedScreenTips(),
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
                spacing: 8,
                children: [
                  AppPrimaryButton(
                    label: 'payment_failed_try_again'.tr(),
                    icon: Assets.icons.retryIc,
                    mirrorIconInRtl: false,
                    onPressed: () => _tryAgain(context),
                  ),
                  _PaymentFailedScreenBackButton(
                    onTap: () => _backToOrder(context),
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

class _PaymentFailedScreenBackButton extends StatelessWidget {
  const _PaymentFailedScreenBackButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: const StadiumBorder(
        side: BorderSide(color: AppColors.mistDark, width: 1.5),
      ),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 52,
          width: double.infinity,
          child: Center(
            child: Text(
              'payment_failed_back'.tr(),
              style: AppTextStyle.outfitMedium15.copyWith(color: AppColors.ink),
            ),
          ),
        ),
      ),
    );
  }
}
