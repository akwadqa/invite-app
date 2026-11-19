import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// What sending costs, the balance, and how many messages are missing.
class SendReminderScreenCost extends StatelessWidget {
  const SendReminderScreenCost({
    super.key,
    required this.cost,
    required this.balance,
  });

  final int cost;

  /// `null` while the balance is not known.
  final int? balance;

  static const double _radius = 18;
  static const double _dotSize = 6;
  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 12,
  );

  @override
  Widget build(BuildContext context) {
    final balance = this.balance;
    final shortfall = balance == null ? 0 : cost - balance;

    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.mistLight,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 8,
        children: [
          _SendReminderScreenCostRow(
            label: 'reminder_cost'.tr(),
            value: 'details_messages'.tr(args: ['$cost']),
          ),
          if (balance != null)
            _SendReminderScreenCostRow(
              label: 'reminder_balance'.tr(),
              value: 'details_messages'.tr(args: ['$balance']),
            ),
          if (shortfall > 0)
            Row(
              spacing: 8,
              children: [
                Container(
                  width: _dotSize,
                  height: _dotSize,
                  decoration: const BoxDecoration(
                    color: AppColors.accent,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Text(
                    'reminder_shortfall'.tr(args: ['$shortfall']),
                    style: AppTextStyle.outfitRegular12_5.copyWith(
                      color: AppColors.accentInk,
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

class _SendReminderScreenCostRow extends StatelessWidget {
  const _SendReminderScreenCostRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: AppTextStyle.outfitRegular14.copyWith(
              color: AppColors.inkBody,
            ),
          ),
        ),
        Text(
          value,
          style: AppTextStyle.outfitSemiBold14.copyWith(color: AppColors.ink),
        ),
      ],
    );
  }
}
