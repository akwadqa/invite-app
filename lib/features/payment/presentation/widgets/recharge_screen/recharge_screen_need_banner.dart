import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/payment/presentation/utils/recharge_format.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "You need N messages" with the current balance.
class RechargeScreenNeedBanner extends StatelessWidget {
  const RechargeScreenNeedBanner({
    super.key,
    required this.needed,
    required this.balance,
  });

  final int needed;
  final int balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.mist,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        spacing: 10,
        children: [
          Assets.icons.usersIc.svg(
            width: 18,
            height: 18,
            colorFilter: const ColorFilter.mode(AppColors.ink, BlendMode.srcIn),
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: '${'recharge_need'.tr()} ',
                children: [
                  TextSpan(
                    text: 'details_messages'.tr(
                      args: [RechargeFormat.thousands(needed)],
                    ),
                    style: AppTextStyle.outfitSemiBold14,
                  ),
                ],
              ),
              style: AppTextStyle.outfitRegular14.copyWith(
                color: AppColors.ink,
              ),
            ),
          ),
          Text(
            'recharge_balance'.tr(args: [RechargeFormat.thousands(balance)]),
            style: AppTextStyle.outfitRegular13.copyWith(
              color: AppColors.inkBody,
            ),
          ),
        ],
      ),
    );
  }
}
