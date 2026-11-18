import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/utils/guest_list_import.dart';
import 'package:invit/features/event/presentation/utils/guest_list_import_listener.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_field.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_layout.dart';
import 'package:invit/features/event/presentation/widgets/create_event_guests_screen/create_event_guests_screen_actions.dart';
import 'package:invit/features/event/presentation/widgets/create_event_guests_screen/create_event_guests_screen_tile.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/app_round_icon_button.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Step 4: the guests who receive the invitation.
class CreateEventGuestsScreen extends ConsumerWidget {
  const CreateEventGuestsScreen({super.key});

  static const EdgeInsets _padding = EdgeInsets.fromLTRB(20, 12, 20, 0);
  static const double _actionsGap = 18;
  static const double _summaryGap = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    listenGuestListImport(
      context,
      ref,
      origin: GuestListImportOrigin.guests,
      onImported: () => context.push(AppRoutes.createEventImportReviewScreen),
    );
    final isEditing = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.isEditingFromReview,
      ),
    );
    final hasGuests = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.guests.isNotEmpty,
      ),
    );

    return CreateEventFlowLayout(
      title: 'create_guests_title'.tr(),
      subtitle: 'create_guests_subtitle'.tr(),
      step: CreateEventFlowConstants.guestsStep,
      isBottomFloating: true,
      body: const Padding(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CreateEventGuestsScreenActions(),
            SizedBox(height: _actionsGap),
            _CreateEventGuestsScreenSummary(),
            SizedBox(height: _summaryGap),
            Expanded(child: _CreateEventGuestsScreenList()),
          ],
        ),
      ),
      bottom: AppPrimaryButton(
        label: isEditing ? 'create_edit_done'.tr() : 'create_guests_next'.tr(),
        onPressed: () {
          if (!hasGuests) {
            AppToast.errorToast('create_guests_required'.tr());
            return;
          }
          CreateEventFlowNavigation.next(
            context,
            ref,
            AppRoutes.createEventImageScreen,
          );
        },
      ),
    );
  }
}

class _CreateEventGuestsScreenSummary extends ConsumerStatefulWidget {
  const _CreateEventGuestsScreenSummary();

  @override
  ConsumerState<_CreateEventGuestsScreenSummary> createState() =>
      _CreateEventGuestsScreenSummaryState();
}

class _CreateEventGuestsScreenSummaryState
    extends ConsumerState<_CreateEventGuestsScreenSummary> {
  static const double _buttonSize = 40;

  late final TextEditingController _search;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _search = TextEditingController(
      text: ref.read(createEventFlowControllerProvider).guestQuery,
    );
    _isSearching = _search.text.isNotEmpty;
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    if (_isSearching) {
      _search.clear();
      ref.read(createEventFlowControllerProvider.notifier).searchGuests('');
    }
    setState(() => _isSearching = !_isSearching);
  }

  @override
  Widget build(BuildContext context) {
    final guests = ref.watch(
      createEventFlowControllerProvider.select((state) => state.guests.length),
    );
    final seats = ref.watch(
      createEventFlowControllerProvider.select((state) => state.totalSeats),
    );

    return Column(
      spacing: 10,
      children: [
        Row(
          children: [
            Expanded(
              child: Text.rich(
                TextSpan(
                  text: 'create_guests_count'.tr(args: ['$guests']),
                  style: AppTextStyle.outfitMedium15.copyWith(
                    color: AppColors.ink,
                  ),
                  children: [
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: 'create_guests_seats_count'.tr(args: ['$seats']),
                      style: AppTextStyle.outfitRegular15.copyWith(
                        color: AppColors.inkLabel,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppRoundIconButton(
              icon: _isSearching ? Assets.icons.closeIc : Assets.icons.searchIc,
              size: _buttonSize,
              onTap: _toggleSearch,
            ),
          ],
        ),
        if (_isSearching)
          CreateEventFlowTextField(
            controller: _search,
            hint: 'create_guests_search_hint'.tr(),
            textInputAction: TextInputAction.search,
            onChanged: ref
                .read(createEventFlowControllerProvider.notifier)
                .searchGuests,
          ),
      ],
    );
  }
}

class _CreateEventGuestsScreenList extends ConsumerWidget {
  const _CreateEventGuestsScreenList();

  static const EdgeInsets _emptyPadding = EdgeInsets.only(top: 24);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guests = ref.watch(
      createEventFlowControllerProvider.select((state) => state.visibleGuests),
    );
    if (guests.isEmpty) {
      return Padding(
        padding: _emptyPadding,
        child: Text(
          'create_guests_empty'.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyle.outfitRegular14.copyWith(
            color: AppColors.inkLabel,
          ),
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.only(
        bottom: CreateEventFlowLayout.floatingBottomPadding(context),
      ),
      itemCount: guests.length,
      itemBuilder: (context, index) =>
          CreateEventGuestsScreenTile(guest: guests[index]),
    );
  }
}
