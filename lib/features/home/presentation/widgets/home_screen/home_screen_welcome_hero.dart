import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/src/core/shared_widgets/app_gather_logo.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Top part of the welcome screen: the brand name and the logo inside
/// concentric rings. Everything is laid out for a [designHeight] tall area
/// and scaled to the height it actually gets.
class HomeScreenWelcomeHero extends StatelessWidget {
  const HomeScreenWelcomeHero({super.key, required this.height});

  final double height;

  /// Height the design was drawn for.
  static const double designHeight = 540;

  static const double _bottomRadius = 56;
  static const double _brandTop = 62;
  static const double _brandLetterSpacing = -0.78;
  static const double _logoAreaTop = 210;
  static const double _logoAreaHeight = 160;
  static const double _logoSize = 108;

  @override
  Widget build(BuildContext context) {
    final scale = height / designHeight;

    return SizedBox(
      height: height,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(_bottomRadius),
        ),
        child: ColoredBox(
          color: AppColors.mist,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _HomeScreenWelcomeRingsPainter(scale),
                ),
              ),
              Positioned(
                top: _brandTop * scale,
                left: 0,
                right: 0,
                child: Text(
                  'home_welcome_brand'.tr(),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.outfitMedium26.copyWith(
                    color: AppColors.ink,
                    letterSpacing: _brandLetterSpacing,
                  ),
                ),
              ),
              Positioned(
                top: _logoAreaTop * scale,
                left: 0,
                right: 0,
                height: _logoAreaHeight * scale,
                child: Center(
                  child: Semantics(
                    label: 'home_welcome_logo'.tr(),
                    image: true,
                    child: AppGatherLogo(
                      progress: null,
                      size: _logoSize * scale,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The rings around the logo and the small dots scattered between them.
class _HomeScreenWelcomeRingsPainter extends CustomPainter {
  const _HomeScreenWelcomeRingsPainter(this.scale);

  final double scale;

  static const double _centerY = 290;
  static const double _designHalfWidth = 195;
  static const double _mutedDotOpacity = 0.35;

  /// Radius, stroke width and opacity of each ring.
  static const List<(double, double, double)> _rings = [
    (96, 2, 0.95),
    (146, 1.6, 0.75),
    (200, 1.3, 0.55),
    (258, 1, 0.4),
    (320, 0.8, 0.3),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, _centerY * scale);
    for (final (radius, width, opacity) in _rings) {
      canvas.drawCircle(
        center,
        radius * scale,
        Paint()
          ..isAntiAlias = true
          ..style = PaintingStyle.stroke
          ..strokeWidth = width
          ..color = AppColors.white.withValues(alpha: opacity),
      );
    }

    final muted = AppColors.ink.withValues(alpha: _mutedDotOpacity);
    final dots = <(double, double, double, Color)>[
      (91, 187, 7, AppColors.accentSecondary),
      (325, 214, 5, AppColors.accent),
      (68, 402, 5, muted),
      (318, 392, 7, AppColors.accentSecondary),
      (195, 132, 4, muted),
      (40, 300, 4, AppColors.accent),
    ];
    final shiftX = size.width / 2 - _designHalfWidth;
    final fill = Paint()..isAntiAlias = true;
    for (final (x, y, radius, color) in dots) {
      fill.color = color;
      canvas.drawCircle(Offset(x + shiftX, y * scale), radius * scale, fill);
    }
  }

  @override
  bool shouldRepaint(_HomeScreenWelcomeRingsPainter oldDelegate) =>
      oldDelegate.scale != scale;
}
