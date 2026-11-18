import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_state.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_seats_label.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/shared_widgets/app_initials_avatar.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// One guest row: initials, name, number, seats and a menu to remove.
class CreateEventGuestsScreenTile extends ConsumerWidget {
  const CreateEventGuestsScreenTile({super.key, required this.guest});

  final EventGuestDraft guest;

  static const double _height = 64;
  static const double _menuIconSize = 18;
  static const double _menuWidth = 32;
  static const double _menuHeight = 40;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: _height,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.mistDivider)),
      ),
      child: Row(
        spacing: 12,
        children: [
          AppInitialsAvatar(name: guest.name),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  guest.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.outfitMedium15_5.copyWith(
                    color: AppColors.ink,
                  ),
                ),
                Text(
                  guest.phone.display,
                  textDirection: TextDirection.ltr,
                  style: AppTextStyle.outfitRegular13.copyWith(
                    color: AppColors.inkLabel,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: const ShapeDecoration(
              color: AppColors.mistLight,
              shape: StadiumBorder(),
            ),
            child: Text(
              seatsLabel(guest.seats),
              style: AppTextStyle.outfitMedium12_5.copyWith(
                color: AppColors.inkBody,
              ),
            ),
          ),
          SizedBox(
            width: _menuWidth,
            height: _menuHeight,
            child: PopupMenuButton<VoidCallback>(
              padding: EdgeInsets.zero,
              color: AppColors.white,
              icon: Assets.icons.moreVerticalIc.svg(
                width: _menuIconSize,
                height: _menuIconSize,
                colorFilter: const ColorFilter.mode(
                  AppColors.inkLabel,
                  BlendMode.srcIn,
                ),
              ),
              onSelected: (action) => action(),
              itemBuilder: (_) => [
                PopupMenuItem(
                  value: () => ref
                      .read(createEventFlowControllerProvider.notifier)
                      .removeGuest(guest.id),
                  child: Text(
                    'create_guests_remove'.tr(),
                    style: AppTextStyle.outfitMedium14.copyWith(
                      color: AppColors.dangerInk,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
