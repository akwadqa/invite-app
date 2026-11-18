import 'dart:io';
import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';

/// Crops an image file with Flutter's own image codec (no native cropper),
/// keeping the original pixels.
abstract class ImageCropper {
  static const String _fileName = 'invitation_image_';

  /// Saves the part of [source] inside [area] (fractions of the image's width
  /// and height) as a new PNG and returns it.
  static Future<File> crop(File source, ui.Rect area) async {
    final codec = await ui.instantiateImageCodec(await source.readAsBytes());
    final frame = await codec.getNextFrame();
    final image = frame.image;
    codec.dispose();

    try {
      final width = image.width.toDouble();
      final height = image.height.toDouble();
      final crop = ui.Rect.fromLTRB(
        (area.left * width).clamp(0, width),
        (area.top * height).clamp(0, height),
        (area.right * width).clamp(0, width),
        (area.bottom * height).clamp(0, height),
      );
      if (crop.width < 1 || crop.height < 1) {
        throw const FormatException('Empty crop area');
      }

      // One output pixel per source pixel: the crop is never resampled.
      final outWidth = crop.width.round().clamp(1, image.width);
      final outHeight = crop.height.round().clamp(1, image.height);
      final recorder = ui.PictureRecorder();
      ui.Canvas(recorder).drawImageRect(
        image,
        crop,
        ui.Rect.fromLTWH(0, 0, outWidth.toDouble(), outHeight.toDouble()),
        ui.Paint()..filterQuality = ui.FilterQuality.high,
      );
      final picture = recorder.endRecording();
      final cropped = await picture.toImage(outWidth, outHeight);
      picture.dispose();
      final bytes = await cropped.toByteData(format: ui.ImageByteFormat.png);
      cropped.dispose();
      if (bytes == null) throw const FormatException('Could not encode image');

      final directory = await getTemporaryDirectory();
      final file = File(
        '${directory.path}/$_fileName${DateTime.now().microsecondsSinceEpoch}.png',
      );
      return file.writeAsBytes(
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes),
      );
    } finally {
      image.dispose();
    }
  }
}
