import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/presentation/controller/map_controller/map_controller.dart';
import 'package:invit/features/event/presentation/widgets/select_location_screen/select_location_screen_search_field.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Search field with the place suggestions under it.
class LocationSearchBox extends ConsumerWidget {
  const LocationSearchBox({
    super.key,
    required this.occasionId,
    required this.onSelect,
  });

  /// The event being edited, or `null` while creating one.
  final String? occasionId;
  final void Function(String placeId, String description) onSelect;

  static const double _gap = 8;
  static const double _radius = 18;
  static const double _maxHeight = 280;
  static const double _iconBoxSize = 32;
  static const double _iconSize = 16;
  static const List<BoxShadow> _shadow = [
    BoxShadow(
      color: AppColors.shadowMedium,
      offset: Offset(0, 6),
      blurRadius: 16,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(mapControllerProvider(occasionId).notifier);
    final predictions =
        ref.watch(
          mapControllerProvider(
            occasionId,
          ).select((state) => state.value?.predictions.value),
        ) ??
        const [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: _gap,
      children: [
        SelectLocationScreenSearchField(
          hint: 'select_location_search_hint'.tr(),
          onChanged: notifier.searchLocation,
        ),
        if (predictions.isNotEmpty)
          Container(
            constraints: const BoxConstraints(maxHeight: _maxHeight),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(_radius),
              border: Border.all(color: AppColors.mistOutline),
              boxShadow: _shadow,
            ),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: predictions.length,
              separatorBuilder: (_, _) =>
                  const Divider(height: 1, color: AppColors.mistDivider),
              itemBuilder: (context, index) {
                final prediction = predictions[index];
                return InkWell(
                  onTap: () {
                    onSelect(
                      prediction.placeId ?? '',
                      prediction.description ?? '',
                    );
                    notifier.clearSearchSuggestions();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      spacing: 12,
                      children: [
                        Container(
                          width: _iconBoxSize,
                          height: _iconBoxSize,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: AppColors.mistSoft,
                            shape: BoxShape.circle,
                          ),
                          child: Assets.icons.mapPinIc.svg(
                            width: _iconSize,
                            height: _iconSize,
                            colorFilter: const ColorFilter.mode(
                              AppColors.ink,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            prediction.description ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.outfitRegular14.copyWith(
                              color: AppColors.ink,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
