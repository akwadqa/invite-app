import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event_details/domain/model/guest_report_model.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_actions_controller.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/event_details/presentation/widgets/event_details_screen/event_details_screen_replies_card.dart';
import 'package:invit/features/event_details/presentation/widgets/event_details_screen/event_details_screen_tiles.dart';
import 'package:invit/features/guest/presentation/utils/guest_reply_status.dart';
import 'package:invit/features/guest/presentation/utils/guests_screen_args.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:invit/features/home/presentation/utils/home_event_format.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_error_widget.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/app_screen_header.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';
import 'package:invit/src/core/utils/functions/async_action_listener.dart';
import 'package:invit/src/core/utils/functions/coming_soon.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Status of a draft event, as sent by the backend.
const String _draftStatus = 'Draft';

/// One event: replies, guest list and balance shortcuts, delivery or draft
/// banner and check-in.
class EventDetailsScreen extends ConsumerWidget {
  const EventDetailsScreen({super.key, required this.ocassionId});

  final String ocassionId;

  static const EdgeInsets _buttonPadding = EdgeInsets.fromLTRB(24, 0, 24, 36);

  /// Space under the content so it scrolls above the floating button:
  /// button height (64) + its bottom gap (36) + breathing room.
  static const double contentBottomPadding = 64 + 36 + 24;

