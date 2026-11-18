import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/home/presentation/utils/home_event_format.dart';
import 'package:invit/features/home/presentation/widgets/home_screen/home_screen_event_icon.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Compact event row; past events show how many guests attended.
class HomeScreenEventRow extends StatelessWidget {
  const HomeScreenEventRow({
    super.key,
    required this.event,
    required this.isPast,
    required this.onTap,
  });

  final EventModel event;
  final bool isPast;
  final VoidCallback onTap;

  static const double _radius = 20;
  static const double _chevronSize = 16;
  static const double _lineHeight = 1.25;
  static const EdgeInsets _padding = EdgeInsets.all(12);

  String _subtitle(BuildContext context) {
    if (!isPast) return HomeEventFormat.whenAndWhere(context, event);
    final attended = event.guestReport?.scannedCount;
    return [
      ?HomeEventFormat.fullDate(context, event),
      if (attended != null) 'home_attended'.tr(args: ['$attended']),
    ].join(' · ');
  }

  @override
  Widget build(BuildContext context) {
    final subtitle = _subtitle(context);
    return Material(
      color: AppColors.mistLight,
      borderRadius: BorderRadius.circular(_radius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: _padding,
          child: Row(
            spacing: 12,
            children: [
              HomeScreenEventIcon(type: event.type),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.outfitMedium15.copyWith(
                        color: AppColors.ink,
                        height: _lineHeight,
                      ),
                    ),
                    if (subtitle.isNotEmpty)
                      Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.outfitRegular13.copyWith(
                          color: AppColors.inkLabel,
                          height: _lineHeight,
                        ),
                      ),
                  ],
                ),
              ),
              Assets.icons.chevronRightIc.svg(
                width: _chevronSize,
                height: _chevronSize,
                matchTextDirection: true,
                colorFilter: const ColorFilter.mode(
                  AppColors.inkChevron,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
