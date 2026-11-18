import 'dart:io';

import 'package:image_picker/image_picker.dart';

/// Picks an image from the gallery exactly as it is: no resizing and no
/// compression, so the invitation keeps its original quality.
Future<File?> pickImage() async {
  final pickedImage = await ImagePicker().pickImage(
    source: ImageSource.gallery,
  );
  if (pickedImage == null) return null;
  return File(pickedImage.path);
}
