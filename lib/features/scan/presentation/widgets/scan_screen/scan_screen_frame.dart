import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// White corner brackets with the animated scan line moving between them.
class ScanScreenFrame extends StatefulWidget {
  const ScanScreenFrame({super.key});

  static const double size = 230;

  @override
  State<ScanScreenFrame> createState() => _ScanScreenFrameState();
}

class _ScanScreenFrameState extends State<ScanScreenFrame>
    with SingleTickerProviderStateMixin {
  static const Duration _sweepDuration = Duration(milliseconds: 2200);
  static const double _lineHeight = 3;
  static const double _lineInset = 14;
  static const double _lineTravel = ScanScreenFrame.size - 2 * _lineInset;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: _sweepDuration,
  );
  late final Animation<double> _curve = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.maybeDisableAnimationsOf(context) ?? false) {
      _controller.stop();
    } else if (!_controller.isAnimating) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: ScanScreenFrame.size,
      child: Stack(
        children: [
          const Positioned.fill(
            child: CustomPaint(painter: _ScanScreenFramePainter()),
          ),
          AnimatedBuilder(
            animation: _curve,
            builder: (context, child) => Positioned(
              left: _lineInset,
              right: _lineInset,
              top: _lineInset + _lineTravel * _curve.value,
              height: _lineHeight,
              child: child!,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(2),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.7),
                    blurRadius: 14,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScanScreenFramePainter extends CustomPainter {
  const _ScanScreenFramePainter();

  static const double _stroke = 5;
  static const Radius _radius = Radius.circular(14);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / ScanScreenFrame.size);
    final path = Path()
      ..moveTo(4, 50)
      ..lineTo(4, 18)
      ..arcToPoint(const Offset(18, 4), radius: _radius)
      ..lineTo(50, 4)
      ..moveTo(180, 4)
      ..lineTo(212, 4)
      ..arcToPoint(const Offset(226, 18), radius: _radius)
      ..lineTo(226, 50)
      ..moveTo(226, 180)
      ..lineTo(226, 212)
      ..arcToPoint(const Offset(212, 226), radius: _radius)
      ..lineTo(180, 226)
      ..moveTo(50, 226)
      ..lineTo(18, 226)
      ..arcToPoint(const Offset(4, 212), radius: _radius)
      ..lineTo(4, 180);
    canvas.drawPath(
      path,
      Paint()
        ..color = AppColors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = _stroke
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
