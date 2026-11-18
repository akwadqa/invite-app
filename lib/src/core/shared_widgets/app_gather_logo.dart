import 'package:flutter/material.dart';
import 'package:invit/src/core/utils/animation/keyframe_track.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// The animated invite logo: seven guests gather one by one around the host
/// (accent dot), then the core pops in the middle. Drawn in the SVG's 100×100
/// viewBox and scaled to [size]. Used by the splash and the loading dialog.
///
/// [progress] is the loop (0 → 1); null draws the still state (reduced motion).
class AppGatherLogo extends StatelessWidget {
  const AppGatherLogo({super.key, required this.progress, required this.size});

  final Animation<double>? progress;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CustomPaint(painter: _AppGatherLogoPainter(progress)),
    );
  }
}

/// A guest: final position (cx, cy) and start offset (dx, dy).
class _Guest {
  const _Guest(this.cx, this.cy, this.dx, this.dy);
  final double cx, cy, dx, dy;
}

const double _guestRadius = 7.5;

const List<_Guest> _guests = [
  _Guest(72.6, 27.4, 34, -40),
  _Guest(82.0, 50.0, 46, 14),
  _Guest(72.6, 72.6, 26, 48),
  _Guest(50.0, 82.0, -10, 52),
  _Guest(27.4, 72.6, -44, 32),
  _Guest(18.0, 50.0, -52, -8),
  _Guest(27.4, 27.4, -30, -46),
];

/// Tracks for one guest; each guest starts 4% after the previous one.
class _GuestTracks {
  _GuestTracks(int index)
    : _hold = _firstHold + _stagger * index,
      _arrive = _firstArrive + _stagger * index,
      _settle = _firstSettle + _stagger * index;

  static const double _stagger = 0.04;
  static const double _firstHold = 0.12;
  static const double _firstArrive = 0.32;
  static const double _firstSettle = 0.36;

  final double _hold, _arrive, _settle;

  /// 1 = at the start offset, 0 = at the final position.
  late final KeyframeTrack offset = KeyframeTrack([
    const Keyframe(0.00, 1),
    const Keyframe(0.08, 1),
    Keyframe(_hold, 1),
    Keyframe(_arrive, 0),
    Keyframe(_settle, 0),
    const Keyframe(0.88, 0),
    const Keyframe(0.95, 0),
    const Keyframe(1.00, 1),
  ]);

  late final KeyframeTrack scale = KeyframeTrack([
    const Keyframe(0.00, 0.55),
    const Keyframe(0.08, 0.55),
    Keyframe(_hold, 0.55),
    Keyframe(_arrive, 1.15),
    Keyframe(_settle, 1),
    const Keyframe(0.88, 1),
    const Keyframe(0.95, 1),
    const Keyframe(1.00, 0.55),
  ]);

  late final KeyframeTrack opacity = KeyframeTrack([
    const Keyframe(0.00, 0),
    const Keyframe(0.08, 1),
    Keyframe(_hold, 1),
    Keyframe(_arrive, 1),
    const Keyframe(0.88, 1),
    const Keyframe(0.95, 0),
    const Keyframe(1.00, 0),
  ]);
}

final List<_GuestTracks> _guestTracks = List.generate(
  _guests.length,
  _GuestTracks.new,
);

// Host (@keyframes host): pops in below its spot, then jumps up into place.
const Offset _hostCenter = Offset(50, 18);
const double _hostRadius = 9;

const _hostTranslateY = KeyframeTrack([
  Keyframe(0.00, 32),
  Keyframe(0.05, 32),
  Keyframe(0.09, 32),
  Keyframe(0.58, 32),
  Keyframe(0.66, -3),
  Keyframe(0.70, 0),
  Keyframe(0.88, 0),
  Keyframe(0.95, 0),
  Keyframe(1.00, 32),
]);

const _hostScale = KeyframeTrack([
  Keyframe(0.00, 0.3),
  Keyframe(0.05, 1.2),
  Keyframe(0.09, 1),
  Keyframe(0.58, 1),
  Keyframe(0.66, 1.12),
  Keyframe(0.70, 1),
  Keyframe(0.88, 1),
  Keyframe(0.95, 1),
  Keyframe(1.00, 0.3),
]);

const _hostOpacity = KeyframeTrack([
  Keyframe(0.00, 0),
  Keyframe(0.05, 1),
  Keyframe(0.88, 1),
  Keyframe(0.95, 0),
  Keyframe(1.00, 0),
]);

// Core (@keyframes core).
const Offset _coreCenter = Offset(50, 50);
const double _coreRadius = 6;

const _coreScale = KeyframeTrack([
  Keyframe(0.00, 0),
  Keyframe(0.66, 0),
  Keyframe(0.71, 1.35),
  Keyframe(0.75, 1),
  Keyframe(0.88, 1),
  Keyframe(0.95, 1),
  Keyframe(1.00, 1),
]);

const _coreOpacity = KeyframeTrack([
  Keyframe(0.00, 1),
  Keyframe(0.88, 1),
  Keyframe(0.95, 0),
  Keyframe(1.00, 0),
]);

class _AppGatherLogoPainter extends CustomPainter {
  _AppGatherLogoPainter(this.progress) : super(repaint: progress);

  final Animation<double>? progress;

  static const double _viewBox = 100;
  static const double _minVisibleOpacity = 0.001;

  @override
  void paint(Canvas canvas, Size size) {
    final t = progress?.value;
    canvas.save();
    canvas.scale(size.width / _viewBox, size.height / _viewBox);
    final paint = Paint();

    // 1) Guests (drawn first, as in the SVG).
    for (var i = 0; i < _guests.length; i++) {
      final guest = _guests[i];
      final tracks = _guestTracks[i];
      final k = t == null ? 0.0 : tracks.offset.transform(t);

      _dot(
        canvas,
        paint,
        center: Offset(guest.cx + guest.dx * k, guest.cy + guest.dy * k),
        radius: _guestRadius * (t == null ? 1.0 : tracks.scale.transform(t)),
        color: AppColors.ink,
        opacity: t == null ? 1.0 : tracks.opacity.transform(t),
      );
    }

    // 2) Core.
    _dot(
      canvas,
      paint,
      center: _coreCenter,
      radius: _coreRadius * (t == null ? 1.0 : _coreScale.transform(t)),
      color: AppColors.accentSecondary,
      opacity: t == null ? 1.0 : _coreOpacity.transform(t),
    );

    // 3) Host, on top of everything.
    _dot(
      canvas,
      paint,
      center: _hostCenter.translate(
        0,
        t == null ? 0.0 : _hostTranslateY.transform(t),
      ),
      radius: _hostRadius * (t == null ? 1.0 : _hostScale.transform(t)),
      color: AppColors.accent,
      opacity: t == null ? 1.0 : _hostOpacity.transform(t),
    );

    canvas.restore();
  }

  void _dot(
    Canvas canvas,
    Paint paint, {
    required Offset center,
    required double radius,
    required Color color,
    required double opacity,
  }) {
    final alpha = opacity.clamp(0.0, 1.0);
    if (alpha <= _minVisibleOpacity || radius <= 0) return;
    paint.color = color.withValues(alpha: color.a * alpha);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(_AppGatherLogoPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
