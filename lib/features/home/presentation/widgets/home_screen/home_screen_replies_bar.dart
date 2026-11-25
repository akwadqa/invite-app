import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/event_details/domain/model/guest_stats_model.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// White box with the confirmed / no reply / declined bar and counts.
class HomeScreenRepliesBar extends StatelessWidget {
  const HomeScreenRepliesBar({super.key, required this.stats});

  final GuestStatsModel stats;

  static const double _radius = 20;
  static const double _barHeight = 8;
  static const double _barRadius = 4;
  static const double _segmentGap = 3;
  static const int _minFlex = 1;
  static const EdgeInsets _padding = EdgeInsets.all(14);

  @override
  Widget build(BuildContext context) {
    final hasGuests = stats.confirmed + stats.noReply + stats.declined > 0;
    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Column(
        spacing: 10,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(_barRadius),
            child: SizedBox(
              height: _barHeight,
              child: Row(
                spacing: _segmentGap,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: hasGuests
                    ? [
                        _segment(stats.confirmed, AppColors.primary),
                        _segment(stats.noReply, AppColors.accent),
                        _segment(stats.declined, AppColors.inkFaint),
                      ]
                    : const [_EmptySegment()],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _count(stats.confirmed, 'home_confirmed_count'),
              _count(stats.noReply, 'home_no_reply_count'),
              _count(stats.declined, 'home_declined_count'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _segment(int value, Color color) => Expanded(
    flex: value < _minFlex ? _minFlex : value,
    child: ColoredBox(color: color),
  );

  Widget _count(int value, String labelKey) => Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: '$value',
          style: AppTextStyle.outfitSemiBold14.copyWith(
            fontSize: AppTextStyle.outfitRegular13.fontSize,
            color: AppColors.ink,
          ),
        ),
        TextSpan(text: ' ${labelKey.tr()}'),
      ],
    ),
    style: AppTextStyle.outfitRegular13.copyWith(color: AppColors.inkBody),
  );
}

/// The whole bar in one gray when the event has no guests yet.
class _EmptySegment extends StatelessWidget {
  const _EmptySegment();

  @override
  Widget build(BuildContext context) =>
      const Expanded(child: ColoredBox(color: AppColors.mistDark));
}
