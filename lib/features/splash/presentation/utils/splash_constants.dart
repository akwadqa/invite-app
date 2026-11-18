import 'package:flutter/animation.dart';

abstract class SplashConstants {
  /// The splash animation plays once over this duration, then the app routes
  /// to home or sign in.
  static const Duration animationDuration = Duration(seconds: 6);

  /// cubic-bezier(.2,.7,.3,1): ripples.
  static const Curve rippleEase = Cubic(0.2, 0.7, 0.3, 1);

  /// The design frame; the layout is scaled to fit the screen.
  static const Size frame = Size(390, 844);

  /// Center of the rings, ripples and logo inside [frame].
  static const Offset center = Offset(195, 355);

  static const double logoSize = 150;
  static const double brandTop = 470;
  static const double brandHeight = 100;
  static const double creditBottom = 44;
}

/// The splash is brand artwork and is shown in English in every language.
abstract class SplashTexts {
  static const String appName = 'invite';
  static const String tagline = 'BRING YOUR PEOPLE CLOSER';
  static const String craftedBy = 'CRAFTED BY';
  static const String company = 'Akwad Programming';
}
