import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/utils/guest_list_import.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// The uploaded file: name, rows found and a link to pick another one.
class CreateEventImportReviewScreenFileCard extends ConsumerWidget {
  const CreateEventImportReviewScreenFileCard({super.key});

  static const double _radius = 18;
  static const double _iconBoxSize = 40;
  static const double _iconBoxRadius = 12;
  static const double _iconSize = 20;
  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 12,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fileName = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.guestImport?.fileName ?? '',
      ),
    );
    final rowsFound = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.guestImport?.rowsFound ?? 0,
      ),
    );

    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_radius),
        border: Border.all(color: AppColors.mistBorder, width: 1.5),
      ),
      child: Row(
        spacing: 12,
        children: [
          Container(
            width: _iconBoxSize,
            height: _iconBoxSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.successLight,
              borderRadius: BorderRadius.circular(_iconBoxRadius),
            ),
            child: Assets.icons.sheetFileIc.svg(
              width: _iconSize,
              height: _iconSize,
              colorFilter: const ColorFilter.mode(
                AppColors.success,
                BlendMode.srcIn,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.outfitMedium15.copyWith(
                    color: AppColors.ink,
                  ),
                ),
                Text(
                  'import_rows_found'.tr(args: ['$rowsFound']),
                  style: AppTextStyle.outfitRegular12_5.copyWith(
                    color: AppColors.inkLabel,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => ref
                .read(createEventFlowControllerProvider.notifier)
                .importGuestList(GuestListImportOrigin.review),
            child: Text(
              'import_replace'.tr(),
              style: AppTextStyle.outfitMedium14.copyWith(
                color: AppColors.ink,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
