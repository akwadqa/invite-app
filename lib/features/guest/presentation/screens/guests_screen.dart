import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event_details/presentation/utils/reminder_audience.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/guest/presentation/controller/guests_screen_controller.dart';
import 'package:invit/features/guest/presentation/utils/guests_screen_args.dart';
import 'package:invit/features/home/presentation/utils/home_event_format.dart';
import 'package:invit/features/guest/presentation/widgets/guests_screen/guests_screen_filters.dart';
import 'package:invit/features/guest/presentation/utils/guest_reply_status.dart';
import 'package:invit/features/guest/presentation/widgets/guests_screen/guests_screen_guest_sheet.dart';
import 'package:invit/features/guest/presentation/widgets/guests_screen/guests_screen_search_field.dart';
import 'package:invit/features/guest/presentation/widgets/guests_screen/guests_screen_tile.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_empty_data_widget.dart';
import 'package:invit/src/core/shared_widgets/app_error_widget.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/app_round_icon_button.dart';
import 'package:invit/src/core/shared_widgets/app_screen_header.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Status of an event whose invitations were sent, as sent by the backend.
const String _confirmedStatus = 'Confirmed';

/// An event's guests with search, reply filters and a details sheet.
class GuestsScreen extends ConsumerStatefulWidget {
  const GuestsScreen({super.key, required this.args});

  final GuestsScreenArgs args;

  @override
  ConsumerState<GuestsScreen> createState() => _GuestsScreenState();
}

class _GuestsScreenState extends ConsumerState<GuestsScreen> {
  static const EdgeInsets _searchPadding = EdgeInsets.fromLTRB(16, 6, 16, 12);
  static const EdgeInsets _buttonPadding = EdgeInsets.fromLTRB(24, 0, 24, 36);
  static const double _listTopGap = 16;

  final TextEditingController _search = TextEditingController();

  String get _occasionId => widget.args.occasionId;

