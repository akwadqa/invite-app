import 'package:flutter/material.dart';
import 'package:invit/features/splash/presentation/utils/splash_constants.dart';
import 'package:invit/src/core/utils/animation/keyframe_track.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// Three white ripples from the center: when the host appears (3%), mid
/// gathering (43%) and when the circle completes (70%).
///
/// [progress] is the shared loop; null draws the still state (reduced motion).
class SplashScreenRipples extends StatelessWidget {
  const SplashScreenRipples({super.key, required this.progress});

  final Animation<double>? progress;

  /// Ripple box in the design. Drawing grows past it up to ×2.4.
  static const double boxSize = 188;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: SizedBox.square(
        dimension: boxSize,
        child: CustomPaint(painter: _SplashScreenRipplesPainter(progress)),
      ),
    );
  }
}

class _Ripple {
  const _Ripple({
    required this.borderWidth,
    required this.scale,
    required this.opacity,
  });

  final double borderWidth;
  final KeyframeTrack scale;
  final KeyframeTrack opacity;
}

const _curve = SplashConstants.rippleEase;

const List<_Ripple> _ripples = [
  // @keyframes rip1
  _Ripple(
    borderWidth: 2,
    scale: KeyframeTrack(curve: _curve, [
      Keyframe(0.00, 0.15),
      Keyframe(0.03, 0.15),
      Keyframe(0.22, 1.9),
      Keyframe(1.00, 1.9),
    ]),
    opacity: KeyframeTrack(curve: _curve, [
      Keyframe(0.00, 0),
      Keyframe(0.03, 0.9),
      Keyframe(0.22, 0),
      Keyframe(1.00, 0),
    ]),
  ),
  // @keyframes rip2
  _Ripple(
    borderWidth: 2,
    scale: KeyframeTrack(curve: _curve, [
      Keyframe(0.00, 0.15),
      Keyframe(0.40, 0.15),
      Keyframe(0.43, 0.15),
      Keyframe(0.62, 1.9),
      Keyframe(1.00, 1.9),
    ]),
    opacity: KeyframeTrack(curve: _curve, [
      Keyframe(0.00, 0),
      Keyframe(0.40, 0),
      Keyframe(0.43, 0.7),
      Keyframe(0.62, 0),
      Keyframe(1.00, 0),
    ]),
  ),
  // @keyframes rip3
  _Ripple(
    borderWidth: 2.5,
    scale: KeyframeTrack(curve: _curve, [
      Keyframe(0.00, 0.15),
      Keyframe(0.67, 0.15),
      Keyframe(0.70, 0.15),
      Keyframe(0.90, 2.4),
      Keyframe(1.00, 2.4),
    ]),
    opacity: KeyframeTrack(curve: _curve, [
      Keyframe(0.00, 0),
      Keyframe(0.67, 0),
      Keyframe(0.70, 1),
      Keyframe(0.90, 0),
      Keyframe(1.00, 0),
    ]),
  ),
];

class _SplashScreenRipplesPainter extends CustomPainter {
  _SplashScreenRipplesPainter(this.progress) : super(repaint: progress);

  final Animation<double>? progress;

  static const double _minVisibleOpacity = 0.001;

  @override
  void paint(Canvas canvas, Size size) {
    final t = progress?.value;
    final center = size.center(Offset.zero);
    final halfBox = size.shortestSide / 2;

    for (final ripple in _ripples) {
      final scale = t == null ? 1.0 : ripple.scale.transform(t);
      final opacity = t == null
          ? 1.0
          : ripple.opacity.transform(t).clamp(0.0, 1.0);
      if (opacity <= _minVisibleOpacity) continue;

      // CSS scale grows the border too, so both radius and stroke scale.
      final radius = (halfBox - ripple.borderWidth / 2) * scale;
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = ripple.borderWidth * scale
        ..color = AppColors.white.withValues(alpha: opacity);
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(_SplashScreenRipplesPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
