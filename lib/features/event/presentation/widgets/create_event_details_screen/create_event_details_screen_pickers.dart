import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_field.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/utils/functions/helper_methods.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Date and time fields side by side.
class CreateEventDetailsScreenPickers extends ConsumerWidget {
  const CreateEventDetailsScreenPickers({super.key});

  static const int _lastYearOffset = 5;

  Future<void> _pickDate(BuildContext context, WidgetRef ref) async {
    dismissKeyboard();
    final now = DateTime.now();
    final current = ref.read(createEventFlowControllerProvider).date;
    final picked = await showDatePicker(
      context: context,
      initialDate: current != null && !current.isBefore(now) ? current : now,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(now.year + _lastYearOffset),
    );
    if (picked == null) return;
    ref.read(createEventFlowControllerProvider.notifier).updateDate(picked);
  }

  Future<void> _pickTime(BuildContext context, WidgetRef ref) async {
    dismissKeyboard();
    final current = ref.read(createEventFlowControllerProvider).time;
    final picked = await showTimePicker(
      context: context,
      initialTime: current ?? TimeOfDay.now(),
    );
    if (picked == null) return;
    ref.read(createEventFlowControllerProvider.notifier).updateTime(picked);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(
      createEventFlowControllerProvider.select((state) => state.date),
    );
    final time = ref.watch(
      createEventFlowControllerProvider.select((state) => state.time),
    );
    final locale = context.locale.toString();

    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: CreateEventFlowFieldLabel(
            label: 'create_details_date'.tr(),
            child: _CreateEventDetailsScreenPickerField(
              icon: Assets.icons.calendarIc,
              value: date == null
                  ? null
                  : DateFormat('EEE, d MMM yyyy', locale).format(date),
              hint: 'create_details_pick_date'.tr(),
              onTap: () => _pickDate(context, ref),
            ),
          ),
        ),
        Expanded(
          child: CreateEventFlowFieldLabel(
            label: 'create_details_time'.tr(),
            child: _CreateEventDetailsScreenPickerField(
              icon: Assets.icons.clockIc,
              value: time == null
                  ? null
                  : DateFormat.jm(
                      locale,
                    ).format(DateTime(0, 1, 1, time.hour, time.minute)),
              hint: 'create_details_pick_time'.tr(),
              onTap: () => _pickTime(context, ref),
            ),
          ),
        ),
      ],
    );
  }
}

class _CreateEventDetailsScreenPickerField extends StatelessWidget {
  const _CreateEventDetailsScreenPickerField({
    required this.icon,
    required this.value,
    required this.hint,
    required this.onTap,
  });

  final SvgGenImage icon;
  final String? value;
  final String hint;
  final VoidCallback onTap;

  static const double _iconSize = 18;
  static const double _iconGap = 9.5;
  static const EdgeInsetsDirectional _padding = EdgeInsetsDirectional.only(
    start: 12.5,
    end: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.mistLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CreateEventFlowTextField.radius),
        side: const BorderSide(
          color: AppColors.mistBorder,
          width: CreateEventFlowTextField.borderWidth,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: CreateEventFlowTextField.height,
          child: Padding(
            padding: _padding,
            child: Row(
              spacing: _iconGap,
              children: [
                icon.svg(
                  width: _iconSize,
                  height: _iconSize,
                  colorFilter: const ColorFilter.mode(
                    AppColors.inkLabel,
                    BlendMode.srcIn,
                  ),
                ),
                Expanded(
                  child: Text(
                    value ?? hint,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: AppTextStyle.outfitRegular15.copyWith(
                      height: 1.2,
                      color: value == null ? AppColors.inkLabel : AppColors.ink,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
