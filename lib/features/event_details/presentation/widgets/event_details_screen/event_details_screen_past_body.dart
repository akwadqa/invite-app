import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event_details/domain/model/guest_report_model.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/event_details/presentation/widgets/event_details_screen/event_details_screen_final_replies.dart';
import 'package:invit/features/event_details/presentation/widgets/event_details_screen/event_details_screen_past_hero.dart';
import 'package:invit/features/event_details/presentation/widgets/event_details_screen/event_details_screen_tiles.dart';
import 'package:invit/features/guest/presentation/utils/guest_reply_status.dart';
import 'package:invit/features/guest/presentation/utils/guests_screen_args.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/application/router/app_routes.dart';

/// Body of an event that already took place: attendance, final replies and
/// the guest list / messages shortcuts.
class EventDetailsScreenPastBody extends ConsumerWidget {
  const EventDetailsScreenPastBody({
    super.key,
    required this.event,
    required this.occasionId,
    required this.bottomPadding,
  });

  final EventModel event;
  final String occasionId;

  /// Space kept under the content for the floating button.
  final double bottomPadding;

  static const double _heroGap = 16;
  static const double _repliesGap = 36;
  static const double _tileGap = 8;
  static const int _percent = 100;
  static const double _top = 14;

  /// Seats of the confirmed guests, when the event came with its guest list.
  int? _confirmedSeats() {
    final guests = event.guestList;
    if (guests == null || guests.isEmpty) return null;
    return guests
        .where(
          (guest) => GuestReplyStatus.of(guest) == GuestReplyStatus.confirmed,
        )
        .fold<int>(0, (sum, guest) => sum + (guest.partySize ?? 0));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = event.guestReport ?? const GuestReportModel();
    final attendancePercent = report.confirmed == 0
        ? 0
        : (report.scannedCount * _percent / report.confirmed).round();
    // TODO(backend): the report has no count of messages sent. Guests that
    // were not left unsent are used until the backend sends it.
    final messagesUsed = report.totalInvitees - report.notSent;

    return RefreshIndicator(
      onRefresh: ref
          .read(eventDetailsControllerProvider(ocassionId: occasionId).notifier)
          .refresh,
      child: ListView(
        padding: EdgeInsets.fromLTRB(16, _top, 16, bottomPadding),
        children: [
          EventDetailsScreenPastHero(
            attended: report.scannedCount,
            attendancePercent: attendancePercent,
            confirmed: report.confirmed,
            seats: _confirmedSeats(),
          ),
          const SizedBox(height: _heroGap),
          EventDetailsScreenFinalReplies(report: report),
          const SizedBox(height: _repliesGap),
          Row(
            spacing: _tileGap,
            children: [
              Expanded(
                child: EventDetailsScreenTile(
                  icon: Assets.icons.usersIc,
                  title: 'details_guest_list'.tr(),
                  subtitle: 'details_who_came'.tr(),
                  // TODO(backend): guests have no attendance field, so this
                  // lists the confirmed ones instead of who actually came.
                  onTap: () => context.push(
                    AppRoutes.guestsScreen,
                    extra: GuestsScreenArgs(
                      occasionId: occasionId,
                      filter: GuestReplyStatus.confirmed,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: EventDetailsScreenTile(
                  icon: Assets.icons.chatBubbleIc,
                  title: 'details_messages'.tr(args: ['$messagesUsed']),
                  subtitle: 'details_used'.tr(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
