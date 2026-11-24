import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Red note shown when WhatsApp could not reach the guest's number.
class EditGuestScreenBanner extends StatelessWidget {
  const EditGuestScreenBanner({super.key});

  static const double _radius = 18;
  static const double _badgeSize = 22;
  static const double _badgeTop = 1;
  static const double _textHeight = 1.45;
  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.dangerLight,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Container(
            margin: const EdgeInsets.only(top: _badgeTop),
            width: _badgeSize,
            height: _badgeSize,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.danger,
              shape: BoxShape.circle,
            ),
            child: Text(
              '!',
              style: AppTextStyle.outfitBold12.copyWith(color: AppColors.white),
            ),
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: 'edit_guest_not_delivered'.tr(),
                style: AppTextStyle.outfitSemiBold13_5,
                children: [
                  TextSpan(
                    text: 'edit_guest_not_delivered_body'.tr(),
                    style: AppTextStyle.outfitRegular13_5,
                  ),
                ],
              ),
              style: AppTextStyle.outfitRegular13_5.copyWith(
                color: AppColors.dangerDeep,
                height: _textHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
