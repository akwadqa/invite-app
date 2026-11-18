import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/utils/functions/helper_methods.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Dark pill with a round icon badge at the end ("Continue", "Next: ...").
/// One-off actions show `AppDialogs.loading` on top while they run.
class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.label,
    this.subtitle,
    required this.onPressed,
    this.icon,
    this.isEnabled = true,
    this.mirrorIconInRtl = true,
  });

  final String label;

  /// Optional second line under the label.
  final String? subtitle;
  final VoidCallback onPressed;

  /// Defaults to a forward arrow.
  final SvgGenImage? icon;
  final bool isEnabled;

  /// Directional icons (arrows) flip in right-to-left languages; symbols such
  /// as a check mark must not.
  final bool mirrorIconInRtl;

  static const double _height = 64;
  static const double _badgeSize = 48;
  static const double _iconSize = 20;
  static const double _twoLineHeight = 1.15;
  static const EdgeInsetsDirectional _padding = EdgeInsetsDirectional.only(
    start: 28,
    end: 8,
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isEnabled ? AppColors.ink : AppColors.mistBorder,
      shape: const StadiumBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          dismissKeyboard();
          if (isEnabled) onPressed();
        },
        child: SizedBox(
          height: _height,
          child: Padding(
            padding: _padding,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.outfitMedium17.copyWith(
                          color: isEnabled
                              ? AppColors.white
                              : AppColors.inkMuted,
                          height: subtitle == null ? null : _twoLineHeight,
                        ),
                      ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.outfitRegular12_5.copyWith(
                            color: AppColors.whiteMuted,
                            height: _twoLineHeight,
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  width: _badgeSize,
                  height: _badgeSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isEnabled ? AppColors.accent : AppColors.mistSoft,
                  ),
                  child: (icon ?? Assets.icons.arrowRightIc).svg(
                    width: _iconSize,
                    height: _iconSize,
                    matchTextDirection: mirrorIconInRtl,
                    colorFilter: const ColorFilter.mode(
                      AppColors.ink,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
