import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:invit/src/core/shared_widgets/app_gather_logo.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Past event: how many guests came and what share of the confirmed ones.
class EventDetailsScreenPastHero extends StatelessWidget {
  const EventDetailsScreenPastHero({
    super.key,
    required this.attended,
    required this.attendancePercent,
    required this.confirmed,
    required this.seats,
  });

  final int attended;
  final int attendancePercent;
  final int confirmed;

  /// Seats of the confirmed guests; `null` when the guest list is not known.
  final int? seats;

  static const double _height = 150;
  static const double _radius = 28;
  static const double _logoSize = 64;
  static const double _logoEnd = 26;
  static const double _logoTop = 43;
  static const double _labelStart = 20;
  static const double _labelTop = 20;
  static const double _numberStart = 18;
  static const double _numberTop = 42;
  static const double _numberLetterSpacing = -2.8;
  static const double _summaryTop = 108;
  static const double _summaryEnd = 110;

  @override
  Widget build(BuildContext context) {
    final seats = this.seats;
    return SizedBox(
      height: _height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_radius),
        child: ColoredBox(
          color: AppColors.mist,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _EventDetailsScreenPastHeroRingsPainter(
                    isRtl: Directionality.of(context) == TextDirection.rtl,
                  ),
                ),
              ),
              PositionedDirectional(
                end: _logoEnd,
                top: _logoTop,
                child: Semantics(
                  label: 'details_past_logo'.tr(),
                  image: true,
                  child: const AppGatherLogo(progress: null, size: _logoSize),
                ),
              ),
              PositionedDirectional(
                start: _labelStart,
                top: _labelTop,
                child: Text(
                  'details_attended_title'.tr(),
                  style: AppTextStyle.outfitRegular14.copyWith(
                    color: AppColors.inkBody,
                  ),
                ),
              ),
              PositionedDirectional(
                start: _numberStart,
                top: _numberTop,
                child: Text(
                  '$attended',
                  style: AppTextStyle.outfitSemiBold56.copyWith(
                    color: AppColors.ink,
                    letterSpacing: _numberLetterSpacing,
                    height: 1,
                  ),
                ),
              ),
              PositionedDirectional(
                start: _labelStart,
                top: _summaryTop,
                end: _summaryEnd,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '$attendancePercent%',
                        style: AppTextStyle.outfitSemiBold13_5.copyWith(
                          color: AppColors.ink,
                        ),
                      ),
                      TextSpan(
                        text: 'details_attended_of'.tr(args: ['$confirmed']),
                      ),
                      if (seats != null)
                        TextSpan(
                          text: 'details_attended_seats'.tr(args: ['$seats']),
                        ),
                    ],
                  ),
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.visible,
                  style: AppTextStyle.outfitRegular13_5.copyWith(
                    color: AppColors.inkBody,
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

/// Rings around the logo, centred on it.
class _EventDetailsScreenPastHeroRingsPainter extends CustomPainter {
  const _EventDetailsScreenPastHeroRingsPainter({required this.isRtl});

  final bool isRtl;

  static const double _centerFromEnd = 58;
  static const double _centerY = 75;

  /// Radius, stroke width and opacity of each ring.
  static const List<(double, double, double)> _rings = [
    (44, 2, 0.9),
    (80, 1.4, 0.55),
    (120, 1, 0.35),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      isRtl ? _centerFromEnd : size.width - _centerFromEnd,
      _centerY,
    );
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
  bool shouldRepaint(_EventDetailsScreenPastHeroRingsPainter oldDelegate) =>
      oldDelegate.isRtl != isRtl;
}
