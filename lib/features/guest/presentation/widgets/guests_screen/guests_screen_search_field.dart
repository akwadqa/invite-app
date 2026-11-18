import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "Search by name or number" field.
class GuestsScreenSearchField extends StatelessWidget {
  const GuestsScreenSearchField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  static const double _height = 48;
  static const double _radius = 16;
  static const double _borderWidth = 1.5;
  static const double _iconSize = 18;
  static const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 14);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.mistLight,
        borderRadius: BorderRadius.circular(_radius),
        border: Border.all(color: AppColors.mistOutline, width: _borderWidth),
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
              controller: controller,
              onChanged: onChanged,
              textInputAction: TextInputAction.search,
              cursorColor: AppColors.ink,
              style: AppTextStyle.outfitRegular15.copyWith(
                color: AppColors.ink,
                height: null,
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
                hintText: 'guests_search_hint'.tr(),
                hintStyle: AppTextStyle.outfitRegular15.copyWith(
                  color: AppColors.grey600,
                  height: null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
