import 'package:flutter/painting.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

extension HexColorParsing on String {
  static const int _rgbLength = 6;
  static const int _opaqueAlpha = 0xFF000000;

  /// Parses `#RRGGBB` (or `RRGGBB`) sent by the backend; `null` if invalid.
  Color? get toColorOrNull {
    final hex = replaceFirst('#', '').trim();
    if (hex.length != _rgbLength) return null;
    final value = int.tryParse(hex, radix: 16);
    if (value == null) return null;
    return Color(_opaqueAlpha | value);
  }
}

extension SoftColor on Color {
  static const double _softAlpha = 0.28;

  /// A pastel version of this color on white, for card backgrounds.
  Color get soft =>
      Color.alphaBlend(withValues(alpha: _softAlpha), AppColors.white);
}
