import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

const Duration _loopDuration = Duration(milliseconds: 2400);

class _Keyframe {
  const _Keyframe(this.at, this.value);

  final double at;
  final double value;
}

double _track(List<_Keyframe> frames, double t, Curve curve) {
  if (t <= frames.first.at) return frames.first.value;
  for (var i = 0; i < frames.length - 1; i++) {
    final a = frames[i];
    final b = frames[i + 1];
    if (t <= b.at) {
      final span = b.at - a.at;
      if (span <= 0) return b.value;
      return a.value + (b.value - a.value) * curve.transform((t - a.at) / span);
    }
  }
  return frames.last.value;
}

/// Repeats forever and hands the builder the loop progress (0..1); `null`
/// when the user asked for reduced motion.
class _LoopBuilder extends StatefulWidget {
  const _LoopBuilder({required this.builder});

  final Widget Function(BuildContext context, double? t) builder;

  @override
  State<_LoopBuilder> createState() => _LoopBuilderState();
}

class _LoopBuilderState extends State<_LoopBuilder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: _loopDuration,
  );
  bool _reduceMotion = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reduceMotion = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    if (_reduceMotion) {
      _controller.stop();
    } else if (!_controller.isAnimating) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_reduceMotion) return widget.builder(context, null);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => widget.builder(context, _controller.value),
    );
  }
}

/// White rings spreading out of [center].
class CheckoutRedirectScreenRipple extends StatelessWidget {
  const CheckoutRedirectScreenRipple({super.key, required this.center});

  final Offset center;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: _LoopBuilder(
        builder: (context, t) => CustomPaint(
          size: Size.infinite,
          painter: _RipplePainter(t, center),
        ),
      ),
    );
  }
}

class _RipplePainter extends CustomPainter {
  _RipplePainter(this.t, this.center);

  final double? t;
  final Offset center;

  static const double _radius = 150;
  static const List<double> _delays = [0, 0.8 / 2.4, 1.6 / 2.4];
  static const double _minScale = 0.55;
  static const double _maxScale = 1.25;
  static const double _maxOpacity = 0.9;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    for (final delay in _delays) {
      final double scale;
      final double opacity;
      final progress = t;
      if (progress == null) {
        scale = 1;
        opacity = 1;
      } else {
        final p = Curves.easeOut.transform(((progress - delay) % 1 + 1) % 1);
        scale = _minScale + (_maxScale - _minScale) * p;
        opacity = _maxOpacity * (1 - p);
      }
      if (opacity <= 0.001) continue;
      paint
        ..strokeWidth = 2 * scale
        ..color = AppColors.white.withValues(alpha: opacity);
      canvas.drawCircle(center, _radius * scale, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _RipplePainter old) =>
      old.t != t || old.center != center;
}

/// Guests gathering around a lock.
class CheckoutRedirectScreenLoader extends StatelessWidget {
  const CheckoutRedirectScreenLoader({super.key, this.size = 140});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'checkout_redirect_loading'.tr(),
      image: true,
      child: SizedBox.square(
        dimension: size,
        child: _LoopBuilder(
          builder: (context, t) => CustomPaint(painter: _GatherPainter(t)),
        ),
      ),
    );
  }
}

class _GatherPainter extends CustomPainter {
  _GatherPainter(this.t);

  final double? t;

  static const Cubic _curve = Cubic(0.45, 0, 0.2, 1);
  static const List<Offset> _guests = [
    Offset(72.6, 27.4),
    Offset(82, 50),
    Offset(72.6, 72.6),
    Offset(50, 82),
    Offset(27.4, 72.6),
    Offset(18, 50),
    Offset(27.4, 27.4),
  ];
  static const List<_Keyframe> _scale = [
    _Keyframe(0, 1.35),
    _Keyframe(0.45, 1),
    _Keyframe(0.60, 1),
    _Keyframe(1, 1.35),
  ];
  static const List<_Keyframe> _opacity = [
    _Keyframe(0, 0.35),
    _Keyframe(0.45, 1),
    _Keyframe(0.60, 1),
    _Keyframe(1, 0.35),
  ];
  static const Offset _center = Offset(50, 50);
  static const double _guestRadius = 7.5;
  static const double _stagger = 0.08 / 2.4;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / 100, size.height / 100);
    final paint = Paint()..isAntiAlias = true;
    final progress = t;

    for (var i = 0; i < _guests.length; i++) {
      var scale = 1.0;
      var opacity = 1.0;
      if (progress != null) {
        final local = ((progress - i * _stagger) % 1 + 1) % 1;
        scale = _track(_scale, local, _curve);
        opacity = _track(_opacity, local, _curve);
      }
      paint.color = AppColors.ink.withValues(alpha: opacity.clamp(0.0, 1.0));
      canvas.drawCircle(
        _center + (_guests[i] - _center) * scale,
        _guestRadius * scale,
        paint,
      );
    }

    // The host dot on top, then the lock in a white disc.
    paint.color = AppColors.accent;
    canvas.drawCircle(const Offset(50, 18), 9, paint);
    paint.color = AppColors.white;
    canvas.drawCircle(_center, 12, paint);

    canvas.save();
    canvas.translate(43.5, 42.5);
    canvas.scale(0.55);
    canvas.drawPath(
      Path()
        ..addRRect(RRect.fromLTRBR(3, 11, 21, 23, const Radius.circular(2.5)))
        ..moveTo(7, 11)
        ..lineTo(7, 7)
        ..arcToPoint(
          const Offset(17, 7),
          radius: const Radius.circular(5),
          clockwise: true,
        )
        ..lineTo(17, 11),
      Paint()
        ..isAntiAlias = true
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.4
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..color = AppColors.primary,
    );
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _GatherPainter old) => old.t != t;
}
