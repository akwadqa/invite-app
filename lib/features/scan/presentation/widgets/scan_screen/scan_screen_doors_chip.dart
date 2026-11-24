import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Green "Doors open" status chip in the header.
class ScanScreenDoorsChip extends StatelessWidget {
  const ScanScreenDoorsChip({super.key, required this.onTap});

  final VoidCallback onTap;

  static const double _height = 32;
  static const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 12);
  static const double _dotSize = 6;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: _height,
        padding: _padding,
        decoration: const ShapeDecoration(
          color: AppColors.successLight,
          shape: StadiumBorder(),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 6,
          children: [
            const SizedBox.square(
              dimension: _dotSize,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.successDot,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Text(
              'scan_doors_open'.tr(),
              style: AppTextStyle.outfitMedium13.copyWith(
                color: AppColors.success,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
