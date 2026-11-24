import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "Things to try" card.
class PaymentFailedScreenTips extends StatelessWidget {
  const PaymentFailedScreenTips({super.key});

  static const List<String> _tipKeys = [
    'payment_failed_tip_card',
    'payment_failed_tip_enabled',
    'payment_failed_tip_other',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.mistLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            'payment_failed_tips_title'.tr(),
            style: AppTextStyle.outfitMedium14.copyWith(color: AppColors.ink),
          ),
          for (final key in _tipKeys)
            Row(
              spacing: 10,
              children: [
                const DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    shape: BoxShape.circle,
                  ),
                  child: SizedBox.square(dimension: 6),
                ),
                Expanded(
                  child: Text(
                    key.tr(),
                    style: AppTextStyle.outfitRegular14.copyWith(
                      color: AppColors.inkBody,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
