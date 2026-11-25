import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// Guests gathering around the host: some dots filled, the rest still
/// waiting (dashed), with a clock badge for "try again later".
class CreateEventReviewScreenLimitIllustration extends StatelessWidget {
  const CreateEventReviewScreenLimitIllustration({
    super.key,
    required this.semanticLabel,
  });

  final String semanticLabel;

  static const double _size = 132;
  static const double _badgeSize = 44;
  static const double _badgeIconSize = 22;
  static const double _badgeEnd = -4;
  static const double _badgeBottom = 2;
  static const double _badgeRing = 4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size,
      height: _size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Semantics(
            label: semanticLabel,
            image: true,
            child: const CustomPaint(
              size: Size.square(_size),
              painter: _CreateEventReviewScreenLimitDotsPainter(),
            ),
          ),
          PositionedDirectional(
            end: _badgeEnd,
            bottom: _badgeBottom,
            child: Container(
              width: _badgeSize,
              height: _badgeSize,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: AppColors.white, spreadRadius: _badgeRing),
                ],
              ),
              child: Assets.icons.clockIc.svg(
                width: _badgeIconSize,
                height: _badgeIconSize,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The disc with its dots, drawn on a 100 × 100 grid.
class _CreateEventReviewScreenLimitDotsPainter extends CustomPainter {
  const _CreateEventReviewScreenLimitDotsPainter();

  static const double _grid = 100;
  static const Offset _center = Offset(50, 50);
  static const double _discRadius = 46;
  static const double _filledRadius = 7;
  static const double _waitingRadius = 6;
  static const double _waitingStroke = 1.8;
  static const double _dash = 3;
  static const double _gap = 3;
  static const Offset _host = Offset(50, 18);
  static const double _hostRadius = 8.5;

  static const List<Offset> _filled = [
    Offset(72.6, 27.4),
    Offset(82, 50),
    Offset(72.6, 72.6),
  ];
  static const List<Offset> _waiting = [
    Offset(50, 82),
    Offset(27.4, 72.6),
    Offset(18, 50),
    Offset(27.4, 27.4),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / _grid, size.height / _grid);
    canvas.drawCircle(_center, _discRadius, Paint()..color = AppColors.mist);

    final filled = Paint()..color = AppColors.primary;
    for (final center in _filled) {
      canvas.drawCircle(center, _filledRadius, filled);
    }

    final dashed = Paint()
      ..color = AppColors.inkWaiting
      ..style = PaintingStyle.stroke
      ..strokeWidth = _waitingStroke;
    for (final center in _waiting) {
      _dashedCircle(canvas, center, dashed);
    }

    canvas.drawCircle(_host, _hostRadius, Paint()..color = AppColors.accent);
  }

  void _dashedCircle(Canvas canvas, Offset center, Paint paint) {
    final circumference = 2 * math.pi * _waitingRadius;
    final count = (circumference / (_dash + _gap)).floor();
    final dashAngle = _dash / _waitingRadius;
    final stepAngle = circumference / count / _waitingRadius;
    final rect = Rect.fromCircle(center: center, radius: _waitingRadius);
    for (var i = 0; i < count; i++) {
      canvas.drawArc(rect, i * stepAngle, dashAngle, false, paint);
    }
  }

  @override
  bool shouldRepaint(_CreateEventReviewScreenLimitDotsPainter oldDelegate) =>
      false;
}