  @override
  void initState() {
    super.initState();
    final filter = widget.args.filter;
    if (filter == null) return;
    // Providers cannot change while the first frame is being built.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref
          .read(guestsScreenControllerProvider(_occasionId).notifier)
          .selectFilter(filter);
    });
  }

  void _openReminder(ReminderAudience audience) {
    context.push(
      AppRoutes.sendReminderScreen,
      extra: SendReminderScreenArgs(
        occasionId: _occasionId,
        audience: audience,
      ),
    );
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final event = ref.watch(
      eventDetailsControllerProvider(ocassionId: _occasionId),
    );
    final guests = event.value?.guestList ?? const <GuestModel>[];
    final seats = guests.fold(0, (sum, guest) => sum + (guest.partySize ?? 0));
    // Once the event is over its guests can no longer be opened, changed or
    // reminded.
    final isPast = event.value != null && HomeEventFormat.isPast(event.value!);
    final canAddGuests =
        event.hasValue && !isPast && event.value?.status != _confirmedStatus;

    final filter = ref.watch(
      guestsScreenControllerProvider(_occasionId).select((s) => s.filter),
    );
    final counts = ref.watch(guestReplyCountsProvider(_occasionId));
    final failed = counts[GuestReplyStatus.notDelivered] ?? 0;
    final noReply = counts[GuestReplyStatus.noReply] ?? 0;
    // The bottom action of the "No reply" and "Not delivered" tabs.
    final action = isPast
        ? null
        : switch (filter) {
            GuestReplyStatus.noReply when noReply > 0 => (
              label: 'guests_remind'.tr(args: ['$noReply']),
              subtitle: 'guests_uses_messages'.tr(args: ['$noReply']),
              onPressed: () => _openReminder(ReminderAudience.noReply),
            ),
            GuestReplyStatus.notDelivered when failed > 0 => (
              label: 'guests_fix_resend'.tr(),
              subtitle: 'guests_fix_resend_subtitle'.tr(
                args: ['$failed', '$failed'],
              ),
              // TODO(backend): no endpoint to fix a guest's number before
              // resending; the resend screen only resends the failed
              // invitations for now.
              onPressed: () => context.push(
                AppRoutes.resendFailedScreen,
                extra: _occasionId,
              ),
            ),
            _ => null,
          };

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              AppScreenHeader(
                title: 'guests_title'.tr(),
                subtitle: event.hasValue
                    ? 'guests_summary'.tr(args: ['${guests.length}', '$seats'])
                    : null,
                trailing: canAddGuests
                    ? AppRoundIconButton(
                        icon: Assets.icons.plusIc,
                        backgroundColor: AppColors.primary,
                        iconColor: AppColors.white,
                        onTap: () => context.push(
                          AppRoutes.updateGuestListScreen,
                          extra: _occasionId,
                        ),
                      )
                    : null,
              ),
              Padding(
                padding: _searchPadding,
                child: GuestsScreenSearchField(
                  controller: _search,
                  onChanged: ref
                      .read(
                        guestsScreenControllerProvider(_occasionId).notifier,
                      )
                      .search,
                ),
              ),
              GuestsScreenFilters(occasionId: _occasionId),
              const SizedBox(height: _listTopGap),
              Expanded(
                child: event.when(
                  data: (_) => _GuestsScreenList(
                    occasionId: _occasionId,
                    hasFloatingButton: action != null,
                    isPast: isPast,
                  ),
                  error: (error, _) => AppErrorWidget(
                    errorMsg: error.toString(),
                    onTap: () => ref
                        .read(
                          eventDetailsControllerProvider(
                            ocassionId: _occasionId,
                          ).notifier,
                        )
                        .retry(),
                  ),
                  loading: () => const _GuestsScreenSkeleton(),
                ),
              ),
            ],
          ),
          if (action != null)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: _buttonPadding,
                  child: AppPrimaryButton(
                    label: action.label,
                    subtitle: action.subtitle,
                    icon: Assets.icons.sendIc,
                    onPressed: action.onPressed,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _GuestsScreenList extends ConsumerWidget {
  const _GuestsScreenList({
    required this.occasionId,
    required this.hasFloatingButton,
    required this.isPast,
  });

  final String occasionId;

  /// Guests of a past event are only listed, not opened.
  final bool isPast;

  /// Leaves room under the last guest for the floating resend button:
  /// button height (64) + its bottom gap (36) + breathing room.
  final bool hasFloatingButton;

  static const double _bottomPadding = 20;
  static const double _bottomPaddingWithButton = 64 + 36 + 24;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guests = ref.watch(filteredGuestsProvider(occasionId));
    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: ref
          .read(eventDetailsControllerProvider(ocassionId: occasionId).notifier)
          .refresh,
      child: guests.isEmpty
          ? ListView(children: [AppEmptyDataWidget(text: 'guests_empty')])
          : ListView.builder(
              padding: EdgeInsets.fromLTRB(
                16,
                0,
                16,
                hasFloatingButton ? _bottomPaddingWithButton : _bottomPadding,
              ),
              itemCount: guests.length,
              itemBuilder: (context, index) {
                final guest = guests[index];
                return GuestsScreenTile(
                  guest: guest,
                  onTap: isPast
                      ? null
                      : () => GuestsScreenGuestSheet.show(
                          context,
                          guest: guest,
                          occasionId: occasionId,
                        ),
                );
              },
            ),
    );
  }
}

class _GuestsScreenSkeleton extends StatelessWidget {
  const _GuestsScreenSkeleton();

  static const int _rows = 6;
  static const GuestModel _placeholder = GuestModel(
    fullName: 'Guest full name',
    whatsappNumber: '97400000000',
    partySize: 2,
    rsvpStatus: 'Confirmed',
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _rows,
        itemBuilder: (_, _) =>
            GuestsScreenTile(guest: _placeholder, onTap: () {}),
      ),
    );
  }
}
