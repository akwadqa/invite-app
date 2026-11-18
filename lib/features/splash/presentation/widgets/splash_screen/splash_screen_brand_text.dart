import 'package:flutter/material.dart';
import 'package:invit/features/splash/presentation/utils/splash_constants.dart';
import 'package:invit/features/splash/presentation/utils/splash_keyframes.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';
import 'splash_screen_slide_fade_in.dart';

/// App name, then the tagline below it.
class SplashScreenBrandText extends StatelessWidget {
  const SplashScreenBrandText({super.key, required this.progress});

  final Animation<double>? progress;

  /// Distance between the top of the name and the top of the tagline.
  static const double _taglineOffset = 64;

  /// -0.04em and 0.3em from the design.
  static const double _titleLetterSpacing = -1.92;
  static const double _taglineLetterSpacing = 3.45;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SplashScreenSlideFadeIn(
            progress: progress,
            opacity: SplashWordTracks.opacity,
            translateY: SplashWordTracks.translateY,
            child: Text(
              SplashTexts.appName,
              textAlign: TextAlign.center,
              style: AppTextStyle.outfitMedium48.copyWith(
                color: AppColors.ink,
                letterSpacing: _titleLetterSpacing,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: _taglineOffset),
          child: Align(
            alignment: Alignment.topCenter,
            child: SplashScreenSlideFadeIn(
              progress: progress,
              opacity: SplashTagTracks.opacity,
              translateY: SplashTagTracks.translateY,
              child: Text(
                SplashTexts.tagline,
                textAlign: TextAlign.center,
                style: AppTextStyle.outfitMedium11_5.copyWith(
                  color: AppColors.ink,
                  letterSpacing: _taglineLetterSpacing,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
