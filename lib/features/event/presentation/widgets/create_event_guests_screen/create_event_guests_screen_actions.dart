import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/utils/guest_list_import.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "Add a guest" and "Upload a list" cards.
class CreateEventGuestsScreenActions extends ConsumerWidget {
  const CreateEventGuestsScreenActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: _CreateEventGuestsScreenActionCard(
            title: 'create_guests_add_guest'.tr(),
            subtitle: 'create_guests_add_guest_hint'.tr(),
            icon: Assets.icons.plusIc,
            isPrimary: true,
            onTap: () {
              ref
                  .read(createEventFlowControllerProvider.notifier)
                  .startQuickAdd();
              context.push(AppRoutes.createEventQuickAddScreen);
            },
          ),
        ),
        Expanded(
          child: _CreateEventGuestsScreenActionCard(
            title: 'create_guests_upload_list'.tr(),
            subtitle: 'create_guests_upload_list_hint'.tr(),
            icon: Assets.icons.uploadIc,
            isPrimary: false,
            onTap: () => ref
                .read(createEventFlowControllerProvider.notifier)
                .importGuestList(GuestListImportOrigin.guests),
          ),
        ),
      ],
    );
  }
}

class _CreateEventGuestsScreenActionCard extends StatelessWidget {
  const _CreateEventGuestsScreenActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isPrimary,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final SvgGenImage icon;
  final bool isPrimary;
  final VoidCallback onTap;

  static const double _height = 96;
  static const double _radius = 22;
  static const double _badgeSize = 36;
  static const double _iconSize = 18;
  static const EdgeInsets _padding = EdgeInsets.all(14);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isPrimary ? AppColors.primary : AppColors.mist,
      borderRadius: BorderRadius.circular(_radius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: _height,
          child: Padding(
            padding: _padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: _badgeSize,
                  height: _badgeSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isPrimary ? AppColors.mist : AppColors.white,
                    shape: BoxShape.circle,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.outfitMedium16.copyWith(
                        color: isPrimary ? AppColors.white : AppColors.ink,
                      ),
                    ),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.outfitRegular12_5.copyWith(
                        height: 1.2,
                        color: isPrimary
                            ? AppColors.mistDark
                            : AppColors.inkLabel,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
