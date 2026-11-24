import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/scan/presentation/controller/find_guest_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'find_guest_controller.g.dart';

/// Search text of the "find a guest" screen of one event.
@riverpod
class FindGuestController extends _$FindGuestController {
  @override
  FindGuestState build(String occasionId) => const FindGuestState();

  void search(String query) => state = state.copyWith(query: query);
}

/// The event's guests whose name or number match the current search.
@riverpod
List<GuestModel> findGuestMatches(Ref ref, String occasionId) {
  final guests = ref.watch(
    eventDetailsControllerProvider(
      ocassionId: occasionId,
    ).select((event) => event.value?.guestList ?? const <GuestModel>[]),
  );
  final query = ref.watch(
    findGuestControllerProvider(occasionId).select((state) => state.query),
  );
  final name = _stripSpaces(query.trim());
  if (name.isEmpty) return guests;
  final digits = query.replaceAll(RegExp(r'\D'), '');

  return guests.where((guest) {
    final guestName = _stripSpaces(guest.fullName ?? '');
    final number = guest.whatsappNumber ?? '';
    return guestName.contains(name) ||
        (digits.isNotEmpty && number.contains(digits));
  }).toList();
}

String _stripSpaces(String text) =>
    text.toLowerCase().replaceAll(RegExp(r'\s'), '');
