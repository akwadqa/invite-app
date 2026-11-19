import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/payment/domain/model/recharge_plan.dart';
import 'package:invit/features/payment/presentation/utils/recharge_format.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// The plan being bought, its price and the total.
class PaymentStepsScreenSummary extends StatelessWidget {
  const PaymentStepsScreenSummary({super.key, required this.plan});

  final RechargePlan plan;

  static const double _lineHeight = 1.3;

  @override
  Widget build(BuildContext context) {
    final price = '${RechargeFormat.thousands(plan.price)} ${'qar'.tr()}';
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.mist,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'checkout_plan_name'.tr(args: [plan.name]),
                      style: AppTextStyle.outfitMedium16.copyWith(
                        color: AppColors.ink,
                        height: _lineHeight,
                      ),
                    ),
                    Text(
                      'checkout_messages_added'.tr(
                        args: [RechargeFormat.thousands(plan.messages)],
                      ),
                      style: AppTextStyle.outfitRegular13.copyWith(
                        color: AppColors.inkBody,
                        height: _lineHeight,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                price,
                style: AppTextStyle.outfitMedium15.copyWith(
                  color: AppColors.ink,
                  height: _lineHeight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const SizedBox(
            height: 1,
            child: ColoredBox(color: AppColors.mistDark),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                child: Text(
                  'checkout_total'.tr(),
                  style: AppTextStyle.outfitMedium15.copyWith(
                    color: AppColors.ink,
                  ),
                ),
              ),
              Text(
                price,
                style: AppTextStyle.outfitSemiBold22.copyWith(
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
