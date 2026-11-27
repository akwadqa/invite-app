import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart' show Rect, TimeOfDay;
import 'package:invit/features/event/data/repository/event_repository.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_state.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/utils/guest_list_file.dart';
import 'package:invit/features/event/presentation/utils/image_cropper.dart';
import 'package:invit/features/event/presentation/utils/guest_list_import.dart';
import 'package:invit/features/event/presentation/utils/guest_phone_number.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:invit/src/logger/failure/exceptions/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'create_event_flow_controller.g.dart';

/// Holds everything the six "create event" screens collect. It lives while
/// any of those screens is on the stack, so leaving the flow resets it.
@riverpod
class CreateEventFlowController extends _$CreateEventFlowController {
  static const Uuid _uuid = Uuid();
  static final RegExp _whitespace = RegExp(r'\s+');

  int _latestTemplatesRequest = 0;

  @override
  CreateEventFlowState build() => const CreateEventFlowState();

  /// Set while a step is open only to change something from the review.
  void setEditingFromReview(bool value) =>
      state = state.copyWith(isEditingFromReview: value);

  // ---------------------------------------------------------------------------
  // Step 1: occasion type
  // ---------------------------------------------------------------------------

  /// Picks the occasion type and loads its templates when it changes.
  void selectOccasionType(String type) {
    if (state.occasionType == type && !state.templates.hasError) return;
    state = state.copyWith(
      occasionType: type,
      templateName: null,
      previewTab: TemplatePreviewTab.invitation,
    );
    _loadTemplates();
  }

  // ---------------------------------------------------------------------------
  // Step 2: message template
  // ---------------------------------------------------------------------------

  void retryTemplates() => _loadTemplates();

  Future<void> _loadTemplates() async {
    final type = state.occasionType;
    if (type == null) return;
    final requestId = ++_latestTemplatesRequest;
    bool isOutdated() => !ref.mounted || requestId != _latestTemplatesRequest;

    final repository = ref.read(eventRepositoryProvider);
    state = state.copyWith(templates: const AsyncLoading());
    try {
      final response = await repository.getTemplates(type);
      if (isOutdated()) return;
      final templates = response.data ?? const [];
      state = state.copyWith(
        templates: AsyncData(templates),
        templateName: templates.firstOrNull?.name,
      );
    } catch (error, stackTrace) {
      if (isOutdated()) return;
      state = state.copyWith(templates: AsyncError(error, stackTrace));
    }
  }

  void selectTemplate(String? name) {
    state = state.copyWith(
      templateName: name,
      previewTab: TemplatePreviewTab.invitation,
    );
  }

  void selectPreviewTab(TemplatePreviewTab tab) {
    state = state.copyWith(previewTab: tab);
  }

  // ---------------------------------------------------------------------------
  // Step 3: details
  // ---------------------------------------------------------------------------

  void updateTitle(String title) => state = state.copyWith(title: title);

  void updateVenue(String venue) => state = state.copyWith(venue: venue);

  void updateHostedBy(String hostedBy) =>
      state = state.copyWith(hostedBy: hostedBy);

  void updateDate(DateTime date) => state = state.copyWith(date: date);

  void updateTime(TimeOfDay time) => state = state.copyWith(time: time);

  /// Called by the map picker once the place is resolved. The venue name is
  /// filled from the place only while the user has not typed one.
  void setLocation(EventLocationDraft location) {
    state = state.copyWith(
      location: location,
      venue: state.venue.trim().isEmpty ? location.locationName : state.venue,
    );
  }

  /// `null` when the details step is complete.
  CreateEventDetailsError? validateDetails() {
    if (state.title.trim().isEmpty) return CreateEventDetailsError.missingTitle;
    final dateTime = state.dateTime;
    if (dateTime == null) return CreateEventDetailsError.missingDateTime;
    final earliest = DateTime.now().add(
      const Duration(minutes: CreateEventFlowConstants.minLeadMinutes),
    );
    if (dateTime.isBefore(earliest)) {
      return CreateEventDetailsError.pastDateTime;
    }
    if (state.location == null) return CreateEventDetailsError.missingLocation;
    return null;
  }

  // ---------------------------------------------------------------------------
  // Step 4: guests
  // ---------------------------------------------------------------------------

  void searchGuests(String query) => state = state.copyWith(guestQuery: query);

  /// Starts a new quick add session ("Just added" list starts empty).
  void startQuickAdd() => state = state.copyWith(recentlyAddedGuestIds: []);

  AddGuestResult addGuest({
    required String name,
    required String nationalNumber,
    required int seats,
  }) {
    final trimmedName = name.trim().replaceAll(_whitespace, ' ');
    if (trimmedName.isEmpty) return AddGuestResult.missingName;
    final phone = GuestPhoneNumber.fromQatarNumber(nationalNumber);
    if (phone == null) return AddGuestResult.invalidPhone;
    if (_hasGuestWith(phone)) return AddGuestResult.duplicate;

    final guest = EventGuestDraft(
      id: _uuid.v4(),
      name: trimmedName,
      phone: phone,
      seats: seats,
    );
    state = state.copyWith(
      guests: [...state.guests, guest],
      recentlyAddedGuestIds: [guest.id, ...state.recentlyAddedGuestIds],
    );
    return AddGuestResult.added;
  }