  void _back(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.mainScreen);
    }
  }

  void _listenActions(BuildContext context, WidgetRef ref) {
    final provider = eventDetailsActionsControllerProvider(ocassionId);
    ref.listen(
      provider.select((state) => state.sendInvitations),
      (previous, next) => handleAsyncAction(
        context,
        previous,
        next,
        onSettled: (result) => result.hasError
            ? AppToast.errorToast(result.error.toString())
            : AppToast.doneToast('details_sent_done'.tr()),
      ),
    );
    ref.listen(
      provider.select((state) => state.resendFailed),
      (previous, next) => handleAsyncAction(
        context,
        previous,
        next,
        onSettled: (result) => result.hasError
            ? AppToast.errorToast(result.error.toString())
            : AppToast.doneToast('details_resend_done'.tr()),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listenActions(context, ref);
    final event = ref.watch(
      eventDetailsControllerProvider(ocassionId: ocassionId),
    );
    final data = event.value;
    final isDraft = data?.status == _draftStatus;

    return PopScope(
      canPop: context.canPop(),
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) context.go(AppRoutes.mainScreen);
      },
      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        body: Stack(
          children: [
            Column(
              children: [
                AppScreenHeader(
                  title: data?.title ?? '',
                  subtitle: data == null
                      ? null
                      : HomeEventFormat.whenAndWhere(context, data),
                  subtitleMaxLines: null,
                  onBack: () => _back(context),
                  trailing: data == null
                      ? null
                      : _EventDetailsScreenMoreButton(
                          event: data,
                          canEdit: isDraft,
                        ),
                ),
                Expanded(
                  child: event.when(
                    data: (data) => _EventDetailsScreenBody(
                      event: data,
                      occasionId: ocassionId,
                    ),
                    error: (error, _) => AppErrorWidget(
                      errorMsg: error.toString(),
                      onTap: () => ref
                          .read(
                            eventDetailsControllerProvider(
                              ocassionId: ocassionId,
                            ).notifier,
                          )
                          .retry(),
                    ),
                    loading: () => const _EventDetailsScreenSkeleton(),
                  ),
                ),
              ],
            ),
            if (data != null && !isDraft)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: _buttonPadding,
                    child: AppPrimaryButton(
                      label: 'details_check_in'.tr(),
                      icon: Assets.icons.qrIc,
                      mirrorIconInRtl: false,
                      onPressed: () =>
                          context.push(AppRoutes.scanQr, extra: ocassionId),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _EventDetailsScreenBody extends ConsumerWidget {
  const _EventDetailsScreenBody({
    required this.event,
    required this.occasionId,
  });

  final EventModel event;
  final String occasionId;

  static const EdgeInsets _padding = EdgeInsets.fromLTRB(
    16,
    2,
    16,
    EventDetailsScreen.contentBottomPadding,
  );
  static const double _gap = 8;

  void _openGuests(BuildContext context, [GuestReplyStatus? filter]) {
    context.push(
      AppRoutes.guestsScreen,
      extra: GuestsScreenArgs(occasionId: occasionId, filter: filter),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = event.guestReport ?? const GuestReportModel();
    final isDraft = event.status == _draftStatus;
    final noReply = report.pending + report.notSent;
    final balance = ref.watch(
      homeControllerProvider.select((home) => home.value?.remainingBalance),
    );
    final actions = ref.read(
      eventDetailsActionsControllerProvider(occasionId).notifier,
    );

    return RefreshIndicator(
      color: AppColors.ink,
      onRefresh: ref
          .read(eventDetailsControllerProvider(ocassionId: occasionId).notifier)
          .refresh,
      child: ListView(
        padding: _padding,
        children: [
          EventDetailsScreenRepliesCard(
            report: report,
            isDraft: isDraft,
            onStatusTap: (status) => _openGuests(context, status),
          ),
          const SizedBox(height: _gap),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: EventDetailsScreenTile(
                  icon: Assets.icons.usersIc,
                  title: 'details_guest_list'.tr(),
                  subtitle: 'details_guests_count'.tr(
                    args: ['${report.totalInvitees}'],
                  ),
                  onTap: () => _openGuests(context),
                ),
              ),
              Expanded(
                child: EventDetailsScreenTile(
                  icon: Assets.icons.chatBubbleIc,
                  title: 'details_balance'.tr(),
                  subtitle: balance == null
                      ? null
                      : 'details_messages'.tr(args: ['$balance']),
                  onTap: () => context.push(AppRoutes.paymentScreen),
                ),
              ),
            ],
          ),
          if (isDraft) ...[
            const SizedBox(height: _gap),
            EventDetailsScreenBanner(
              highlight: 'details_draft_banner'.tr(),
              message: 'details_draft_banner_suffix'.tr(),
              actionLabel: 'details_send'.tr(),
              onAction: actions.sendInvitations,
            ),
          ] else ...[
            if (report.failed > 0) ...[
              const SizedBox(height: _gap),
              EventDetailsScreenBanner(
                highlight: 'details_not_delivered_banner'.tr(
                  args: ['${report.failed}'],
                ),
                message: 'details_not_delivered_suffix'.tr(),
                actionLabel: 'details_resend'.tr(),
                onAction: actions.resendFailed,
              ),
            ],
            if (noReply > 0) ...[
              const SizedBox(height: _gap),
              EventDetailsScreenBanner(
                highlight: 'details_remind_highlight'.tr(args: ['$noReply']),
                message: 'details_remind_suffix'.tr(),
                actionLabel: 'details_remind'.tr(),
                // TODO(backend): no endpoint to remind guests who have not
                // replied yet. Wire it here when it exists.
                onAction: showComingSoon,
              ),
            ],
          ],
        ],
      ),
    );
  }
}

class _EventDetailsScreenSkeleton extends StatelessWidget {
  const _EventDetailsScreenSkeleton();

  static const EdgeInsets _padding = EdgeInsets.fromLTRB(16, 2, 16, 24);
  static const double _gap = 8;
  static const GuestReportModel _placeholder = GuestReportModel(
    totalInvitees: 100,
    confirmed: 60,
    pending: 25,
    declined: 10,
    failed: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView(
        padding: _padding,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          EventDetailsScreenRepliesCard(
            report: _placeholder,
            isDraft: false,
            isPlaceholder: true,
            onStatusTap: (_) {},
          ),
          const SizedBox(height: _gap),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: EventDetailsScreenTile(
                  icon: Assets.icons.usersIc,
                  title: 'Guest list',
                  subtitle: '100 guests',
                  onTap: () {},
                ),
              ),
              Expanded(
                child: EventDetailsScreenTile(
                  icon: Assets.icons.chatBubbleIc,
                  title: 'Balance',
                  subtitle: '100 messages',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// "More" button with the event's options (editing a draft).
class _EventDetailsScreenMoreButton extends StatelessWidget {
  const _EventDetailsScreenMoreButton({
    required this.event,
    required this.canEdit,
  });

  final EventModel event;

  /// Only draft events can be edited.
  final bool canEdit;

  static const double _size = 44;
  static const double _iconSize = 18;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<VoidCallback>(
      color: AppColors.white,
      padding: EdgeInsets.zero,
      onSelected: (action) => action(),
      // TODO(design): the design shows this button without its options; only
      // "Edit event" exists for now. Add the other options when they are known.
      itemBuilder: (_) => [
        PopupMenuItem(
          enabled: canEdit,
          value: () => context.push(AppRoutes.updateEventScreen, extra: event),
          child: Text(
            'details_edit_event'.tr(),
            style: AppTextStyle.outfitMedium14.copyWith(
              color: canEdit ? AppColors.ink : AppColors.inkMuted,
            ),
          ),
        ),
      ],
      child: Container(
        width: _size,
        height: _size,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.mistSoft,
          shape: BoxShape.circle,
        ),
        child: Assets.icons.moreHorizontalIc.svg(
          width: _iconSize,
          height: _iconSize,
          colorFilter: const ColorFilter.mode(AppColors.ink, BlendMode.srcIn),
        ),
      ),
    );
  }
}
