import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/payment/presentation/utils/recharge_format.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// The balance once the payment (and the resend, if any) is done.
class PaymentSuccessScreenBalance extends StatelessWidget {
  const PaymentSuccessScreenBalance({
    super.key,
    required this.balance,
    required this.isAfterSending,
  });

  final int balance;

  /// "Balance after sending" instead of "Your balance".
  final bool isAfterSending;

  @override
  Widget build(BuildContext context) {
    final label = isAfterSending
        ? 'payment_success_balance_after'
        : 'payment_success_balance';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.mistLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label.tr(),
            style: AppTextStyle.outfitRegular13_5.copyWith(
              color: AppColors.inkBody,
            ),
          ),
          Text(
            'details_messages'.tr(args: [RechargeFormat.thousands(balance)]),
            style: AppTextStyle.outfitSemiBold14.copyWith(color: AppColors.ink),
          ),
        ],
      ),
    );
  }
}
