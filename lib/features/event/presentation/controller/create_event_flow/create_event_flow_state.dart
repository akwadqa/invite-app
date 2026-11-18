import 'dart:io';

import 'package:flutter/material.dart' show TimeOfDay;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/domain/model/template%20model/template_model.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/utils/guest_list_import.dart';
import 'package:invit/features/event/presentation/utils/guest_phone_number.dart';

part 'create_event_flow_state.freezed.dart';

@freezed
abstract class CreateEventFlowState with _$CreateEventFlowState {
  const CreateEventFlowState._();

  const factory CreateEventFlowState({
    // The review screen opened a step to change one thing.
    @Default(false) bool isEditingFromReview,
    // Step 1: occasion type.
    String? occasionType,
    // Step 2: message template.
    @Default(AsyncLoading()) AsyncValue<List<TemplateModel>> templates,
    String? templateName,
    @Default(TemplatePreviewTab.invitation) TemplatePreviewTab previewTab,
    // Step 3: details.
    @Default('') String title,
    DateTime? date,
    TimeOfDay? time,
    @Default('') String venue,
    // TODO(backend): EventModel has no host field, so "Hosted by" is kept
    // here but not sent to the API yet.
    @Default('') String hostedBy,
    EventLocationDraft? location,
    // Step 4: guests.
    @Default([]) List<EventGuestDraft> guests,
    @Default([]) List<String> recentlyAddedGuestIds,
    @Default('') String guestQuery,
    // Step 4: uploading an Excel/CSV list, then reviewing it.
    @Default(AsyncData(null)) AsyncValue<void> guestListImport,
    @Default(GuestListImportOrigin.guests)
    GuestListImportOrigin guestListImportOrigin,
    GuestImportDraft? guestImport,
    @Default(GuestImportTab.needsFix) GuestImportTab guestImportTab,
    @Default(AsyncData(null)) AsyncValue<bool?> guestListTemplate,
    // Step 5: image.
    File? image,
    @Default(AsyncData(null)) AsyncValue<void> imageCrop,
    // Step 6: create (and send).
    @Default(AsyncData(null)) AsyncValue<EventSubmitResult?> submit,
    String? createdEventId,
  }) = _CreateEventFlowState;

  TemplateModel? get selectedTemplate => templates.value
      ?.where((template) => template.name == templateName)
      .firstOrNull;

  DateTime? get dateTime {
    final day = date;
    final clock = time;
    if (day == null || clock == null) return null;
    return DateTime(day.year, day.month, day.day, clock.hour, clock.minute);
  }

  int get totalSeats => guests.fold(0, (sum, guest) => sum + guest.seats);

  int get messagesNeeded =>
      guests.length * CreateEventFlowConstants.messagesPerGuest;

  /// Guests matching [guestQuery] by name or number.
  List<EventGuestDraft> get visibleGuests {
    final query = guestQuery.trim().toLowerCase();
    if (query.isEmpty) return guests;
    final digits = query.replaceAll(RegExp(r'\D'), '');
    return guests
        .where(
          (guest) =>
              guest.name.toLowerCase().contains(query) ||
              (digits.isNotEmpty &&
                  guest.phone.whatsappNumber.contains(digits)),
        )
        .toList();
  }

  List<EventGuestDraft> get recentlyAddedGuests => recentlyAddedGuestIds
      .map((id) => guests.where((guest) => guest.id == id).firstOrNull)
      .nonNulls
      .toList();
}

@freezed
abstract class EventGuestDraft with _$EventGuestDraft {
  const factory EventGuestDraft({
    required String id,
    required String name,
    required GuestPhoneNumber phone,
    @Default(CreateEventFlowConstants.defaultSeats) int seats,
  }) = _EventGuestDraft;
}

/// An uploaded list being reviewed before its guests are added.
@freezed
abstract class GuestImportDraft with _$GuestImportDraft {
  const GuestImportDraft._();

  const factory GuestImportDraft({
    required String fileName,
    required int rowsFound,
    @Default([]) List<GuestImportEntry> entries,
  }) = _GuestImportDraft;

  List<GuestImportEntry> get readyEntries =>
      entries.where((entry) => entry.isReady).toList();

  List<GuestImportEntry> get entriesToFix =>
      entries.where((entry) => !entry.isReady).toList();

  int get readyCount => entries.where((entry) => entry.isReady).length;

  int get fixCount => entries.length - readyCount;
}

/// One uploaded row: what the file says, and what keeps it from being added.
@freezed
abstract class GuestImportEntry with _$GuestImportEntry {
  const GuestImportEntry._();

  const factory GuestImportEntry({
    required String id,
    required int rowNumber,
    @Default('') String name,
    @Default('') String rawPhone,
    @Default(CreateEventFlowConstants.defaultSeats) int seats,
    GuestPhoneNumber? phone,
    GuestImportIssue? issue,
  }) = _GuestImportEntry;

  bool get isReady => issue == null && phone != null;
}

@freezed
abstract class EventLocationDraft with _$EventLocationDraft {
  const factory EventLocationDraft({
    required String locationName,
    required String latitude,
    required String longitude,
    required String mapLink,
  }) = _EventLocationDraft;
}

@freezed
abstract class EventSubmitResult with _$EventSubmitResult {
  const factory EventSubmitResult({
    required String eventId,
    required bool isSent,
  }) = _EventSubmitResult;
}
