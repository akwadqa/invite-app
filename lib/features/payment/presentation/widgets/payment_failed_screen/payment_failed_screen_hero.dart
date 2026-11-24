import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// The pink block with the scattered guests and the red cross in the middle.
class PaymentFailedScreenHero extends StatelessWidget {
  const PaymentFailedScreenHero({super.key});

  static const double _height = 360;
  static const double _bottomRadius = 48;
  static const double _badgeSize = 56;
  static const double _badgeTop = 172;
  static const double _crossSize = 24;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(_bottomRadius),
        ),
        child: ColoredBox(
          color: AppColors.dangerMist,
          child: Stack(
            children: [
              Positioned.fill(
                child: Semantics(
                  label: 'payment_failed_icon'.tr(),
                  image: true,
                  child: const CustomPaint(painter: _ScatteredPainter()),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: _badgeTop,
                child: Center(
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: AppColors.dangerInk,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: AppColors.dangerMist, spreadRadius: 6),
                      ],
                    ),
                    child: SizedBox.square(
                      dimension: _badgeSize,
                      child: Center(
                        child: Assets.icons.closeIc.svg(
                          width: _crossSize,
                          height: _crossSize,
                          colorFilter: const ColorFilter.mode(
                            AppColors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Guest dots lying around instead of gathered, drawn on the 390pt-wide
/// layout of the design and centred on the real width.
class _ScatteredPainter extends CustomPainter {
  const _ScatteredPainter();

  static const double _designWidth = 390;
  static const List<Offset> _large = [
    Offset(110, 140),
    Offset(292, 128),
    Offset(318, 236),
    Offset(196, 296),
    Offset(76, 250),
  ];
  static const List<Offset> _small = [Offset(150, 96), Offset(250, 300)];

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate((size.width - _designWidth) / 2, 0);
    final guest = Paint()..color = AppColors.ink.withValues(alpha: 0.8);
    for (final center in _large) {
      canvas.drawCircle(center, 9, guest);
    }
    for (final center in _small) {
      canvas.drawCircle(center, 7, guest);
    }
    canvas.drawCircle(
      const Offset(195, 200),
      13,
      Paint()..color = AppColors.accent,
    );
  }

  @override
  bool shouldRepaint(covariant _ScatteredPainter oldDelegate) => false;
}
