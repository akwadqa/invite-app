import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/utils/functions/helper_methods.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Map preview with the picked place; opens the map picker.
class CreateEventDetailsScreenLocationCard extends ConsumerWidget {
  const CreateEventDetailsScreenLocationCard({super.key});

  static const double _radius = 18;
  static const double _mapHeight = 104;
  static const double _markerWidth = 34;
  static const double _markerHeight = 42;
  static const double _borderWidth = 1.5;
  static const double _markerTop = 22;
  static const double _badgeSize = 28;
  static const double _badgeIconSize = 14;
  static const EdgeInsets _rowPadding = EdgeInsets.fromLTRB(14, 12, 14, 14);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(
      createEventFlowControllerProvider.select((state) => state.location),
    );
    final hasLocation = location != null;

    void openPicker() {
      dismissKeyboard();
      context.push(AppRoutes.selectLocationScreen);
    }

    return Material(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_radius),
        side: const BorderSide(
          color: AppColors.mistBorder,
          width: _borderWidth,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: openPicker,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: _mapHeight,
              child: ColoredBox(
                color: AppColors.mist,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Assets.icons.mapPreviewBg.svg(fit: BoxFit.cover),
                    if (hasLocation)
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: _markerTop),
                          child: Assets.icons.mapMarkerIc.svg(
                            width: _markerWidth,
                            height: _markerHeight,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: _rowPadding,
              child: Row(
                spacing: 10,
                children: [
                  Container(
                    width: _badgeSize,
                    height: _badgeSize,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: hasLocation
                          ? AppColors.successLight
                          : AppColors.mistSoft,
                      shape: BoxShape.circle,
                    ),
                    child:
                        (hasLocation
                                ? Assets.icons.checkIc
                                : Assets.icons.mapPinIc)
                            .svg(
                              width: _badgeIconSize,
                              height: _badgeIconSize,
                              colorFilter: ColorFilter.mode(
                                hasLocation ? AppColors.success : AppColors.ink,
                                BlendMode.srcIn,
                              ),
                            ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          location?.locationName ??
                              'create_details_add_location'.tr(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.outfitMedium14.copyWith(
                            color: AppColors.ink,
                          ),
                        ),
                        Text(
                          hasLocation
                              ? 'create_details_location_added'.tr()
                              : 'create_details_add_location_hint'.tr(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.outfitRegular12.copyWith(
                            color: AppColors.inkLabel,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'create_details_change'.tr(),
                    style: AppTextStyle.outfitMedium14.copyWith(
                      color: AppColors.ink,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
