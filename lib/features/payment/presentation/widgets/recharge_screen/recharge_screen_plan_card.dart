import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// One plan: name, radio, messages, price and a status tag.
class RechargeScreenPlanCard extends StatelessWidget {
  const RechargeScreenPlanCard({
    super.key,
    required this.name,
    required this.messages,
    required this.price,
    required this.isSelected,
    required this.isEnabled,
    required this.onTap,
    this.tag,
    this.tagBackground = AppColors.mistSoft,
    this.tagColor = AppColors.inkBody,
  });

  final String name;
  final String messages;
  final String price;
  final bool isSelected;
  final bool isEnabled;
  final VoidCallback onTap;

  /// Hidden when `null`.
  final String? tag;
  final Color tagBackground;
  final Color tagColor;

  static const Duration _animation = Duration(milliseconds: 150);
  static const double _disabledOpacity = 0.55;

  @override
  Widget build(BuildContext context) {
    final tag = this.tag;
    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: isSelected,
      enabled: isEnabled,
      button: true,
      child: Opacity(
        opacity: isEnabled ? 1 : _disabledOpacity,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: isEnabled ? onTap : null,
          child: AnimatedContainer(
            duration: _animation,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.optionSelectedSurface
                  : AppColors.white,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.mistBorder,
                width: isSelected ? 2 : 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: AppTextStyle.outfitSemiBold18.copyWith(
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    _RechargeScreenRadio(isSelected: isSelected),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  messages,
                  style: AppTextStyle.outfitRegular14.copyWith(
                    color: AppColors.inkBody,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Text(
                        price,
                        style: AppTextStyle.outfitSemiBold22.copyWith(
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    if (tag != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: tagBackground,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          tag,
                          style: AppTextStyle.outfitMedium12_5.copyWith(
                            color: tagColor,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RechargeScreenRadio extends StatelessWidget {
  const _RechargeScreenRadio({required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: RechargeScreenPlanCard._animation,
      width: 24,
      height: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColors.primary : AppColors.white,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.mistDark,
          width: 2,
        ),
      ),
      child: const DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
        child: SizedBox.square(dimension: 8),
      ),
    );
  }
}
