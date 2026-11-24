import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Guests who arrived so far, out of the expected seats, with a progress bar.
class ScanScreenStatsCard extends StatelessWidget {
  const ScanScreenStatsCard({
    super.key,
    required this.arrived,
    required this.expected,
  });

  final int arrived;
  final int expected;

  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 14,
  );
  static const double _radius = 22;
  static const double _barHeight = 8;

  @override
  Widget build(BuildContext context) {
    final ratio = expected <= 0 ? 0.0 : (arrived / expected).clamp(0.0, 1.0);
    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.mist,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '$arrived',
                      style: AppTextStyle.outfitSemiBold24,
                    ),
                    TextSpan(text: ' ${'scan_arrived'.tr()}'),
                  ],
                ),
                style: AppTextStyle.outfitMedium15.copyWith(
                  color: AppColors.ink,
                ),
              ),
              Text(
                'scan_of_expected'.tr(args: ['$expected']),
                style: AppTextStyle.outfitRegular13.copyWith(
                  color: AppColors.inkBody,
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(_barHeight / 2),
            child: Container(
              height: _barHeight,
              color: AppColors.white,
              alignment: AlignmentDirectional.centerStart,
              child: FractionallySizedBox(
                widthFactor: ratio,
                heightFactor: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.ink,
                    borderRadius: BorderRadius.circular(_barHeight / 2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
