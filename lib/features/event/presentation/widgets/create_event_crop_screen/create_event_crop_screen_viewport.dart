import 'dart:io';

import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// Free-form crop: the whole image is shown and [area] (fractions of its
/// width and height) is the part to keep. Drag a corner or an edge to resize
/// it, or drag inside it to move it.
class CreateEventCropScreenViewport extends StatefulWidget {
  const CreateEventCropScreenViewport({
    super.key,
    required this.file,
    required this.imageSize,
    required this.area,
  });

  final File file;

  /// How big the image is drawn on screen.
  final Size imageSize;
  final ValueNotifier<Rect> area;

  @override
  State<CreateEventCropScreenViewport> createState() =>
      _CreateEventCropScreenViewportState();
}

enum _Handle {
  topLeft,
  top,
  topRight,
  right,
  bottomRight,
  bottom,
  bottomLeft,
  left,
  move,
}

class _CreateEventCropScreenViewportState
    extends State<CreateEventCropScreenViewport> {
  /// Room around the image so handles on its border can still be grabbed.
  static const double _margin = 20;
  static const double _grabDistance = 28;
  static const double _minSide = 48;
  static const double _radius = 6;

  _Handle? _active;

  Size get _size => widget.imageSize;

  /// The crop area in pixels of the drawn image.
  Rect get _pixels {
    final area = widget.area.value;
    return Rect.fromLTRB(
      area.left * _size.width,
      area.top * _size.height,
      area.right * _size.width,
      area.bottom * _size.height,
    );
  }

  _Handle? _handleAt(Offset point) {
    final rect = _pixels;
    bool near(double a, double b) => (a - b).abs() <= _grabDistance;
    final nearLeft = near(point.dx, rect.left);
    final nearRight = near(point.dx, rect.right);
    final nearTop = near(point.dy, rect.top);
    final nearBottom = near(point.dy, rect.bottom);
    final withinX =
        point.dx >= rect.left - _grabDistance &&
        point.dx <= rect.right + _grabDistance;
    final withinY =
        point.dy >= rect.top - _grabDistance &&
        point.dy <= rect.bottom + _grabDistance;

    if (nearTop && nearLeft) return _Handle.topLeft;
    if (nearTop && nearRight) return _Handle.topRight;
    if (nearBottom && nearLeft) return _Handle.bottomLeft;
    if (nearBottom && nearRight) return _Handle.bottomRight;
    if (nearTop && withinX) return _Handle.top;
    if (nearBottom && withinX) return _Handle.bottom;
    if (nearLeft && withinY) return _Handle.left;
    if (nearRight && withinY) return _Handle.right;
    if (rect.contains(point)) return _Handle.move;
    return null;
  }

  void _drag(Offset delta) {
    final handle = _active;
    if (handle == null) return;
    final width = _size.width;
    final height = _size.height;
    final rect = _pixels;
    var left = rect.left;
    var top = rect.top;
    var right = rect.right;
    var bottom = rect.bottom;

    if (handle == _Handle.move) {
      final dx = delta.dx.clamp(-left, width - right);
      final dy = delta.dy.clamp(-top, height - bottom);
      left += dx;
      right += dx;
      top += dy;
      bottom += dy;
    } else {
      final movesLeft =
          handle == _Handle.left ||
          handle == _Handle.topLeft ||
          handle == _Handle.bottomLeft;
      final movesRight =
          handle == _Handle.right ||
          handle == _Handle.topRight ||
          handle == _Handle.bottomRight;
      final movesTop =
          handle == _Handle.top ||
          handle == _Handle.topLeft ||
          handle == _Handle.topRight;
      final movesBottom =
          handle == _Handle.bottom ||
          handle == _Handle.bottomLeft ||
          handle == _Handle.bottomRight;
      if (movesLeft) left = (left + delta.dx).clamp(0, right - _minSide);
      if (movesRight) {
        right = (right + delta.dx).clamp(left + _minSide, width);
      }
      if (movesTop) top = (top + delta.dy).clamp(0, bottom - _minSide);
      if (movesBottom) {
        bottom = (bottom + delta.dy).clamp(top + _minSide, height);
      }
    }

    widget.area.value = Rect.fromLTRB(
      left / width,
      top / height,
      right / width,
      bottom / height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanStart: (details) {
        _active = _handleAt(
          details.localPosition - const Offset(_margin, _margin),
        );
      },
      onPanUpdate: (details) => _drag(details.delta),
      onPanEnd: (_) => _active = null,
      onPanCancel: () => _active = null,
      child: Padding(
        padding: const EdgeInsets.all(_margin),
        child: SizedBox(
          width: _size.width,
          height: _size.height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(_radius),
                child: Image.file(widget.file, fit: BoxFit.fill),
              ),
              ValueListenableBuilder<Rect>(
                valueListenable: widget.area,
                builder: (context, area, _) => CustomPaint(
                  painter: _CreateEventCropScreenAreaPainter(area),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Dims everything outside the area and draws its frame, grid and handles.
class _CreateEventCropScreenAreaPainter extends CustomPainter {
  const _CreateEventCropScreenAreaPainter(this.area);

  final Rect area;

  static const double _frameWidth = 1.5;
  static const double _gridWidth = 0.8;
  static const double _cornerWidth = 4;
  static const double _cornerLength = 22;
  static const double _edgeLength = 26;
  static const double _gridDivisions = 3;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(
      area.left * size.width,
      area.top * size.height,
      area.right * size.width,
      area.bottom * size.height,
    );

    canvas.drawPath(
      Path()
        ..fillType = PathFillType.evenOdd
        ..addRect(Offset.zero & size)
        ..addRect(rect),
      Paint()..color = AppColors.overlay,
    );

    final line = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.stroke;
    canvas.drawRect(rect, line..strokeWidth = _frameWidth);

    line
      ..color = AppColors.white.withValues(alpha: 0.6)
      ..strokeWidth = _gridWidth;
    for (var i = 1; i < _gridDivisions; i++) {
      final x = rect.left + rect.width * i / _gridDivisions;
      final y = rect.top + rect.height * i / _gridDivisions;
      canvas.drawLine(Offset(x, rect.top), Offset(x, rect.bottom), line);
      canvas.drawLine(Offset(rect.left, y), Offset(rect.right, y), line);
    }

    final handle = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = _cornerWidth
      ..strokeCap = StrokeCap.round;
    for (final corner in [
      (rect.topLeft, 1.0, 1.0),
      (rect.topRight, -1.0, 1.0),
      (rect.bottomLeft, 1.0, -1.0),
      (rect.bottomRight, -1.0, -1.0),
    ]) {
      final (point, dx, dy) = corner;
      canvas.drawPath(
        Path()
          ..moveTo(point.dx + dx * _cornerLength, point.dy)
          ..lineTo(point.dx, point.dy)
          ..lineTo(point.dx, point.dy + dy * _cornerLength),
        handle,
      );
    }
    final center = rect.center;
    final half = _edgeLength / 2;
    canvas
      ..drawLine(
        Offset(center.dx - half, rect.top),
        Offset(center.dx + half, rect.top),
        handle,
      )
      ..drawLine(
        Offset(center.dx - half, rect.bottom),
        Offset(center.dx + half, rect.bottom),
        handle,
      )
      ..drawLine(
        Offset(rect.left, center.dy - half),
        Offset(rect.left, center.dy + half),
        handle,
      )
      ..drawLine(
        Offset(rect.right, center.dy - half),
        Offset(rect.right, center.dy + half),
        handle,
      );
  }

  @override
  bool shouldRepaint(_CreateEventCropScreenAreaPainter oldDelegate) =>
      oldDelegate.area != area;
}
