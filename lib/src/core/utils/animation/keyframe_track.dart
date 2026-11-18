import 'package:flutter/animation.dart';

abstract class KeyframeCurves {
  /// cubic-bezier(.22,1,.36,1)
  static const Curve easeOutExpo = Cubic(0.22, 1, 0.36, 1);
}

/// One keyframe: [at] is the loop progress (0 → 1), [value] the value there.
class Keyframe {
  const Keyframe(this.at, this.value);
  final double at;
  final double value;
}

/// A CSS-like `@keyframes` track for one property (scale, opacity, offset…).
///
/// Like CSS, [curve] applies to each segment between two keyframes, not to
/// the whole track. [frames] must be sorted by `at` and hold at least two.
class KeyframeTrack {
  const KeyframeTrack(this.frames, {this.curve = KeyframeCurves.easeOutExpo});

  final List<Keyframe> frames;
  final Curve curve;

  double transform(double t) {
    final first = frames.first;
    final last = frames.last;
    if (t <= first.at) return first.value;
    if (t >= last.at) return last.value;

    for (var i = 0; i < frames.length - 1; i++) {
      final a = frames[i];
      final b = frames[i + 1];
      if (t >= a.at && t <= b.at) {
        final span = b.at - a.at;
        if (span <= 0) return b.value;
        final progress = curve.transform((t - a.at) / span);
        return a.value + (b.value - a.value) * progress;
      }
    }
    return last.value;
  }
}
