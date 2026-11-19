import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "History" title with the "Receipts" link.
class BalanceScreenHistoryHeader extends StatelessWidget {
  const BalanceScreenHistoryHeader({super.key, required this.onReceipts});

  final VoidCallback onReceipts;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Expanded(
          child: Text(
            'balance_history'.tr(),
            style: AppTextStyle.outfitMedium15.copyWith(color: AppColors.ink),
          ),
        ),
        Semantics(
          link: true,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onReceipts,
            child: Text(
              'balance_receipts'.tr(),
              style: AppTextStyle.outfitMedium13_5.copyWith(
                color: AppColors.ink,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
