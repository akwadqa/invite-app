import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/payment/presentation/utils/payment_constants.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "How you'll pay": three numbered steps joined by a line.
class PaymentStepsScreenSteps extends StatelessWidget {
  const PaymentStepsScreenSteps({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [
      (
        'checkout_step1_title'.tr(),
        'checkout_step1_subtitle'.tr(args: [PaymentConstants.providerName]),
      ),
      ('checkout_step2_title'.tr(), 'checkout_step2_subtitle'.tr()),
      ('checkout_step3_title'.tr(), 'checkout_step3_subtitle'.tr()),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'checkout_how'.tr(),
          style: AppTextStyle.outfitMedium15.copyWith(color: AppColors.ink),
        ),
        const SizedBox(height: 14),
        for (var i = 0; i < steps.length; i++)
          _PaymentStepsScreenStep(
            number: i + 1,
            title: steps[i].$1,
            subtitle: steps[i].$2,
            isActive: i == 0,
            showConnector: i < steps.length - 1,
          ),
      ],
    );
  }
}

class _PaymentStepsScreenStep extends StatelessWidget {
  const _PaymentStepsScreenStep({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.isActive,
    required this.showConnector,
  });

  final int number;
  final String title;
  final String subtitle;
  final bool isActive;
  final bool showConnector;

  static const double _lineHeight = 1.3;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 14,
      children: [
        Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : AppColors.mist,
                shape: BoxShape.circle,
              ),
              child: SizedBox.square(
                dimension: 32,
                child: Center(
                  child: Text(
                    '$number',
                    style: AppTextStyle.outfitSemiBold14.copyWith(
                      color: isActive ? AppColors.white : AppColors.ink,
                    ),
                  ),
                ),
              ),
            ),
            if (showConnector)
              const SizedBox(
                width: 2,
                height: 26,
                child: ColoredBox(color: AppColors.mistDark),
              ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.outfitMedium15.copyWith(
                    color: AppColors.ink,
                    height: _lineHeight,
                  ),
                ),
                Text(
                  subtitle,
                  style: AppTextStyle.outfitRegular13.copyWith(
                    color: AppColors.inkLabel,
                    height: _lineHeight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
