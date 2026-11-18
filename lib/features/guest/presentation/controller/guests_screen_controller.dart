import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/guest/presentation/controller/guests_screen_state.dart';
import 'package:invit/features/guest/presentation/utils/guest_reply_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guests_screen_controller.g.dart';

/// Search text and reply filter of an event's guest list.
@riverpod
class GuestsScreenController extends _$GuestsScreenController {
  @override
  GuestsScreenState build(String occasionId) => const GuestsScreenState();

  void search(String query) => state = state.copyWith(query: query);

  void selectFilter(GuestReplyStatus? filter) =>
      state = state.copyWith(filter: filter);
}

/// The event's guests matching the current search and filter.
@riverpod
List<GuestModel> filteredGuests(Ref ref, String occasionId) {
  final guests = ref.watch(
    eventDetailsControllerProvider(
      ocassionId: occasionId,
    ).select((event) => event.value?.guestList ?? const <GuestModel>[]),
  );
  final screen = ref.watch(guestsScreenControllerProvider(occasionId));
  final query = screen.query.trim().toLowerCase();
  final digitsQuery = query.replaceAll(RegExp(r'\D'), '');

  return guests.where((guest) {
    final filter = screen.filter;
    if (filter != null && GuestReplyStatus.of(guest) != filter) return false;
    if (query.isEmpty) return true;
    final name = (guest.fullName ?? '').toLowerCase();
    final number = guest.whatsappNumber ?? '';
    return name.contains(query) ||
        (digitsQuery.isNotEmpty && number.contains(digitsQuery));
  }).toList();
}

/// Number of guests per reply status, for the filter chips.
@riverpod
Map<GuestReplyStatus, int> guestReplyCounts(Ref ref, String occasionId) {
  final guests = ref.watch(
    eventDetailsControllerProvider(
      ocassionId: occasionId,
    ).select((event) => event.value?.guestList ?? const <GuestModel>[]),
  );
  final counts = {for (final status in GuestReplyStatus.values) status: 0};
  for (final guest in guests) {
    final status = GuestReplyStatus.of(guest);
    counts[status] = (counts[status] ?? 0) + 1;
  }
  return counts;
}
