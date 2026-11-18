import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_state.dart';
import 'package:invit/features/event/presentation/controller/device_contacts/device_contacts_state.dart';
import 'package:invit/features/event/presentation/utils/guest_phone_number.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_contacts_controller.g.dart';

/// Phone contacts the user can pick guests from.
@riverpod
class DeviceContactsController extends _$DeviceContactsController {
  int _latestContactsRequest = 0;

  @override
  DeviceContactsState build() {
    Future.microtask(_loadContacts);
    return const DeviceContactsState();
  }

  void retry() => _loadContacts();

  void search(String query) => state = state.copyWith(query: query);

  void toggle(String id) {
    final selected = state.selectedIds.contains(id)
        ? ({...state.selectedIds}..remove(id))
        : {...state.selectedIds, id};
    state = state.copyWith(selectedIds: selected);
  }

  /// Adds the selected contacts to the event being created.
  void addSelectedToEvent() {
    final contacts = state.contacts.value ?? const <DeviceContact>[];
    final guests = contacts
        .where((contact) => state.selectedIds.contains(contact.id))
        .map(
          (contact) => EventGuestDraft(
            id: contact.id,
            name: contact.name,
            phone: contact.phone,
          ),
        )
        .toList();
    ref
        .read(createEventFlowControllerProvider.notifier)
        .addGuestsFromContacts(guests);
  }

  Future<void> _loadContacts() async {
    if (!ref.mounted) return;
    final requestId = ++_latestContactsRequest;
    bool isOutdated() => !ref.mounted || requestId != _latestContactsRequest;
    state = state.copyWith(contacts: const AsyncLoading());
    try {
      final granted = await FlutterContacts.requestPermission(readonly: true);
      if (isOutdated()) return;
      if (!granted) {
        state = state.copyWith(
          contacts: AsyncError(
            const ContactsPermissionDenied(),
            StackTrace.current,
          ),
        );
        return;
      }
      final contacts = await FlutterContacts.getContacts(withProperties: true);
      if (isOutdated()) return;
      state = state.copyWith(contacts: AsyncData(_toDeviceContacts(contacts)));
    } catch (error, stackTrace) {
      if (isOutdated()) return;
      state = state.copyWith(contacts: AsyncError(error, stackTrace));
    }
  }

  List<DeviceContact> _toDeviceContacts(List<Contact> contacts) {
    final result = <DeviceContact>[];
    for (final contact in contacts) {
      final name = contact.displayName.trim();
      final rawNumber = contact.phones.firstOrNull?.number;
      if (name.isEmpty || rawNumber == null) continue;
      final phone = GuestPhoneNumber.fromContact(rawNumber);
      if (phone == null) continue;
      result.add(DeviceContact(id: contact.id, name: name, phone: phone));
    }
    result.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    return result;
  }
}

/// The user did not allow reading the phone's contacts.
class ContactsPermissionDenied implements Exception {
  const ContactsPermissionDenied();
}
