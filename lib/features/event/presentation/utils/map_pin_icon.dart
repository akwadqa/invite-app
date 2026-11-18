import 'dart:ui' as ui;

import 'package:flutter/painting.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// The app's map pin (black with the accent dot, as in the event details
/// location card), drawn once as a map marker icon.
abstract class MapPinIcon {
  static const double width = 34;
  static const double height = 42;

  // The pin is designed on a 24×30 grid.
  static const double _gridWidth = 24;
  static const double _gridHeight = 30;
  static const Offset _dotCenter = Offset(12, 11);
  static const double _dotRadius = 4;

  static Future<BitmapDescriptor> create({required double pixelRatio}) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder)
      ..scale(
        pixelRatio * width / _gridWidth,
        pixelRatio * height / _gridHeight,
      );
    final paint = Paint()..isAntiAlias = true;

    paint.color = AppColors.ink;
    canvas.drawPath(
      Path()
        ..moveTo(12, 29)
        ..cubicTo(12, 29, 2, 19, 2, 11)
        ..arcToPoint(
          const Offset(22, 11),
          radius: const Radius.circular(10),
          clockwise: true,
        )
        ..cubicTo(22, 19, 12, 29, 12, 29)
        ..close(),
      paint,
    );
    paint.color = AppColors.accent;
    canvas.drawCircle(_dotCenter, _dotRadius, paint);

    final image = await recorder.endRecording().toImage(
      (width * pixelRatio).round(),
      (height * pixelRatio).round(),
    );
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.bytes(
      bytes!.buffer.asUint8List(),
      imagePixelRatio: pixelRatio,
      width: width,
      height: height,
    );
  }
}
