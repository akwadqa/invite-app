import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/scan/presentation/controller/find_guest_controller.dart';
import 'package:invit/features/scan/presentation/widgets/find_guest_screen/find_guest_screen_row.dart';
import 'package:invit/features/scan/presentation/widgets/find_guest_screen/find_guest_screen_search_field.dart';
import 'package:invit/features/scan/presentation/widgets/find_guest_screen/find_guest_screen_walk_in_button.dart';
import 'package:invit/src/core/shared_widgets/app_empty_data_widget.dart';
import 'package:invit/src/core/shared_widgets/app_error_widget.dart';
import 'package:invit/src/core/shared_widgets/app_screen_header.dart';
import 'package:invit/src/core/utils/functions/coming_soon.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Looks a guest up by name or number among the event's guests, for guests
/// who came without their QR code.
class FindGuestScreen extends ConsumerStatefulWidget {
  const FindGuestScreen({super.key, required this.occasionId});

  /// Reads the route extra; an id that is missing or malformed gives `''`.
  factory FindGuestScreen.from(Object? extra) =>
      FindGuestScreen(occasionId: extra is String ? extra : '');

  final String occasionId;

  @override
  ConsumerState<FindGuestScreen> createState() => _FindGuestScreenState();
}

class _FindGuestScreenState extends ConsumerState<FindGuestScreen> {
  static const EdgeInsets _searchPadding = EdgeInsets.fromLTRB(16, 8, 16, 0);
  static const EdgeInsets _countPadding = EdgeInsets.fromLTRB(24, 16, 24, 10);
  static const EdgeInsets _buttonPadding = EdgeInsets.fromLTRB(24, 0, 24, 36);

  final TextEditingController _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final id = widget.occasionId;
    if (id.isEmpty) {
      return Scaffold(
        backgroundColor: AppColors.pageBackground,
        body: Column(
          children: [
            AppScreenHeader(title: 'find_guest_title'.tr()),
            const Expanded(child: AppErrorWidget(onTap: null)),
          ],
        ),
      );
    }

    final event = ref.watch(eventDetailsControllerProvider(ocassionId: id));
    final arrived = event.value?.guestReport?.scannedCount;
    final matches = ref.watch(findGuestMatchesProvider(id));

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              AppScreenHeader(
                title: 'find_guest_title'.tr(),
                subtitle: 'find_guest_subtitle'.tr(),
                trailing: arrived == null
                    ? null
                    : _FindGuestScreenArrivedChip(arrived: arrived),
              ),
              Padding(
                padding: _searchPadding,
                child: FindGuestScreenSearchField(
                  controller: _search,
                  onChanged: ref
                      .read(findGuestControllerProvider(id).notifier)
                      .search,
                ),
              ),
              Expanded(
                child: event.when(
                  data: (_) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: _countPadding,
                        child: Text(
                          matches.length == 1
                              ? 'find_guest_one_match'.tr()
                              : 'find_guest_matches'.tr(
                                  args: ['${matches.length}'],
                                ),
                          style: AppTextStyle.outfitRegular13.copyWith(
                            color: AppColors.inkLabel,
                          ),
                        ),
                      ),
                      Expanded(child: _FindGuestScreenList(guests: matches)),
                    ],
                  ),
                  error: (error, _) => AppErrorWidget(
                    errorMsg: error.toString(),
                    onTap: () => ref
                        .read(
                          eventDetailsControllerProvider(
                            ocassionId: id,
                          ).notifier,
                        )
                        .retry(),
                  ),
                  loading: () => const _FindGuestScreenSkeleton(),
                ),
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
                // TODO(backend): adding a walk-in guest at the door has no
                // endpoint yet.
                child: FindGuestScreenWalkInButton(onTap: showComingSoon),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FindGuestScreenList extends StatelessWidget {
  const _FindGuestScreenList({required this.guests});

  final List<GuestModel> guests;

  /// Room under the last guest for the floating walk-in button:
  /// button height (56) + its bottom gap (36) + breathing room.
  static const double _bottomPadding = 56 + 36 + 24;
  static const double _gap = 8;

  @override
  Widget build(BuildContext context) {
    if (guests.isEmpty) {
      return const AppEmptyDataWidget(text: 'find_guest_empty');
    }
    final keyboard = MediaQuery.viewInsetsOf(context).bottom;
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(16, 0, 16, _bottomPadding + keyboard),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: guests.length,
      separatorBuilder: (_, _) => const SizedBox(height: _gap),
      itemBuilder: (context, index) => FindGuestScreenRow(
        guest: guests[index],
        // TODO(backend): no endpoint checks a guest in by hand, and the guest
        // list does not say who already arrived (the "In · time" state).
        onCheckIn: showComingSoon,
      ),
    );
  }
}

class _FindGuestScreenSkeleton extends StatelessWidget {
  const _FindGuestScreenSkeleton();

  static const int _rows = 5;
  static const double _gap = 8;
  static const EdgeInsets _padding = EdgeInsets.fromLTRB(16, 40, 16, 0);
  static const GuestModel _placeholder = GuestModel(
    fullName: 'Guest full name',
    partySize: 2,
    rsvpStatus: 'Confirmed',
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.separated(
        padding: _padding,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _rows,
        separatorBuilder: (_, _) => const SizedBox(height: _gap),
        itemBuilder: (_, _) =>
            FindGuestScreenRow(guest: _placeholder, onCheckIn: () {}),
      ),
    );
  }
}

/// "144 arrived" pill in the header.
class _FindGuestScreenArrivedChip extends StatelessWidget {
  const _FindGuestScreenArrivedChip({required this.arrived});

  final int arrived;

  static const double _height = 32;
  static const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 12);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: _padding,
      alignment: Alignment.center,
      decoration: const ShapeDecoration(
        color: AppColors.mist,
        shape: StadiumBorder(),
      ),
      child: Text(
        '$arrived ${'scan_arrived'.tr()}',
        style: AppTextStyle.outfitMedium13.copyWith(color: AppColors.ink),
      ),
    );
  }
}
