import 'package:flutter_google_places_hoc081098/google_maps_webservice_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:invit/features/event/data/repository/event_repository.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_state.dart';
import 'package:invit/features/event/presentation/controller/map_controller/map_state.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/src/infrastructure/api/endpoint/services_urls.dart';
import 'package:invit/src/logger/log_services/dev_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_api_headers/google_api_headers.dart';

part 'map_controller.g.dart';

@riverpod
class MapController extends _$MapController {
  late final Future<GoogleMapsPlaces> _placesFuture;
  int _latestSearchRequest = 0;
  int _latestLocationRequest = 0;

  @override
  FutureOr<MapState> build(String? occasionId) async {
    state = AsyncData(MapState.init());
    _placesFuture = GoogleApiHeaders().getHeaders().then(
      (headers) =>
          GoogleMapsPlaces(apiKey: ServicesUrls.mapApiKey, apiHeaders: headers),
    );
    if (occasionId != null) {
      final event = ref
          .read(eventDetailsControllerProvider(ocassionId: occasionId))
          .value;
      return MapState.init().copyWith(
        latLng: LatLng(
          double.tryParse(event?.mapLatitude ?? '') ?? 0,
          double.tryParse(event?.mapLongitude ?? '') ?? 0,
        ),
        selectedPlace: AsyncData(
          SelectedPlace(
            placeId: '',
            mapLink: event?.mapLink ?? '',
            locationName: event?.locationName ?? '',
          ),
        ),
      );
    }

    // Reopening the picker while creating an event starts at the chosen place.
    final picked = ref.read(createEventFlowControllerProvider).location;
    final pickedLat = double.tryParse(picked?.latitude ?? '');
    final pickedLng = double.tryParse(picked?.longitude ?? '');
    if (pickedLat != null && pickedLng != null) {
      return MapState.init().copyWith(latLng: LatLng(pickedLat, pickedLng));
    }
    return MapState.init();
  }

  /// Passes the resolved place to the "create event" flow.
  void _updateCreateFlow({
    required String locationName,
    required String latitude,
    required String longitude,
  }) {
    if (!ref.mounted) return;
    ref
        .read(createEventFlowControllerProvider.notifier)
        .setLocation(
          EventLocationDraft(
            locationName: locationName,
            latitude: latitude,
            longitude: longitude,
            mapLink:
                '${CreateEventFlowConstants.mapLinkBase}$latitude,$longitude',
          ),
        );
  }

