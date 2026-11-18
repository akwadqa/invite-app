import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/utils/functions/helper_methods.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Dark pill with a round icon badge at the end ("Send code", "Verify"...).
/// While its action runs, the screen shows `AppDialogs.loading` on top.
class AuthPrimaryButton extends StatelessWidget {
  const AuthPrimaryButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.isEnabled = true,
    this.mirrorIconInRtl = true,
  });

  final String label;
  final SvgGenImage icon;
  final VoidCallback onPressed;
  final bool isEnabled;

  /// Directional icons (arrows) flip in right-to-left languages; symbols such
  /// as a check mark must not.
  final bool mirrorIconInRtl;

  static const double _height = 64;
  static const double _badgeSize = 48;
  static const double _iconSize = 20;
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
        // Always tappable so the keyboard closes even while disabled.
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
                  child: Text(
                    label,
                    style: AppTextStyle.outfitMedium17.copyWith(
                      color: isEnabled ? AppColors.white : AppColors.inkMuted,
                    ),
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
                  child: icon.svg(
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
