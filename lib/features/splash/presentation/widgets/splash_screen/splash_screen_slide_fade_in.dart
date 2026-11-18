import 'package:flutter/material.dart';
import 'package:invit/src/core/utils/animation/keyframe_track.dart';

/// Applies keyframed opacity and vertical offset to [child] on every tick.
/// With a null [progress] (reduced motion) the child stays in its final state.
class SplashScreenSlideFadeIn extends StatelessWidget {
  const SplashScreenSlideFadeIn({
    super.key,
    required this.progress,
    required this.opacity,
    required this.translateY,
    required this.child,
  });

  final Animation<double>? progress;
  final KeyframeTrack opacity;
  final KeyframeTrack translateY;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final progress = this.progress;
    if (progress == null) return child;

    return AnimatedBuilder(
      animation: progress,
      child: child,
      builder: (context, child) {
        final t = progress.value;
        return Opacity(
          opacity: opacity.transform(t).clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(0, translateY.transform(t)),
            child: child,
          ),
        );
      },
    );
  }
}