  Future<void> initLocation(String? occasionId) async {
    if (occasionId == null) {
      state = AsyncData(state.value!.copyWith(selectedPlace: AsyncLoading()));
    } else {
      state = AsyncData(state.value!.copyWith(initialLatLng: AsyncLoading()));
    }

    try {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        _setDefaultLocationWithAsync(error: 'Error');
        return;
      }

      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final lat = pos.latitude.toString();
      final lng = pos.longitude.toString();
      final result = await ref
          .read(eventRepositoryProvider)
          .getLocationData(ref, LatLng(double.parse(lat), double.parse(lng)));

      final locationName = cleanName(result["formatted_address"] ?? "");
      final placeId = result["place_id"] ?? "";

      if (!ref.mounted) return;
      if (occasionId == null) {
        _updateCreateFlow(
          locationName: locationName,
          latitude: lat,
          longitude: lng,
        );
      } else {
        ref
            .read(
              updateEventControllerProvider(ocassionId: occasionId).notifier,
            )
            .updateDataForEvent(EventModel());
      }

      state = AsyncData(
        state.value!.copyWith(
          latLng: occasionId == null
              ? LatLng(double.parse(lat), double.parse(lng))
              : state.value!.latLng,
          initialLatLng: AsyncData(
            LatLng(double.parse(lat), double.parse(lng)),
          ),
          selectedPlace: occasionId == null
              ? AsyncData(
                  SelectedPlace(
                    placeId: placeId,
                    mapLink:
                        "https://www.google.com/maps/search/?api=1&query=$lat,$lng",
                    locationName: locationName,
                  ),
                )
              : null,
        ),
      );
    } catch (e, st) {
      _setDefaultLocationWithAsync(error: e, stack: st, occasionId: occasionId);
    }
  }

  void _setDefaultLocationWithAsync({
    dynamic error,
    StackTrace? stack,
    String? occasionId,
  }) {
    const lat = "25.2854473";
    const lng = "51.53103979999999";
    const locationName = "Doha, Qatar";

    if (!ref.mounted) return;
    if (occasionId == null) {
      _updateCreateFlow(
        locationName: locationName,
        latitude: lat,
        longitude: lng,
      );
    } else {
      ref
          .read(updateEventControllerProvider(ocassionId: occasionId).notifier)
          .updateDataForEvent(
            EventModel(
              mapLatitude: lat,
              mapLongitude: lng,
              locationName: locationName,
            ),
          );
    }

    if (error != null) {
      state = AsyncData(
        state.value!.copyWith(
          selectedPlace: AsyncError(error, stack ?? StackTrace.current),
        ),
      );
    } else {
      state = AsyncData(
        state.value!.copyWith(
          latLng: LatLng(double.parse(lat), double.parse(lng)),
          selectedPlace: AsyncData(
            SelectedPlace(
              placeId: "",
              mapLink:
                  "https://www.google.com/maps/search/?api=1&query=$lat,$lng",
              locationName: locationName,
            ),
          ),
        ),
      );
    }
  }

  void changeLatlng(double lat, double lng) {
    state = AsyncData(state.value!.copyWith(latLng: LatLng(lat, lng)));
  }

  /// Moves the picked point to the user's current position. Its progress is
  /// in `currentLocation`; it fails with [LocationPermissionDenied] when the
  /// user does not allow location access.
  Future<void> moveToCurrentLocation() async {
    final current = state.value;
    if (current == null || current.currentLocation.isLoading) return;
    final requestId = ++_latestLocationRequest;
    bool isOutdated() => !ref.mounted || requestId != _latestLocationRequest;

    void emit(MapState Function(MapState value) update) {
      final latest = state.value;
      if (latest != null) state = AsyncData(update(latest));
    }

    emit((value) => value.copyWith(currentLocation: const AsyncLoading()));
    try {
      final permission = await Geolocator.requestPermission();
      if (isOutdated()) return;
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        throw const LocationPermissionDenied();
      }
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      if (isOutdated()) return;
      final found = LatLng(position.latitude, position.longitude);
      emit(
        (value) => value.copyWith(
          latLng: found,
          initialLatLng: AsyncData(found),
          currentLocation: AsyncData(found),
        ),
      );
    } catch (error, stackTrace) {
      if (isOutdated()) return;
      emit(
        (value) =>
            value.copyWith(currentLocation: AsyncError(error, stackTrace)),
      );
    }
  }

  Future<void> getPlaceInfoFromLatLng(String? occasionId) async {
    final lat = state.value!.latLng.latitude;
    final lng = state.value!.latLng.longitude;
    try {
      state = AsyncData(state.value!.copyWith(selectedPlace: AsyncLoading()));
      final result = await ref
          .read(eventRepositoryProvider)
          .getLocationData(ref, state.value!.latLng);

      final locationName = cleanName(result["formatted_address"] ?? "");
      final placeId = result["place_id"] ?? "";

      final mapLink =
          "https://www.google.com/maps/search/?api=1&query=$lat,$lng";

      if (!ref.mounted) return;
      if (occasionId == null) {
        _updateCreateFlow(
          locationName: locationName,
          latitude: lat.toString(),
          longitude: lng.toString(),
        );
      } else {
        ref
            .read(
              updateEventControllerProvider(ocassionId: occasionId).notifier,
            )
            .updateDataForEvent(
              EventModel(
                locationName: locationName,
                mapLatitude: lat.toString(),
                mapLongitude: lng.toString(),
                mapLink: mapLink,
              ),
            );
      }

      state = AsyncData(
        state.value!.copyWith(
          selectedPlace: AsyncData(
            SelectedPlace(
              placeId: placeId,
              mapLink: mapLink,
              locationName: locationName,
            ),
          ),
        ),
      );
    } catch (e, st) {
      if (!ref.mounted) return;
      state = AsyncData(
        state.value!.copyWith(selectedPlace: AsyncError(e, st)),
      );
    }
  }

  String cleanName(String address) {
    if (address.isEmpty) return "Location";

    final trimmed = address.trim();

    List<String> commaParts = trimmed.split(',').map((e) => e.trim()).toList();

    String first = commaParts[0];

    final fullPlusCode = RegExp(r"^[A-Z0-9]{4,}\+[A-Z0-9]+");
    first = first.replaceFirst(fullPlusCode, '').trim();

    final shortPlusCode = RegExp(r"^\+[A-Z0-9]{2,4}");
    first = first.replaceFirst(shortPlusCode, '').trim();

    List<String> parts = [];
    if (first.isNotEmpty) {
      parts.add(first);
    }

    if (commaParts.length > 1) {
      parts.addAll(commaParts.sublist(1));
    }

    final result = parts.join(', ').trim();

    if (RegExp(r"^[0-9+\- ]+$").hasMatch(result)) {
      return "Location";
    }

    return result.isEmpty ? "Location" : result;
  }

  Future<LatLng?> getPlaceLocation(String placeId) async {
    try {
      final places = await _placesFuture;

      final detail = await places.getDetailsByPlaceId(placeId);

      final location = detail.result.geometry?.location;

      if (location == null) return null;

      return LatLng(location.lat, location.lng);
    } catch (e) {
      Dev.logError("getPlaceLocation error: $e");
      return null;
    }
  }

  Future<void> searchLocation(String value) async {
    if (value.isEmpty) {
      clearSearchSuggestions();
      return;
    }
    final requestId = ++_latestSearchRequest;
    bool isOutdated() => !ref.mounted || requestId != _latestSearchRequest;

    try {
      final places = await _placesFuture;
      final res = await places.autocomplete(
        value,
        language: 'ar',
        region: "QA",
        components: [Component(Component.country, "QA")],
      );
      if (isOutdated()) return;

      state = AsyncData(
        state.value!.copyWith(predictions: AsyncData(res.predictions)),
      );
    } catch (e) {
      Dev.logError('Places error: $e');
    }
  }

  void clearSearchSuggestions() {
    _latestSearchRequest++;
    state = AsyncData(state.value!.copyWith(predictions: AsyncData([])));
  }
}

// final placesSdkProvider = Provider<FlutterGooglePlacesSdk>((ref) {
//   return FlutterGooglePlacesSdk(dotenv.env['MAPS_API_KEY']!);
// });

/// The user did not allow reading their location.
class LocationPermissionDenied implements Exception {
  const LocationPermissionDenied();
}
