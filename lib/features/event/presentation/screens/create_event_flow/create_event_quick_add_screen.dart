import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_state.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/utils/guest_list_import.dart';
import 'package:invit/features/event/presentation/utils/guest_list_import_listener.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_layout.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_seats_label.dart';
import 'package:invit/features/event/presentation/widgets/create_event_quick_add_screen/create_event_quick_add_screen_form.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_initials_avatar.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/app_round_icon_button.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Step 4 (quick add): type guests one after another.
class CreateEventQuickAddScreen extends ConsumerWidget {
  const CreateEventQuickAddScreen({super.key});

  static const EdgeInsets _padding = EdgeInsets.fromLTRB(16, 12, 16, 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final added = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.recentlyAddedGuestIds.length,
      ),
    );

    return CreateEventFlowLayout(
      title: 'quick_add_title'.tr(),
      subtitle: 'quick_add_subtitle'.tr(),
      step: CreateEventFlowConstants.guestsStep,
      body: const Padding(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 12,
          children: [
            CreateEventQuickAddScreenForm(),
            _CreateEventQuickAddScreenSources(),
            Expanded(child: _CreateEventQuickAddScreenRecent()),
          ],
        ),
      ),
      bottom: AppPrimaryButton(
        label: added == 0
            ? 'quick_add_done_empty'.tr()
            : 'quick_add_done'.tr(args: ['$added']),
        icon: Assets.icons.checkIc,
        mirrorIconInRtl: false,
        onPressed: () {
          if (context.canPop()) context.pop();
        },
      ),
    );
  }
}

class _CreateEventQuickAddScreenSources extends ConsumerWidget {
  const _CreateEventQuickAddScreenSources();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    listenGuestListImport(
      context,
      ref,
      origin: GuestListImportOrigin.quickAdd,
      onImported: () => context.push(AppRoutes.createEventImportReviewScreen),
    );
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: _CreateEventQuickAddScreenSourceButton(
            icon: Assets.icons.uploadIc,
            label: 'create_guests_upload_list'.tr(),
            onTap: () => ref
                .read(createEventFlowControllerProvider.notifier)
                .importGuestList(GuestListImportOrigin.quickAdd),
          ),
        ),
        Expanded(
          child: _CreateEventQuickAddScreenSourceButton(
            icon: Assets.icons.userIc,
            label: 'create_guests_from_contacts'.tr(),
            onTap: () => context.push(AppRoutes.createEventContactsScreen),
          ),
        ),
      ],
    );
  }
}

class _CreateEventQuickAddScreenSourceButton extends StatelessWidget {
  const _CreateEventQuickAddScreenSourceButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final SvgGenImage icon;
  final String label;
  final VoidCallback onTap;

  static const double _height = 44;
  static const double _iconSize = 16;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      shape: const StadiumBorder(side: BorderSide(color: AppColors.mistDark)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: _height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              icon.svg(
                width: _iconSize,
                height: _iconSize,
                colorFilter: const ColorFilter.mode(
                  AppColors.ink,
                  BlendMode.srcIn,
                ),
              ),
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.outfitMedium14.copyWith(
                    color: AppColors.ink,
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

class _CreateEventQuickAddScreenRecent extends ConsumerWidget {
  const _CreateEventQuickAddScreenRecent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guests = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.recentlyAddedGuests,
      ),
    );
    if (guests.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'quick_add_just_added'.tr(),
                style: AppTextStyle.outfitMedium14.copyWith(
                  color: AppColors.ink,
                ),
              ),
              Text(
                'create_guests_count'.tr(args: ['${guests.length}']),
                style: AppTextStyle.outfitRegular13.copyWith(
                  color: AppColors.inkLabel,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: guests.length,
            separatorBuilder: (_, _) => const SizedBox(height: 6),
            itemBuilder: (context, index) =>
                _CreateEventQuickAddScreenRecentTile(guest: guests[index]),
          ),
        ),
      ],
    );
  }
}

class _CreateEventQuickAddScreenRecentTile extends ConsumerWidget {
  const _CreateEventQuickAddScreenRecentTile({required this.guest});

  final EventGuestDraft guest;

  static const double _avatarSize = 38;
  static const double _removeSize = 36;
  static const double _removeIconSize = 16;
  static const double _radius = 18;
  static const EdgeInsetsDirectional _padding = EdgeInsetsDirectional.fromSTEB(
    10,
    8,
    6,
    8,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.mistLight,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Row(
        spacing: 12,
        children: [
          AppInitialsAvatar(
            name: guest.name,
            size: _avatarSize,
            backgroundColor: AppColors.white,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  guest.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.outfitMedium15.copyWith(
                    color: AppColors.ink,
                  ),
                ),
                Text(
                  '${guest.phone.display} · ${seatsLabel(guest.seats)}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.outfitRegular12_5.copyWith(
                    color: AppColors.inkLabel,
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
          AppRoundIconButton(
            icon: Assets.icons.closeIc,
            size: _removeSize,
            iconSize: _removeIconSize,
            backgroundColor: AppColors.transparentPage,
            iconColor: AppColors.inkLabel,
            onTap: () => ref
                .read(createEventFlowControllerProvider.notifier)
                .removeGuest(guest.id),
          ),
        ],
      ),
    );
  }
}
