import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:invit/features/event/presentation/controller/map_controller/map_controller.dart';
import 'package:invit/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:invit/features/event/presentation/utils/map_pin_icon.dart';

/// The full-screen map with the picked point marked by the app's pin.
class SelectLocationGoogleMap extends ConsumerStatefulWidget {
  const SelectLocationGoogleMap(this.mapController, this.id, {super.key});

  final String? id;
  final Completer<GoogleMapController> mapController;

  @override
  ConsumerState<SelectLocationGoogleMap> createState() =>
      _SelectLocationGoogleMapState();
}

class _SelectLocationGoogleMapState
    extends ConsumerState<SelectLocationGoogleMap> {
  static const double _zoom = 14.4746;

  BitmapDescriptor? _pin;
  bool _pinRequested = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_pinRequested) return;
    _pinRequested = true;
    MapPinIcon.create(pixelRatio: MediaQuery.devicePixelRatioOf(context)).then((
      pin,
    ) {
      if (mounted) setState(() => _pin = pin);
    });
  }

  Future<void> _moveCamera(LatLng target) async {
    final controller = await widget.mapController.future;
    await controller.animateCamera(CameraUpdate.newLatLng(target));
  }

  @override
  Widget build(BuildContext context) {
    final id = widget.id;
    ref.listen(mapControllerProvider(id), (previous, next) {
      final latLng = next.value?.latLng;
      if (latLng != null) _moveCamera(latLng);
    });
    if (id != null) {
      ref.listen(updateEventControllerProvider(ocassionId: id), (
        previous,
        next,
      ) {
        final event = next.value?.updatedEvent;
        final lat = double.tryParse(event?.mapLatitude ?? '');
        final lng = double.tryParse(event?.mapLongitude ?? '');
        if (lat != null && lng != null) _moveCamera(LatLng(lat, lng));
      });
    }

    final position =
        ref.watch(
          mapControllerProvider(id).select((state) => state.value?.latLng),
        ) ??
        const LatLng(0, 0);
    final pin = _pin;

    return GoogleMap(
      myLocationEnabled: false,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      mapToolbarEnabled: false,
      onTap: (tapped) => ref
          .read(mapControllerProvider(id).notifier)
          .changeLatlng(tapped.latitude, tapped.longitude),
      markers: {
        if (pin != null)
          Marker(
            markerId: const MarkerId('value'),
            position: position,
            icon: pin,
            anchor: const Offset(0.5, 1),
          ),
      },
      initialCameraPosition: CameraPosition(target: position, zoom: _zoom),
      onMapCreated: (controller) {
        if (!widget.mapController.isCompleted) {
          widget.mapController.complete(controller);
        }
      },
    );
  }
}
