import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/payment/presentation/widgets/checkout_redirect_screen/checkout_redirect_screen_hero.dart';
import 'package:invit/features/payment/presentation/widgets/checkout_redirect_screen/checkout_redirect_screen_message.dart';
import 'package:invit/features/payment/presentation/widgets/checkout_redirect_screen/checkout_redirect_screen_notice.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/shared_widgets/app_round_icon_button.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// The "Opening secure checkout" page. Shared by the screen that requests the
/// checkout address and by the web view, which keeps it on top until the
/// checkout page has loaded so the user never sees a blank page.
class CheckoutRedirectScreenView extends StatelessWidget {
  const CheckoutRedirectScreenView({
    super.key,
    required this.amount,
    required this.onBack,
    required this.onRetry,
  });

  /// The price with its currency.
  final String amount;
  final VoidCallback onBack;

  /// The "open checkout again" link; disabled when `null`.
  final VoidCallback? onRetry;

  static const EdgeInsets _messagePadding = EdgeInsets.fromLTRB(28, 32, 28, 0);
  static const EdgeInsets _noticePadding = EdgeInsets.fromLTRB(20, 24, 20, 0);
  static const EdgeInsets _backPadding = EdgeInsets.fromLTRB(16, 8, 16, 0);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.pageBackground,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CheckoutRedirectScreenHero(),
                      Padding(
                        padding: _messagePadding,
                        child: CheckoutRedirectScreenMessage(amount: amount),
                      ),
                      const Padding(
                        padding: _noticePadding,
                        child: CheckoutRedirectScreenNotice(),
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                top: false,
                child: Semantics(
                  button: true,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onRetry,
                    child: SizedBox(
                      height: 40,
                      child: Center(
                        child: Text(
                          'checkout_redirect_retry'.tr(),
                          style: AppTextStyle.outfitMedium14.copyWith(
                            color: AppColors.ink,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: _backPadding,
              child: AppRoundIconButton(
                icon: Assets.icons.chevronLeftIc,
                matchTextDirection: true,
                backgroundColor: AppColors.white,
                onTap: onBack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
