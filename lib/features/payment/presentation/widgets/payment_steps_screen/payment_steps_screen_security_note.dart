import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Reassurance that card details never reach the app.
class PaymentStepsScreenSecurityNote extends StatelessWidget {
  const PaymentStepsScreenSecurityNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.mistLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        spacing: 10,
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.successLight,
              shape: BoxShape.circle,
            ),
            child: SizedBox.square(
              dimension: 32,
              child: Center(
                child: Assets.icons.lockIc.svg(
                  width: 16,
                  height: 16,
                  colorFilter: const ColorFilter.mode(
                    AppColors.success,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              'checkout_security'.tr(),
              style: AppTextStyle.outfitRegular13.copyWith(
                color: AppColors.inkBody,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
