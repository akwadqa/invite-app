import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Messages left, the "not enough" warning and the recharge button, over the
/// concentric rings.
class BalanceScreenHero extends StatelessWidget {
  const BalanceScreenHero({
    super.key,
    required this.balance,
    required this.warningGuests,
    required this.onRecharge,
  });

  /// `null` while the balance is unknown.
  final int? balance;

  /// Guests the balance cannot cover; the warning is hidden when `null`.
  final int? warningGuests;
  final VoidCallback onRecharge;

  static const double _height = 220;
  static const double _radius = 30;
  static const double _inset = 22;
  static const double _balanceLetterSpacing = 64 * -0.05;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final guests = warningGuests;
    return SizedBox(
      height: _height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_radius),
        child: ColoredBox(
          color: AppColors.mist,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(painter: _HeroRingsPainter(isRtl: isRtl)),
              ),
              PositionedDirectional(
                start: _inset,
                top: 22,
                child: Text(
                  'balance_messages_left'.tr(),
                  style: AppTextStyle.outfitRegular14.copyWith(
                    color: AppColors.inkBody,
                  ),
                ),
              ),
              PositionedDirectional(
                start: 20,
                top: 44,
                child: Text(
                  balance?.toString() ?? '—',
                  style: AppTextStyle.outfitSemiBold64.copyWith(
                    color: AppColors.ink,
                    letterSpacing: _balanceLetterSpacing,
                    height: 1,
                  ),
                ),
              ),
              if (guests != null)
                PositionedDirectional(
                  start: _inset,
                  top: 116,
                  child: _BalanceScreenWarning(
                    text: 'balance_not_enough'.tr(args: ['$guests']),
                  ),
                ),
              PositionedDirectional(
                start: 16,
                end: 16,
                bottom: 16,
                height: 52,
                child: Material(
                  color: AppColors.primary,
                  shape: const StadiumBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: onRecharge,
                    splashColor: AppColors.whiteMuted.withValues(alpha: 0.12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Assets.icons.plusIc.svg(
                          width: 18,
                          height: 18,
                          colorFilter: const ColorFilter.mode(
                            AppColors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          'balance_recharge'.tr(),
                          style: AppTextStyle.outfitMedium16.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
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

class _BalanceScreenWarning extends StatelessWidget {
  const _BalanceScreenWarning({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.accentLight,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
            ),
            child: SizedBox.square(dimension: 6),
          ),
          Text(
            text,
            style: AppTextStyle.outfitMedium12_5.copyWith(
              color: AppColors.accentInk,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroRingsPainter extends CustomPainter {
  const _HeroRingsPainter({required this.isRtl});

  final bool isRtl;

  /// Radius, stroke width and opacity of each ring.
  static const List<(double, double, double)> _rings = [
    (60, 2, 0.9),
    (110, 1.4, 0.55),
    (164, 1, 0.35),
  ];
  static const double _centerInset = 48;
  static const double _centerTop = 40;

  @override
  void paint(Canvas canvas, Size size) {
    final dx = isRtl ? _centerInset : size.width - _centerInset;
    final center = Offset(dx, _centerTop);
    for (final (radius, width, opacity) in _rings) {
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..isAntiAlias = true
          ..style = PaintingStyle.stroke
          ..strokeWidth = width
          ..color = AppColors.white.withValues(alpha: opacity),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _HeroRingsPainter oldDelegate) =>
      oldDelegate.isRtl != isRtl;
}
