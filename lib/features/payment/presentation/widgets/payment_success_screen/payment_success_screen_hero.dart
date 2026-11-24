import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// The mist block with the rings and every guest gathered around the host.
class PaymentSuccessScreenHero extends StatelessWidget {
  const PaymentSuccessScreenHero({super.key});

  static const double _height = 380;
  static const double _bottomRadius = 48;
  static const double _iconSize = 140;
  static const double _iconTop = 140;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(_bottomRadius),
        ),
        child: ColoredBox(
          color: AppColors.mist,
          child: Stack(
            children: [
              const Positioned.fill(
                child: CustomPaint(painter: _RingsPainter()),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: _iconTop,
                child: Center(
                  child: Semantics(
                    label: 'payment_success_icon'.tr(),
                    image: true,
                    child: const CustomPaint(
                      size: Size.square(_iconSize),
                      painter: _GatheredPainter(),
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

class _RingsPainter extends CustomPainter {
  const _RingsPainter();

  /// Radius, stroke width and opacity of each ring.
  static const List<(double, double, double)> _rings = [
    (90, 2, 0.95),
    (140, 1.5, 0.65),
    (196, 1.1, 0.45),
  ];
  static const double _centerY = 210;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, _centerY);
    for (final (radius, width, opacity) in _rings) {
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..color = AppColors.white.withValues(alpha: opacity)
          ..style = PaintingStyle.stroke
          ..strokeWidth = width,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _RingsPainter oldDelegate) => false;
}

class _GatheredPainter extends CustomPainter {
  const _GatheredPainter();

  static const List<Offset> _guests = [
    Offset(72.6, 27.4),
    Offset(82, 50),
    Offset(72.6, 72.6),
    Offset(50, 82),
    Offset(27.4, 72.6),
    Offset(18, 50),
    Offset(27.4, 27.4),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / 100, size.height / 100);

    final dark = Paint()..color = AppColors.ink;
    for (final guest in _guests) {
      canvas.drawCircle(guest, 7.5, dark);
    }
    canvas.drawCircle(
      const Offset(50, 18),
      9,
      Paint()..color = AppColors.accent,
    );
    canvas.drawCircle(
      const Offset(50, 50),
      13,
      Paint()..color = AppColors.white,
    );
    canvas.drawPath(
      Path()
        ..moveTo(44, 50)
        ..relativeLineTo(4.5, 4.5)
        ..lineTo(57, 45.5),
      Paint()
        ..color = AppColors.ink
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
  }

  @override
  bool shouldRepaint(covariant _GatheredPainter oldDelegate) => false;
}
