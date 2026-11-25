import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:invit/features/payment/domain/model/balance/balance_model.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// One history line: icon, title, subtitle and the signed message amount.
class BalanceScreenHistoryRow extends StatelessWidget {
  const BalanceScreenHistoryRow({super.key, required this.entry});

  final BalanceHistoryModel entry;

  static const double _lineHeight = 1.25;
  static const String _minus = '−';

  String get _title => entry.title ?? entry.bundle ?? entry.type ?? '';

  String get _amount {
    final value = (entry.amount ?? 0).abs();
    final text = value == value.toInt() ? '${value.toInt()}' : '$value';
    return '${entry.isCredit ? '+' : _minus}$text';
  }

  String _subtitle(BuildContext context) {
    final dateTime = entry.dateTime;
    final date = dateTime == null
        ? null
        : DateFormat('d MMM', context.locale.toLanguageTag()).format(dateTime);
    final price = entry.paidAmount;
    final lead = entry.isCredit && price != null
        ? 'balance_paid'.tr(args: ['$price'])
        : entry.subtitle;
    return [lead, date].whereType<String>().where((e) => e.isNotEmpty).join(' · ');
  }

  @override
  Widget build(BuildContext context) {
    final credit = entry.isCredit;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.mistSoft)),
      ),
      child: Row(
        spacing: 12,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: credit ? AppColors.accentLight : AppColors.mistSoft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox.square(
              dimension: 38,
              child: Center(
                child: (credit ? Assets.icons.plusIc : Assets.icons.sendIc).svg(
                  width: 17,
                  height: 17,
                  colorFilter: ColorFilter.mode(
                    credit ? AppColors.accentInk : AppColors.ink,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.outfitMedium14_5.copyWith(
                    color: AppColors.ink,
                    height: _lineHeight,
                  ),
                ),
                Text(
                  _subtitle(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.outfitRegular12_5.copyWith(
                    color: AppColors.inkLabel,
                    height: _lineHeight,
                  ),
                ),
              ],
            ),
          ),
          Text(
            _amount,
            textDirection: TextDirection.ltr,
            style: AppTextStyle.outfitSemiBold15.copyWith(
              color: credit ? AppColors.success : AppColors.ink,
            ),
          ),
        ],
      ),
    );
  }
}
