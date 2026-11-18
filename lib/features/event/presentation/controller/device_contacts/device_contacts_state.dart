import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invit/features/event/presentation/utils/guest_phone_number.dart';

part 'device_contacts_state.freezed.dart';

@freezed
abstract class DeviceContactsState with _$DeviceContactsState {
  const DeviceContactsState._();

  const factory DeviceContactsState({
    @Default(AsyncLoading()) AsyncValue<List<DeviceContact>> contacts,
    @Default('') String query,
    @Default({}) Set<String> selectedIds,
  }) = _DeviceContactsState;

  List<DeviceContact> get visibleContacts {
    final all = contacts.value ?? const <DeviceContact>[];
    final text = query.trim().toLowerCase();
    if (text.isEmpty) return all;
    final digits = text.replaceAll(RegExp(r'\D'), '');
    return all
        .where(
          (contact) =>
              contact.name.toLowerCase().contains(text) ||
              (digits.isNotEmpty &&
                  contact.phone.whatsappNumber.contains(digits)),
        )
        .toList();
  }
}

/// A phone contact reduced to what a guest needs.
@freezed
abstract class DeviceContact with _$DeviceContact {
  const factory DeviceContact({
    required String id,
    required String name,
    required GuestPhoneNumber phone,
  }) = _DeviceContact;
}
