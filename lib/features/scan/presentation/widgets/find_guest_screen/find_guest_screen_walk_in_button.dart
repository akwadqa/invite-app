import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Outlined "Not on the list? Add a walk-in" button.
class FindGuestScreenWalkInButton extends StatelessWidget {
  const FindGuestScreenWalkInButton({super.key, required this.onTap});

  final VoidCallback onTap;

  static const double _height = 56;
  static const double _radius = 28;
  static const double _borderWidth = 1.5;
  static const double _iconSize = 18;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: _height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.pageBackground,
          borderRadius: BorderRadius.circular(_radius),
          border: Border.all(color: AppColors.mistDark, width: _borderWidth),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Assets.icons.plusIc.svg(
              width: _iconSize,
              height: _iconSize,
              colorFilter: const ColorFilter.mode(
                AppColors.ink,
                BlendMode.srcIn,
              ),
            ),
            Text(
              'find_guest_walk_in'.tr(),
              style: AppTextStyle.outfitMedium15.copyWith(color: AppColors.ink),
            ),
          ],
        ),
      ),
    );
  }
}
