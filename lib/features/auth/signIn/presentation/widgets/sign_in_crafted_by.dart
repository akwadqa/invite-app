import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "Crafted by [logo] Akwad Programming" footer.
class SignInCraftedBy extends StatelessWidget {
  const SignInCraftedBy({super.key});

  static const double _logoSize = 14;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 6,
      children: [
        Text(
          'auth_crafted_by'.tr(),
          style: AppTextStyle.outfitRegular12.copyWith(
            color: AppColors.inkMuted,
          ),
        ),
        Assets.icons.akwadLogo.svg(width: _logoSize, height: _logoSize),
        Text(
          'auth_akwad_programming'.tr(),
          style: AppTextStyle.outfitBold12.copyWith(color: AppColors.akwadInk),
        ),
      ],
    );
  }
}
