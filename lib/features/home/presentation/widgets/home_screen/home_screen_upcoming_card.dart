import 'package:flutter/material.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event_details/domain/model/guest_stats_model.dart';
import 'package:invit/features/home/presentation/utils/home_event_format.dart';
import 'package:invit/features/home/presentation/widgets/home_screen/home_screen_event_icon.dart';
import 'package:invit/features/home/presentation/widgets/home_screen/home_screen_replies_bar.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Card of the next upcoming event: countdown, type icon, title, details and
/// the replies summary.
class HomeScreenUpcomingCard extends StatelessWidget {
  const HomeScreenUpcomingCard({
    super.key,
    required this.event,
    required this.onTap,
  });

  final EventModel event;
  final VoidCallback onTap;

  static const double height = 318;
  static const double _radius = 30;
  static const double _iconCircleSize = 68;
  static const double _iconSize = 30;
  static const double _iconTop = 36;
  static const double _iconEnd = 24;
  static const double _badgeTop = 22;
  static const double _badgeHeight = 28;
  static const double _badgeDotSize = 6;
  static const double _sideInset = 20;
  static const double _titleTop = 118;
  static const double _titleLetterSpacing = -0.5;
  static const double _titleHeight = 1.1;
  static const double _repliesInset = 16;

  @override
  Widget build(BuildContext context) {
    final countdown = HomeEventFormat.countdown(event);
    final details = HomeEventFormat.whenAndWhere(context, event);

    return SizedBox(
      height: height,
      child: Material(
        color: AppColors.mist,
        borderRadius: BorderRadius.circular(_radius),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              PositionedDirectional(
                top: 0,
                end: 0,
                child: IgnorePointer(
                  child: Assets.icons.homeRingsBg.svg(matchTextDirection: true),
                ),
              ),
              PositionedDirectional(
                top: _iconTop,
                end: _iconEnd,
                child: HomeScreenEventIcon(
                  type: event.type,
                  size: _iconCircleSize,
                  iconSize: _iconSize,
                  radius: _iconCircleSize / 2,
                  backgroundColor: AppColors.white,
                ),
              ),
              if (countdown != null)
                PositionedDirectional(
                  top: _badgeTop,
                  start: _sideInset,
                  child: Container(
                    height: _badgeHeight,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: const ShapeDecoration(
                      color: AppColors.primary,
                      shape: StadiumBorder(),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 6,
                      children: [
                        Container(
                          width: _badgeDotSize,
                          height: _badgeDotSize,
                          decoration: const BoxDecoration(
                            color: AppColors.accent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          countdown,
                          style: AppTextStyle.outfitMedium12_5.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              PositionedDirectional(
                top: _titleTop,
                start: _sideInset,
                end: _sideInset,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      event.title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.outfitMedium25.copyWith(
                        color: AppColors.ink,
                        letterSpacing: _titleLetterSpacing,
                        height: _titleHeight,
                      ),
                    ),
                    if (details.isNotEmpty)
                      Text(
                        details,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.outfitRegular14.copyWith(
                          color: AppColors.inkBody,
                        ),
                      ),
                  ],
                ),
              ),
              PositionedDirectional(
                start: _repliesInset,
                end: _repliesInset,
                bottom: _repliesInset,
                child: HomeScreenRepliesBar(
                  stats: event.guestStats ?? const GuestStatsModel(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
