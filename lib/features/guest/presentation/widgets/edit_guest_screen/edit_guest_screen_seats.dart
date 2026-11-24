import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/utils/seats_choice.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_field.dart';
import 'package:invit/features/guest/presentation/controller/edit_guest_controller.dart';
import 'package:invit/features/guest/presentation/utils/edit_guest_screen_args.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Seat chips (1 … 5+); the last one shows a field for the exact number.
class EditGuestScreenSeats extends ConsumerStatefulWidget {
  const EditGuestScreenSeats({super.key, required this.args});

  final EditGuestScreenArgs args;

  @override
  ConsumerState<EditGuestScreenSeats> createState() =>
      _EditGuestScreenSeatsState();
}

class _EditGuestScreenSeatsState extends ConsumerState<EditGuestScreenSeats> {
  static const double _gap = 8;
  static const double _labelGap = 8;

  late final TextEditingController _custom;
  final FocusNode _customFocus = FocusNode();

  EditGuestController get _controller => ref.read(
    editGuestControllerProvider(
      widget.args.occasionId,
      widget.args.guest,
    ).notifier,
  );

  @override
  void initState() {
    super.initState();
    _custom = TextEditingController(
      text: ref
          .read(
            editGuestControllerProvider(
              widget.args.occasionId,
              widget.args.guest,
            ),
          )
          .customSeats,
    );
  }

  @override
  void dispose() {
    _custom.dispose();
    _customFocus.dispose();
    super.dispose();
  }

  void _select(int seats) {
    _controller.selectSeats(seats);
    if (SeatsChoice.isMoreOption(seats)) _customFocus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final selected = ref.watch(
      editGuestControllerProvider(
        widget.args.occasionId,
        widget.args.guest,
      ).select((state) => state.seats),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: _labelGap,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 4),
          child: Text(
            'quick_add_seats'.tr(),
            style: AppTextStyle.outfitMedium13.copyWith(
              color: AppColors.inkLabel,
            ),
          ),
        ),
        Row(
          spacing: _gap,
          children: [
            for (final seats in CreateEventFlowConstants.seatOptions)
              Expanded(
                child: _EditGuestScreenSeatChip(
                  label: SeatsChoice.isMoreOption(seats) ? '$seats+' : '$seats',
                  isSelected: seats == selected,
                  onTap: () => _select(seats),
                ),
              ),
          ],
        ),
        if (SeatsChoice.isMoreOption(selected))
          CreateEventFlowTextField(
            controller: _custom,
            focusNode: _customFocus,
            hint: 'quick_add_custom_seats_hint'.tr(
              args: ['${CreateEventFlowConstants.minCustomSeats}'],
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(
                CreateEventFlowConstants.customSeatsDigits,
              ),
            ],
            textInputAction: TextInputAction.done,
            onChanged: _controller.updateCustomSeats,
          ),
      ],
    );
  }
}

class _EditGuestScreenSeatChip extends StatelessWidget {
  const _EditGuestScreenSeatChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  static const double _height = 46;
  static const double _borderWidth = 1.5;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? AppColors.ink : AppColors.white,
      shape: StadiumBorder(
        side: BorderSide(
          color: isSelected ? AppColors.ink : AppColors.mistBorder,
          width: _borderWidth,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: _height,
          child: Center(
            child: Text(
              label,
              style: AppTextStyle.outfitMedium16.copyWith(
                color: isSelected ? AppColors.white : AppColors.ink,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
