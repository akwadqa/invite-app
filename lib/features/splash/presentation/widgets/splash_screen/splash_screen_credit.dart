import 'package:flutter/material.dart';
import 'package:invit/features/splash/presentation/utils/splash_constants.dart';
import 'package:invit/features/splash/presentation/utils/splash_keyframes.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';
import 'splash_screen_slide_fade_in.dart';

/// "CRAFTED BY / [logo] Akwad Programming" at the bottom; rises in with the
/// tagline.
class SplashScreenCredit extends StatelessWidget {
  const SplashScreenCredit({super.key, required this.progress});

  final Animation<double>? progress;

  static const double _logoSize = 22;

  /// 0.14em and 0.01em from the design.
  static const double _labelLetterSpacing = 1.54;
  static const double _companyLetterSpacing = 0.15;

  @override
  Widget build(BuildContext context) {
    return SplashScreenSlideFadeIn(
      progress: progress,
      opacity: SplashTagTracks.opacity,
      translateY: SplashTagTracks.translateY,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          Text(
            SplashTexts.craftedBy,
            style: AppTextStyle.outfitMedium11.copyWith(
              color: AppColors.inkMuted,
              letterSpacing: _labelLetterSpacing,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Assets.icons.akwadLogo.svg(width: _logoSize, height: _logoSize),
              Text(
                SplashTexts.company,
                style: AppTextStyle.outfitSemiBold15.copyWith(
                  color: AppColors.akwadInk,
                  letterSpacing: _companyLetterSpacing,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