  /// Adds the picked contacts, skipping numbers already in the list.
  void addGuestsFromContacts(List<EventGuestDraft> contacts) {
    final added = <EventGuestDraft>[];
    for (final contact in contacts) {
      final exists =
          _hasGuestWith(contact.phone) ||
          added.any((guest) => guest.phone == contact.phone);
      if (!exists) added.add(contact);
    }
    if (added.isEmpty) return;
    state = state.copyWith(
      guests: [...state.guests, ...added],
      recentlyAddedGuestIds: [
        ...added.reversed.map((guest) => guest.id),
        ...state.recentlyAddedGuestIds,
      ],
    );
  }

  /// Starts the guest list with the guests of a past event (invite again).
  /// Guests without a usable name or number are skipped.
  void addGuestsFromPastEvent(List<GuestModel> guests) {
    final drafts = <EventGuestDraft>[];
    for (final guest in guests) {
      final name = guest.fullName?.trim() ?? '';
      final phone = GuestPhoneNumber.fromContact(guest.whatsappNumber ?? '');
      if (name.isEmpty || phone == null) continue;
      drafts.add(
        EventGuestDraft(
          id: _uuid.v4(),
          name: name,
          phone: phone,
          seats: guest.partySize ?? CreateEventFlowConstants.defaultSeats,
        ),
      );
    }
    addGuestsFromContacts(drafts);
    state = state.copyWith(recentlyAddedGuestIds: []);
  }

  void removeGuest(String id) {
    state = state.copyWith(
      guests: state.guests.where((guest) => guest.id != id).toList(),
      recentlyAddedGuestIds: state.recentlyAddedGuestIds
          .where((guestId) => guestId != id)
          .toList(),
    );
  }

  bool _hasGuestWith(GuestPhoneNumber phone) =>
      state.guests.any((guest) => guest.phone == phone);

  // ---------------------------------------------------------------------------
  // Step 4: Excel / CSV upload
  // ---------------------------------------------------------------------------

  /// Picks a list and reads it into [CreateEventFlowState.guestImport]. Only
  /// the screen named by [origin] shows the loading and the result.
  Future<void> importGuestList(GuestListImportOrigin origin) async {
    if (state.guestListImport.isLoading) return;
    final PlatformFile? file;
    try {
      file = await GuestListFile.pick();
    } catch (error, stackTrace) {
      if (!ref.mounted) return;
      // Loading first so the listener reports the error like any other.
      _setImport(origin, const AsyncLoading());
      _setImport(origin, AsyncError(error, stackTrace));
      return;
    }
    if (!ref.mounted || file == null) return;

    _setImport(origin, const AsyncLoading());
    try {
      final rows = await GuestListFile.read(file);
      if (!ref.mounted) return;
      final entries = GuestListImport.fromRows(rows, newId: _uuid.v4);
      if (entries.isEmpty) throw GuestListFileException.empty;
      final draft = GuestImportDraft(
        fileName: file.name,
        rowsFound: entries.length,
        entries: _reviewImport(entries),
      );
      state = state.copyWith(
        guestImport: draft,
        guestImportTab: draft.fixCount > 0
            ? GuestImportTab.needsFix
            : GuestImportTab.all,
        guestListImport: const AsyncData(null),
      );
    } catch (error, stackTrace) {
      if (!ref.mounted) return;
      _setImport(origin, AsyncError(error, stackTrace));
    }
  }

  void _setImport(GuestListImportOrigin origin, AsyncValue<void> value) {
    state = state.copyWith(
      guestListImportOrigin: origin,
      guestListImport: value,
    );
  }

  List<GuestImportEntry> _reviewImport(List<GuestImportEntry> entries) =>
      GuestListImport.review(
        entries,
        invited: state.guests.map((guest) => guest.phone).toSet(),
      );

  void selectImportTab(GuestImportTab tab) =>
      state = state.copyWith(guestImportTab: tab);

  /// Saves the name / number typed in the fix sheet and re-checks the list.
  void updateImportEntry(
    String id, {
    required String name,
    required String phone,
  }) {
    final draft = state.guestImport;
    if (draft == null) return;
    final entries = [
      for (final entry in draft.entries)
        entry.id == id
            ? entry.copyWith(name: name.trim(), rawPhone: phone.trim())
            : entry,
    ];
    state = state.copyWith(
      guestImport: draft.copyWith(entries: _reviewImport(entries)),
    );
  }

  void removeImportEntry(String id) {
    final draft = state.guestImport;
    if (draft == null) return;
    final entries = draft.entries.where((entry) => entry.id != id).toList();
    state = state.copyWith(
      guestImport: draft.copyWith(entries: _reviewImport(entries)),
    );
  }

