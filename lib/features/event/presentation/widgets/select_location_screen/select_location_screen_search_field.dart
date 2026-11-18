import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// White floating search field of the map picker.
class SelectLocationScreenSearchField extends StatelessWidget {
  const SelectLocationScreenSearchField({
    super.key,
    required this.hint,
    required this.onChanged,
  });

  final String hint;
  final ValueChanged<String> onChanged;

  static const double _height = 48;
  static const double _radius = 16;
  static const double _borderWidth = 1.5;
  static const double _iconSize = 18;
  static const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 14);
  static const List<BoxShadow> _shadow = [
    BoxShadow(
      color: AppColors.shadowMedium,
      offset: Offset(0, 6),
      blurRadius: 16,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(_radius),
        border: Border.all(color: AppColors.mistOutline, width: _borderWidth),
        boxShadow: _shadow,
      ),
      child: Row(
        spacing: 10,
        children: [
          Assets.icons.searchIc.svg(
            width: _iconSize,
            height: _iconSize,
            colorFilter: const ColorFilter.mode(
              AppColors.inkLabel,
              BlendMode.srcIn,
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              textInputAction: TextInputAction.search,
              cursorColor: AppColors.ink,
              style: AppTextStyle.outfitRegular15.copyWith(
                color: AppColors.ink,
              ),
              decoration: InputDecoration(
                isCollapsed: true,
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: hint,
                hintStyle: AppTextStyle.outfitRegular15.copyWith(
                  color: AppColors.grey600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
