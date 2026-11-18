import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// The four still white rings behind the logo.
class SplashScreenStaticRings extends StatelessWidget {
  const SplashScreenStaticRings({super.key});

  /// The largest ring has a radius of 216.
  static const double size = 432;

  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(
      child: CustomPaint(
        size: Size.square(size),
        painter: _SplashScreenStaticRingsPainter(),
      ),
    );
  }
}

class _SplashScreenStaticRingsPainter extends CustomPainter {
  const _SplashScreenStaticRingsPainter();

  /// (radius, stroke width, opacity) from the design.
  static const List<(double, double, double)> _rings = [
    (89, 1.4, 0.60),
    (127, 1.1, 0.42),
    (169, 0.9, 0.30),
    (216, 0.7, 0.20),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    for (final (radius, stroke, opacity) in _rings) {
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..color = AppColors.white.withValues(alpha: opacity);
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(_SplashScreenStaticRingsPainter oldDelegate) => false;
}
