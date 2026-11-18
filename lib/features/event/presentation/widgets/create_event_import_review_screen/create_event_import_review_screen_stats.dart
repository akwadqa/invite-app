import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "Ready to add" and "Need a quick fix" counters.
class CreateEventImportReviewScreenStats extends ConsumerWidget {
  const CreateEventImportReviewScreenStats({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ready = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.guestImport?.readyCount ?? 0,
      ),
    );
    final toFix = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.guestImport?.fixCount ?? 0,
      ),
    );

    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: _CreateEventImportReviewScreenStat(
            value: ready,
            label: 'import_ready'.tr(),
            background: AppColors.successLight,
            valueColor: AppColors.successStrong,
            labelColor: AppColors.successText,
          ),
        ),
        Expanded(
          child: _CreateEventImportReviewScreenStat(
            value: toFix,
            label: 'import_need_fix'.tr(),
            background: AppColors.accentLight,
            valueColor: AppColors.accentInk,
            labelColor: AppColors.accentInk,
          ),
        ),
      ],
    );
  }
}

class _CreateEventImportReviewScreenStat extends StatelessWidget {
  const _CreateEventImportReviewScreenStat({
    required this.value,
    required this.label,
    required this.background,
    required this.valueColor,
    required this.labelColor,
  });

  final int value;
  final String label;
  final Color background;
  final Color valueColor;
  final Color labelColor;

  static const double _radius = 18;
  static const double _valueHeight = 1.1;
  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$value',
            style: AppTextStyle.outfitSemiBold26.copyWith(
              color: valueColor,
              height: _valueHeight,
            ),
          ),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.outfitRegular13.copyWith(color: labelColor),
          ),
        ],
      ),
    );
  }
}
