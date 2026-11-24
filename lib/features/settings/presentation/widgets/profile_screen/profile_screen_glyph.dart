import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// Line icons of the profile rows that have no SVG asset.
enum ProfileScreenGlyph { whatsapp, receipt, help, terms, logout, trash }

class ProfileScreenGlyphIcon extends StatelessWidget {
  const ProfileScreenGlyphIcon(
    this.glyph, {
    super.key,
    required this.color,
    this.size = 18,
  });

  final ProfileScreenGlyph glyph;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: _GlyphPainter(glyph, color),
    );
  }
}

class _GlyphPainter extends CustomPainter {
  const _GlyphPainter(this.glyph, this.color);

  final ProfileScreenGlyph glyph;
  final Color color;

  static const double _viewBox = 24;
  static const double _strokeWidth = 1.8;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / _viewBox, size.height / _viewBox);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    switch (glyph) {
      case ProfileScreenGlyph.whatsapp:
        canvas.drawPath(
          Path()
            ..moveTo(4, 20)
            ..relativeLineTo(1.3, -3.9)
            ..arcToPoint(
              const Offset(8, 19),
              radius: const Radius.circular(8),
              largeArc: true,
            )
            ..close(),
          paint,
        );
      case ProfileScreenGlyph.receipt:
        canvas.drawPath(
          Path()
            ..moveTo(6, 3)
            ..relativeLineTo(12, 0)
            ..relativeLineTo(0, 18)
            ..relativeLineTo(-3, -2)
            ..relativeLineTo(-3, 2)
            ..relativeLineTo(-3, -2)
            ..relativeLineTo(-3, 2)
            ..close()
            ..moveTo(9, 8)
            ..relativeLineTo(6, 0)
            ..moveTo(9, 12)
            ..relativeLineTo(6, 0),
          paint,
        );
      case ProfileScreenGlyph.help:
        canvas.drawCircle(const Offset(12, 12), 9, paint);
        canvas.drawPath(
          Path()
            ..moveTo(9.5, 9.5)
            ..arcToPoint(
              const Offset(13, 11.8),
              radius: const Radius.circular(2.5),
              largeArc: true,
            )
            ..relativeCubicTo(-0.6, 0.3, -1, 0.9, -1, 1.6)
            ..relativeLineTo(0, 0.6),
          paint,
        );
        canvas.drawPoints(ui.PointMode.points, const [Offset(12, 17)], paint);
      case ProfileScreenGlyph.terms:
        canvas.drawPath(
          Path()
            ..moveTo(7, 3)
            ..relativeLineTo(7, 0)
            ..relativeLineTo(5, 5)
            ..relativeLineTo(0, 13)
            ..lineTo(7, 21)
            ..close()
            ..moveTo(14, 3)
            ..relativeLineTo(0, 5)
            ..relativeLineTo(5, 0)
            ..moveTo(10, 13)
            ..relativeLineTo(6, 0)
            ..moveTo(10, 17)
            ..relativeLineTo(6, 0),
          paint,
        );
      case ProfileScreenGlyph.logout:
        canvas.drawPath(
          Path()
            ..moveTo(15, 4)
            ..relativeLineTo(3, 0)
            ..arcToPoint(const Offset(20, 6), radius: const Radius.circular(2))
            ..relativeLineTo(0, 12)
            ..arcToPoint(const Offset(18, 20), radius: const Radius.circular(2))
            ..relativeLineTo(-3, 0)
            ..moveTo(10, 17)
            ..relativeLineTo(-5, -5)
            ..relativeLineTo(5, -5)
            ..moveTo(5, 12)
            ..relativeLineTo(11, 0),
          paint,
        );
      case ProfileScreenGlyph.trash:
        canvas.drawPath(
          Path()
            ..moveTo(4, 7)
            ..relativeLineTo(16, 0)
            ..moveTo(10, 11)
            ..relativeLineTo(0, 6)
            ..moveTo(14, 11)
            ..relativeLineTo(0, 6)
            ..moveTo(6, 7)
            ..relativeLineTo(1, 13)
            ..relativeLineTo(10, 0)
            ..relativeLineTo(1, -13)
            ..moveTo(9, 7)
            ..lineTo(9, 4)
            ..relativeLineTo(6, 0)
            ..relativeLineTo(0, 3),
          paint,
        );
    }
  }

  @override
  bool shouldRepaint(covariant _GlyphPainter old) =>
      old.glyph != glyph || old.color != color;
}
