import 'package:invit/src/core/utils/animation/keyframe_track.dart';

/// `@keyframes word`: the app name rises in at 70% → 78%.
abstract class SplashWordTracks {
  static const opacity = KeyframeTrack([
    Keyframe(0.00, 0),
    Keyframe(0.70, 0),
    Keyframe(0.78, 1),
    Keyframe(0.88, 1),
    Keyframe(0.95, 0),
    Keyframe(1.00, 0),
  ]);

  static const translateY = KeyframeTrack([
    Keyframe(0.00, 16),
    Keyframe(0.70, 16),
    Keyframe(0.78, 0),
    Keyframe(1.00, 0),
  ]);
}

/// `@keyframes tag`: the tagline and the credit rise in at 74% → 82%.
abstract class SplashTagTracks {
  static const opacity = KeyframeTrack([
    Keyframe(0.00, 0),
    Keyframe(0.74, 0),
    Keyframe(0.82, 1),
    Keyframe(0.88, 1),
    Keyframe(0.95, 0),
    Keyframe(1.00, 0),
  ]);

  static const translateY = KeyframeTrack([
    Keyframe(0.00, 12),
    Keyframe(0.74, 12),
    Keyframe(0.82, 0),
    Keyframe(1.00, 0),
  ]);
}
