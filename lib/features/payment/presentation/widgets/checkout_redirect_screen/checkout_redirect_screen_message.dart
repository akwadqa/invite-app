import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/payment/presentation/utils/payment_constants.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Title and the "you'll pay X on Sadad" explanation.
class CheckoutRedirectScreenMessage extends StatelessWidget {
  const CheckoutRedirectScreenMessage({super.key, required this.amount});

  /// The price with its currency, shown in bold.
  final String amount;

  static const double _titleLetterSpacing = 30 * -0.03;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Semantics(
          header: true,
          child: Text(
            'checkout_redirect_title'.tr(),
            style: AppTextStyle.outfitMedium30.copyWith(
              color: AppColors.ink,
              height: 1.1,
              letterSpacing: _titleLetterSpacing,
            ),
          ),
        ),
        Text.rich(
          TextSpan(
            text: '${'checkout_redirect_pay'.tr()} ',
            children: [
              TextSpan(
                text: amount,
                style: AppTextStyle.outfitSemiBold15.copyWith(
                  color: AppColors.ink,
                ),
              ),
              TextSpan(
                text:
                    ' ${'checkout_redirect_body'.tr(args: [PaymentConstants.providerName])}',
              ),
            ],
          ),
          style: AppTextStyle.outfitRegular15.copyWith(
            color: AppColors.inkBody,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