  /// Adds the rows without issues to the guest list. The draft stays until
  /// the next upload so the review screen does not empty while it closes.
  /// Returns how many guests were added.
  int addImportedGuests() {
    final draft = state.guestImport;
    if (draft == null) return 0;
    final added = <EventGuestDraft>[];
    for (final entry in _reviewImport(draft.entries)) {
      final phone = entry.phone;
      if (!entry.isReady || phone == null) continue;
      added.add(
        EventGuestDraft(
          id: _uuid.v4(),
          name: entry.name,
          phone: phone,
          seats: entry.seats,
        ),
      );
    }
    state = state.copyWith(
      guests: [...state.guests, ...added],
      recentlyAddedGuestIds: [
        ...added.reversed.map((guest) => guest.id),
        ...state.recentlyAddedGuestIds,
      ],
    );
    return added.length;
  }

  /// Saves the Excel template through the system "save as" dialog.
  Future<void> downloadGuestListTemplate() async {
    if (state.guestListTemplate.isLoading) return;
    state = state.copyWith(guestListTemplate: const AsyncLoading());
    try {
      final path = await GuestListFile.saveTemplate();
      if (!ref.mounted) return;
      state = state.copyWith(guestListTemplate: AsyncData(path != null));
    } catch (error, stackTrace) {
      if (!ref.mounted) return;
      state = state.copyWith(guestListTemplate: AsyncError(error, stackTrace));
    }
  }

  // ---------------------------------------------------------------------------
  // Step 5: image
  // ---------------------------------------------------------------------------

  void setImage(File image) => state = state.copyWith(image: image);

  void removeImage() => state = state.copyWith(image: null);

  /// Replaces the image with the part inside [area], given as fractions of
  /// the image's width and height (0..1).
  Future<void> cropImage(Rect area) async {
    final image = state.image;
    if (image == null || state.imageCrop.isLoading) return;
    state = state.copyWith(imageCrop: const AsyncLoading());
    try {
      final cropped = await ImageCropper.crop(image, area);
      if (!ref.mounted) return;
      state = state.copyWith(image: cropped, imageCrop: const AsyncData(null));
    } catch (error, stackTrace) {
      if (!ref.mounted) return;
      state = state.copyWith(imageCrop: AsyncError(error, stackTrace));
    }
  }

  // ---------------------------------------------------------------------------
  // Step 6: create and send
  // ---------------------------------------------------------------------------

  /// Creates the event (once) and, when [send] is true, confirms it so the
  /// invitations go out. A retry after a failed confirm reuses the created
  /// event instead of creating a duplicate.
  Future<EventSubmitResult?> submit({required bool send}) async {
    if (state.submit.isLoading) return null;
    final repository = ref.read(eventRepositoryProvider);
    final homeController = ref.read(homeControllerProvider.notifier);
    state = state.copyWith(submit: const AsyncLoading());
    try {
      var eventId = state.createdEventId;
      if (eventId == null) {
        final response = await repository.createEvent(_buildEvent());
        if (!ref.mounted) return null;
        eventId = response.data;
        if (!response.hasSucceeded || eventId == null) {
          throw AppException(message: response.message);
        }
        state = state.copyWith(createdEventId: eventId);
      }

      if (send) {
        final response = await repository.confirmEvent(eventId);
        if (!ref.mounted) return null;
        if (!response.hasSucceeded) {
          throw AppException(message: response.message);
        }
      }

      final result = EventSubmitResult(eventId: eventId, isSent: send);
      state = state.copyWith(submit: AsyncData(result));
      homeController.refresh();
      return result;
    } catch (error, stackTrace) {
      if (!ref.mounted) return null;
      state = state.copyWith(submit: AsyncError(error, stackTrace));
      // The event was created even though sending failed: show it as a draft.
      if (state.createdEventId != null) homeController.refresh();
      return null;
    }
  }

  EventModel _buildEvent() {
    final location = state.location;
    final venue = state.venue.trim();
    return EventModel(
      type: state.occasionType,
      title: state.title.trim(),
      dateTime: state.dateTime?.toString(),
      language: CreateEventFlowConstants.defaultLanguage,
      locationName: venue.isEmpty ? location?.locationName : venue,
      mapLatitude: location?.latitude,
      mapLongitude: location?.longitude,
      mapLink: location?.mapLink,
      hostedBy: state.hostedBy,
      inviteTemplate: state.templateName,
      image: state.image,
      guestList: state.guests.map(_toGuestModel).toList(),
    );
  }

  GuestModel _toGuestModel(EventGuestDraft guest) {
    final parts = guest.name.split(' ');
    return GuestModel(
      firstName: parts.firstOrNull,
      lastName: parts.length > 1 ? parts.skip(1).join(' ') : null,
      fullName: guest.name,
      whatsappNumber: guest.phone.whatsappNumber,
      partySize: guest.seats,
    );
  }
}
