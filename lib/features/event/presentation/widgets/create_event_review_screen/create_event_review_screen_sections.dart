import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Message, guests and image rows; each one opens its step again.
class CreateEventReviewScreenSections extends ConsumerWidget {
  const CreateEventReviewScreenSections({
    super.key,
    required this.onMessage,
    required this.onGuests,
    required this.onImage,
  });

  final VoidCallback onMessage;
  final VoidCallback onGuests;
  final VoidCallback onImage;

  static const double _radius = 22;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final template = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.selectedTemplate,
      ),
    );
    final guests = ref.watch(
      createEventFlowControllerProvider.select((state) => state.guests.length),
    );
    final seats = ref.watch(
      createEventFlowControllerProvider.select((state) => state.totalSeats),
    );
    final imageName = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.image?.uri.pathSegments.lastOrNull,
      ),
    );
    final templateTitle = template?.templateName ?? template?.name ?? '';

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(_radius),
        border: Border.all(color: AppColors.mistOutline),
      ),
      child: Column(
        children: [
          _CreateEventReviewScreenSection(
            icon: Assets.icons.chatBubbleIc,
            title: 'create_review_message'.tr(),
            subtitle: 'create_review_reply_buttons'.tr(
              args: [templateTitle, '${template?.buttons?.length ?? 0}'],
            ),
            onTap: onMessage,
          ),
          const Divider(height: 1, color: AppColors.mistDivider),
          _CreateEventReviewScreenSection(
            icon: Assets.icons.usersIc,
            title: 'create_review_guests'.tr(),
            subtitle: 'create_review_guests_summary'.tr(
              args: ['$guests', '$seats'],
            ),
            onTap: onGuests,
          ),
          const Divider(height: 1, color: AppColors.mistDivider),
          _CreateEventReviewScreenSection(
            icon: Assets.icons.imageIc,
            title: 'create_review_image'.tr(),
            subtitle: imageName ?? 'create_review_no_image'.tr(),
            onTap: onImage,
          ),
        ],
      ),
    );
  }
}

class _CreateEventReviewScreenSection extends StatelessWidget {
  const _CreateEventReviewScreenSection({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final SvgGenImage icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  static const double _iconBoxSize = 40;
  static const double _iconSize = 18;
  static const double _chevronSize = 16;
  static const EdgeInsets _padding = EdgeInsets.all(14);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: _padding,
        child: Row(
          spacing: 12,
          children: [
            Container(
              width: _iconBoxSize,
              height: _iconBoxSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.mistSoft,
                borderRadius: BorderRadius.circular(12),
              ),
              child: icon.svg(
                width: _iconSize,
                height: _iconSize,
                colorFilter: const ColorFilter.mode(
                  AppColors.ink,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.outfitMedium15.copyWith(
                      color: AppColors.ink,
                    ),
                  ),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.outfitRegular13.copyWith(
                      color: AppColors.inkLabel,
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
    );
  }
}
