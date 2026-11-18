import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// Faint line doodles tiled over the WhatsApp chat background.
class CreateEventPreviewScreenDoodlePainter extends CustomPainter {
  const CreateEventPreviewScreenDoodlePainter();

  static const double _tile = 120;
  static const double _strokeWidth = 1.2;
  static final Path _doodles = _buildTile();

  static Path _buildTile() {
    return Path()
      // Heart
      ..moveTo(10, 18)
      ..cubicTo(10, 14, 15, 13, 16, 17)
      ..cubicTo(17, 13, 22, 14, 22, 18)
      ..cubicTo(22, 22, 16, 26, 16, 26)
      ..cubicTo(16, 26, 10, 22, 10, 18)
      ..close()
      // Star
      ..moveTo(52, 8)
      ..lineTo(54, 13)
      ..lineTo(59, 13.5)
      ..lineTo(55, 17)
      ..lineTo(56, 22)
      ..lineTo(52, 19.5)
      ..lineTo(48, 22)
      ..lineTo(49, 17)
      ..lineTo(45, 13.5)
      ..lineTo(50, 13)
      ..close()
      // Camera
      ..addRRect(RRect.fromLTRBR(88, 10, 106, 23, const Radius.circular(3)))
      ..addOval(Rect.fromCircle(center: const Offset(97, 16.5), radius: 3.5))
      // Music note
      ..moveTo(18, 56)
      ..lineTo(18, 44)
      ..lineTo(28, 42)
      ..lineTo(28, 54)
      ..addOval(Rect.fromCircle(center: const Offset(15, 57), radius: 3))
      ..addOval(Rect.fromCircle(center: const Offset(25, 55), radius: 3))
      // Smile
      ..addOval(Rect.fromCircle(center: const Offset(62, 54), radius: 8))
      ..moveTo(58, 56)
      ..cubicTo(60, 58.5, 64, 58.5, 66, 56)
      ..moveTo(59, 51)
      ..lineTo(59.01, 51)
      ..moveTo(65, 51)
      ..lineTo(65.01, 51)
      // Cup
      ..moveTo(94, 46)
      ..lineTo(106, 46)
      ..lineTo(104, 58)
      ..lineTo(96, 58)
      ..close()
      ..moveTo(106, 49)
      ..lineTo(109, 49)
      ..arcToPoint(
        const Offset(109, 55),
        radius: const Radius.circular(3),
        clockwise: true,
      )
      ..lineTo(107, 55)
      // Triangle
      ..moveTo(12, 92)
      ..lineTo(18, 82)
      ..lineTo(24, 92)
      ..close()
      // Plus
      ..moveTo(48, 86)
      ..lineTo(66, 86)
      ..moveTo(57, 77)
      ..lineTo(57, 95)
      // Sun
      ..addOval(Rect.fromCircle(center: const Offset(96, 82), radius: 8))
      ..moveTo(96, 74)
      ..lineTo(96, 70)
      ..moveTo(96, 98)
      ..lineTo(96, 94)
      // Waves and check
      ..moveTo(30, 108)
      ..cubicTo(34, 104, 38, 112, 42, 108)
      ..cubicTo(46, 104, 50, 112, 54, 108)
      ..moveTo(72, 106)
      ..lineTo(78, 112)
      ..lineTo(88, 100);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = AppColors.whatsappDoodle;
    canvas.save();
    canvas.clipRect(Offset.zero & size);
    for (double y = 0; y < size.height; y += _tile) {
      for (double x = 0; x < size.width; x += _tile) {
        canvas.drawPath(_doodles.shift(Offset(x, y)), paint);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// The small tail on the corner of a message bubble.
class CreateEventPreviewScreenTailPainter extends CustomPainter {
  const CreateEventPreviewScreenTailPainter({
    required this.isIncoming,
    required this.color,
  });

  static const Size size = Size(8, 13);

  final bool isIncoming;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = isIncoming
        ? (Path()
            ..moveTo(1.533, 3.568)
            ..lineTo(8, 12.193)
            ..lineTo(8, 1)
            ..lineTo(2.812, 1)
            ..cubicTo(1.042, 1, 0.474, 2.156, 1.533, 3.568)
            ..close())
        : (Path()
            ..moveTo(5.188, 1)
            ..lineTo(0, 1)
            ..lineTo(0, 12.193)
            ..lineTo(6.467, 3.568)
            ..cubicTo(7.526, 2.156, 6.958, 1, 5.188, 1)
            ..close());
    canvas.drawPath(
      path,
      Paint()
        ..isAntiAlias = true
        ..color = color,
    );
  }

  @override
  bool shouldRepaint(covariant CreateEventPreviewScreenTailPainter old) =>
      old.isIncoming != isIncoming || old.color != color;
}
