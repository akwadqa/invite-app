import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// Tinted header with concentric white rings around a centered [child].
class AuthHero extends StatelessWidget {
  const AuthHero({super.key, required this.child});

  final Widget child;

  static const double _height = 300;
  static const double _centerY = 170;
  static const double _cornerRadius = 48;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: AppColors.mist,
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(_cornerRadius),
        ),
      ),
      child: Stack(
        children: [
          const Positioned.fill(
            child: CustomPaint(painter: _AuthHeroRingsPainter(_centerY)),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: _centerY * 2,
            child: Center(child: child),
          ),
        ],
      ),
    );
  }
}

class _AuthHeroRingsPainter extends CustomPainter {
  const _AuthHeroRingsPainter(this.centerY);

  final double centerY;

  /// (radius, stroke width, opacity) from the design.
  static const List<(double, double, double)> _rings = [
    (70, 2, 0.95),
    (118, 1.5, 0.65),
    (172, 1.1, 0.45),
    (232, 0.8, 0.3),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, centerY);
    for (final (radius, strokeWidth, opacity) in _rings) {
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..color = AppColors.white.withValues(alpha: opacity);
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(_AuthHeroRingsPainter oldDelegate) =>
      oldDelegate.centerY != centerY;
}
