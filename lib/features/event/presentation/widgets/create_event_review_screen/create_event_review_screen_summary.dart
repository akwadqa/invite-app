import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/src/core/shared_widgets/app_initials_avatar.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Event title, date, time and venue with the image thumbnail.
class CreateEventReviewScreenSummary extends ConsumerWidget {
  const CreateEventReviewScreenSummary({super.key, required this.onEdit});

  final VoidCallback onEdit;

  static const double _radius = 22;
  static const double _thumbWidth = 64;
  static const double _thumbHeight = 80;
  static const double _thumbRadius = 10;
  static const double _lineHeight = 1.3;
  static const EdgeInsets _padding = EdgeInsets.all(14);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(
      createEventFlowControllerProvider.select((state) => state.title.trim()),
    );
    final dateTime = ref.watch(
      createEventFlowControllerProvider.select((state) => state.dateTime),
    );
    final venue = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.venue.trim().isEmpty
            ? state.location?.locationName
            : state.venue.trim(),
      ),
    );
    final image = ref.watch(
      createEventFlowControllerProvider.select((state) => state.image),
    );
    final locale = context.locale.toString();
    final when = dateTime == null
        ? null
        : '${DateFormat('EEE, d MMM yyyy', locale).format(dateTime)} · '
              '${DateFormat.jm(locale).format(dateTime)}';

    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.mist,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Row(
        spacing: 14,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(_thumbRadius),
            child: SizedBox(
              width: _thumbWidth,
              height: _thumbHeight,
              child: image != null
                  ? Image.file(image, fit: BoxFit.cover)
                  : ColoredBox(
                      color: AppColors.paper,
                      child: Center(
                        child: Text(
                          AppInitialsAvatar.initialsOf(title),
                          style: AppTextStyle.outfitMedium14.copyWith(
                            color: AppColors.inkBody,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  title,
                  style: AppTextStyle.outfitMedium17.copyWith(
                    color: AppColors.ink,
                  ),
                ),
                if (when != null) _line(when),
                if (venue != null) _line(venue),
              ],
            ),
          ),
          TextButton(
            onPressed: onEdit,
            child: Text(
              'create_review_edit'.tr(),
              style: AppTextStyle.outfitMedium14.copyWith(
                color: AppColors.ink,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Wraps instead of cutting, so the card grows to show the whole text.
  Widget _line(String text) => Text(
    text,
    style: AppTextStyle.outfitRegular13_5.copyWith(
      color: AppColors.inkBody,
      height: _lineHeight,
    ),
  );
}
