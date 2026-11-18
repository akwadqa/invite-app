import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "By continuing you agree to the Terms and Privacy policy."
class SignInTerms extends StatelessWidget {
  const SignInTerms({super.key});

  static const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 28);

  @override
  Widget build(BuildContext context) {
    final linkStyle = AppTextStyle.outfitRegular12_5.copyWith(
      color: AppColors.ink,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.ink,
    );

    return Padding(
      padding: _padding,
      child: Text.rich(
        style: AppTextStyle.outfitRegular12_5.copyWith(
          color: AppColors.inkLabel,
        ),
        TextSpan(
          children: [
            TextSpan(text: '${'auth_terms_prefix'.tr()} '),
            TextSpan(text: 'auth_terms'.tr(), style: linkStyle),
            TextSpan(text: ' ${'auth_and'.tr()} '),
            TextSpan(text: 'auth_privacy_policy'.tr(), style: linkStyle),
            const TextSpan(text: '.'),
          ],
        ),
      ),
    );
  }
}
