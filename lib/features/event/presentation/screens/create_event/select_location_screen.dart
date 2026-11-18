import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:invit/features/event/presentation/controller/map_controller/map_controller.dart';
import 'package:invit/features/event/presentation/widgets/select_location_screen/location_search_box.dart';
import 'package:invit/features/event/presentation/widgets/select_location_screen/select_location_google_map.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/app_round_icon_button.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';
import 'package:invit/src/core/utils/functions/async_action_listener.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// Map picker: search a place or tap the map, then confirm the point.
class SelectLocationPage extends ConsumerStatefulWidget {
  const SelectLocationPage({super.key, this.id});

  /// The event being edited, or `null` while creating one.
  final String? id;

  @override
  ConsumerState<SelectLocationPage> createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends ConsumerState<SelectLocationPage> {
  static const EdgeInsets _topPadding = EdgeInsets.fromLTRB(16, 8, 16, 0);
  static const EdgeInsets _bottomPadding = EdgeInsets.fromLTRB(24, 0, 24, 0);
  static const EdgeInsets _bottomInset = EdgeInsets.only(bottom: 36);
  static const double _controlGap = 16;
  static const double _buttonSize = 44;
  static const double _locateSize = 52;
  static const List<BoxShadow> _shadow = [
    BoxShadow(
      color: AppColors.shadowMedium,
      offset: Offset(0, 6),
      blurRadius: 16,
    ),
  ];

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  MapController get _map => ref.read(mapControllerProvider(widget.id).notifier);

  Future<void> _selectPlace(String placeId) async {
    final latLng = await _map.getPlaceLocation(placeId);
    if (latLng == null || !mounted) return;
    _map.changeLatlng(latLng.latitude, latLng.longitude);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      mapControllerProvider(
        widget.id,
      ).select((state) => state.value?.selectedPlace),
      (previous, next) => handleAsyncAction(
        context,
        previous,
        next,
        onSettled: (result) {
          if (result.hasError) {
            AppToast.errorToast(result.error.toString());
            return;
          }
          if (context.canPop()) context.pop();
        },
      ),
    );

    // Blocks the screen while the device finds its position, so a point picked
    // meanwhile is not replaced by the found one.
    ref.listen(
      mapControllerProvider(
        widget.id,
      ).select((state) => state.value?.currentLocation),
      (previous, next) => handleAsyncAction(
        context,
        previous,
        next,
        onSettled: (result) {
          final error = result.error;
          if (error == null) return;
          AppToast.errorToast(
            error is LocationPermissionDenied
                ? 'select_location_denied'.tr()
                : error.toString(),
          );
        },
      ),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned.fill(
              child: SelectLocationGoogleMap(_controller, widget.id),
            ),
            SafeArea(
              bottom: false,
              child: Padding(
                padding: _topPadding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    AppRoundIconButton(
                      icon: Assets.icons.chevronLeftIc,
                      size: _buttonSize,
                      backgroundColor: AppColors.white,
                      matchTextDirection: true,
                      shadows: _shadow,
                      onTap: () {
                        if (context.canPop()) context.pop();
                      },
                    ),
                    Expanded(
                      child: LocationSearchBox(
                        occasionId: widget.id,
                        onSelect: (placeId, _) => _selectPlace(placeId),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SafeArea(
                top: false,
                minimum: _bottomInset,
                child: Padding(
                  padding: _bottomPadding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: _controlGap,
                    children: [
                      AppRoundIconButton(
                        icon: Assets.icons.myLocationIc,
                        size: _locateSize,
                        iconSize: 22,
                        backgroundColor: AppColors.white,
                        shadows: _shadow,
                        onTap: _map.moveToCurrentLocation,
                      ),
                      AppPrimaryButton(
                        label: 'select_location_confirm'.tr(),
                        icon: Assets.icons.checkIc,
                        mirrorIconInRtl: false,
                        onPressed: () => _map.getPlaceInfoFromLatLng(widget.id),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
