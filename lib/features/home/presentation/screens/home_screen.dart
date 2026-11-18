import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event_details/domain/model/guest_report_model.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:invit/features/home/presentation/widgets/home_screen/home_screen_event_row.dart';
import 'package:invit/features/home/presentation/widgets/home_screen/home_screen_header.dart';
import 'package:invit/features/home/presentation/widgets/home_screen/home_screen_upcoming_card.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_error_widget.dart';
import 'package:invit/src/core/shared_widgets/app_pagination_widget.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// "My events": the next upcoming event, the other upcoming ones and the
/// past ones, with a button to create a new invitation.
@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const EdgeInsets _headerPadding = EdgeInsets.fromLTRB(20, 6, 16, 0);
  static const EdgeInsets _buttonPadding = EdgeInsets.fromLTRB(24, 0, 24, 36);

  /// Space kept under the lists so the last item can scroll above the
  /// floating button: button height (64) + its bottom gap (36) + breathing room.
  static const double listBottomPadding = 64 + 36 + 24;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(
      homeControllerProvider.select(
        (home) => (
          isLoading: home.isLoading && !home.hasValue,
          error: home.hasValue ? null : home.error,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: Stack(
        children: [
          Column(
            children: [
              const SafeArea(
                bottom: false,
                child: Padding(
                  padding: _headerPadding,
                  child: HomeScreenHeader(),
                ),
              ),
              Expanded(
                child: status.isLoading
                    ? const _HomeScreenSkeleton()
                    : status.error != null
                    ? AppErrorWidget(
                        errorMsg: status.error.toString(),
                        onTap: () =>
                            ref.read(homeControllerProvider.notifier).retry(),
                      )
                    : const _HomeScreenEvents(),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: _buttonPadding,
                child: AppPrimaryButton(
                  label: 'home_create_invitation'.tr(),
                  icon: Assets.icons.plusIc,
                  mirrorIconInRtl: false,
                  onPressed: () =>
                      context.push(AppRoutes.createEventTypeScreen),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeScreenEvents extends ConsumerWidget {
  const _HomeScreenEvents();

  static const EdgeInsets _listPadding = EdgeInsets.fromLTRB(
    16,
    0,
    16,
    HomeScreen.listBottomPadding,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sections = ref.watch(homeEventSectionsProvider);
    final notifier = ref.read(homeControllerProvider.notifier);
    if (sections.isEmpty) return const _HomeScreenEmpty();

    final upcoming = sections.upcoming;
    void open(EventModel event) {
      final id = event.eventId;
      if (id != null) context.push(AppRoutes.eventDetails, extra: id);
    }

    return AppPaginationWidget(
      enablePullDown: true,
      onRefresh: notifier.refresh,
      onLoading: (_) => notifier.loadNextPage(),
      child: ListView(
        padding: _listPadding,
        children: [
          if (upcoming.isNotEmpty) ...[
            _HomeScreenSectionTitle(title: 'home_upcoming'.tr(), isFirst: true),
            HomeScreenUpcomingCard(
              event: upcoming.first,
              onTap: () => open(upcoming.first),
            ),
            for (final event in upcoming.skip(1)) ...[
              const SizedBox(height: 8),
              HomeScreenEventRow(
                event: event,
                isPast: false,
                onTap: () => open(event),
              ),
            ],
          ],
          if (sections.past.isNotEmpty) ...[
            _HomeScreenSectionTitle(
              title: 'home_past'.tr(),
              isFirst: upcoming.isEmpty,
            ),
            for (final event in sections.past) ...[
              HomeScreenEventRow(
                event: event,
                isPast: true,
                onTap: () => open(event),
              ),
              const SizedBox(height: 8),
            ],
          ],
        ],
      ),
    );
  }
}

class _HomeScreenSectionTitle extends StatelessWidget {
  const _HomeScreenSectionTitle({required this.title, this.isFirst = false});

  final String title;

  /// The first title sits closer to the header than the ones after a section.
  final bool isFirst;

  static const double _firstTop = 22;
  static const double _top = 26;
  static const double _bottom = 10;
  static const double _start = 8;
  static const double _letterSpacing = 1.04;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: _start,
        top: isFirst ? _firstTop : _top,
        bottom: _bottom,
      ),
      child: Text(
        title.toUpperCase(),
        style: AppTextStyle.outfitMedium13.copyWith(
          color: AppColors.inkLabel,
          letterSpacing: _letterSpacing,
        ),
      ),
    );
  }
}

class _HomeScreenEmpty extends ConsumerWidget {
  const _HomeScreenEmpty();

  static const double _iconCircleSize = 88;
  static const double _iconSize = 40;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      color: AppColors.ink,
      onRefresh: ref.read(homeControllerProvider.notifier).refresh,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          32,
          80,
          32,
          HomeScreen.listBottomPadding,
        ),
        children: [
          Center(
            child: Container(
              width: _iconCircleSize,
              height: _iconCircleSize,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.mist,
                shape: BoxShape.circle,
              ),
              child: Assets.icons.ringsIc.svg(
                width: _iconSize,
                height: _iconSize,
                colorFilter: const ColorFilter.mode(
                  AppColors.accentInk,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'home_empty_title'.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyle.outfitMedium20.copyWith(color: AppColors.ink),
          ),
          const SizedBox(height: 6),
          Text(
            'home_empty_subtitle'.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyle.outfitRegular14.copyWith(
              color: AppColors.inkLabel,
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeScreenSkeleton extends StatelessWidget {
  const _HomeScreenSkeleton();

  static const EdgeInsets _padding = EdgeInsets.fromLTRB(
    16,
    0,
    16,
    HomeScreen.listBottomPadding,
  );
  static const EventModel _placeholder = EventModel(
    title: 'Event title placeholder',
    dateTime: '2030-01-01 20:00:00',
    locationName: 'Venue name',
    guestReport: GuestReportModel(confirmed: 10, pending: 5, declined: 2),
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView(
        padding: _padding,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const _HomeScreenSectionTitle(title: 'Upcoming', isFirst: true),
          HomeScreenUpcomingCard(event: _placeholder, onTap: () {}),
          const _HomeScreenSectionTitle(title: 'Past'),
          for (var i = 0; i < 2; i++) ...[
            HomeScreenEventRow(event: _placeholder, isPast: true, onTap: () {}),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}
