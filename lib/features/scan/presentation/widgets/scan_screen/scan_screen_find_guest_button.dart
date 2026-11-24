import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Outlined "Find a guest by name" button under the stats card.
class ScanScreenFindGuestButton extends StatelessWidget {
  const ScanScreenFindGuestButton({super.key, required this.onTap});

  final VoidCallback onTap;

  static const double _height = 56;
  static const double _radius = 28;
  static const double _borderWidth = 1.5;
  static const double _iconSize = 20;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: _height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_radius),
          border: Border.all(color: AppColors.mistDark, width: _borderWidth),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            Assets.icons.searchIc.svg(
              width: _iconSize,
              height: _iconSize,
              colorFilter: const ColorFilter.mode(
                AppColors.ink,
                BlendMode.srcIn,
              ),
            ),
            Text(
              'scan_find_guest'.tr(),
              style: AppTextStyle.outfitMedium16.copyWith(color: AppColors.ink),
            ),
          ],
        ),
      ),
    );
  }
}
