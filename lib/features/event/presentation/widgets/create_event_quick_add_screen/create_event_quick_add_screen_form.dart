import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/auth/presentation/utils/auth_flow_constants.dart';
import 'package:invit/features/auth/presentation/utils/qatar_phone_input_formatter.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/utils/seats_choice.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_field.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/shared_widgets/app_round_icon_button.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';
import 'package:invit/src/core/utils/functions/helper_methods.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Name, mobile number and seats; Enter on the number adds the guest and
/// moves back to the name for the next one.
class CreateEventQuickAddScreenForm extends ConsumerStatefulWidget {
  const CreateEventQuickAddScreenForm({super.key});

  @override
  ConsumerState<CreateEventQuickAddScreenForm> createState() =>
      _CreateEventQuickAddScreenFormState();
}

class _CreateEventQuickAddScreenFormState
    extends ConsumerState<CreateEventQuickAddScreenForm> {
  static const double _radius = 24;
  static const double _addButtonSize = 52;
  static const double _addIconSize = 22;
  static const EdgeInsets _padding = EdgeInsets.all(14);

  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final QatarPhoneInputFormatter _phoneFormatter = QatarPhoneInputFormatter();
  final TextEditingController _customSeats = TextEditingController();
  final FocusNode _customSeatsFocus = FocusNode();
  int _seats = CreateEventFlowConstants.defaultSeats;

  /// The last option ("5+") is selected: the number is typed in a field.
  bool _isCustomSeats = false;

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _customSeats.dispose();
    _customSeatsFocus.dispose();
    super.dispose();
  }

  void _selectSeats(int seats) {
    final isCustom = SeatsChoice.isMoreOption(seats);
    setState(() {
      _isCustomSeats = isCustom;
      _seats = seats;
    });
    if (isCustom) _customSeatsFocus.requestFocus();
  }

  /// Seats of the guest, or `null` when the typed number is not valid.
  int? get _chosenSeats =>
      _isCustomSeats ? SeatsChoice.parseCustom(_customSeats.text) : _seats;

  void _add() {
    final seats = _chosenSeats;
    if (seats == null) {
      AppToast.errorToast(
        'quick_add_seats_invalid'.tr(
          args: ['${CreateEventFlowConstants.minCustomSeats}'],
        ),
      );
      return;
    }
    final result = ref
        .read(createEventFlowControllerProvider.notifier)
        .addGuest(
          name: _name.text,
          nationalNumber: QatarPhoneInputFormatter.digitsOf(_phone.text),
          seats: seats,
        );
    final error = result.messageKey;
    if (error != null) {
      AppToast.errorToast(
        error.tr(args: ['${AuthFlowConstants.qatarPhoneLength}']),
      );
      return;
    }
    _name.clear();
    _phone.clear();
    _customSeats.clear();
    setState(() {
      _seats = CreateEventFlowConstants.defaultSeats;
      _isCustomSeats = false;
    });
    dismissKeyboard();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.mist,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Column(
        spacing: 10,
        children: [
          CreateEventFlowTextField(
            controller: _name,
            focusNode: _nameFocus,
            hint: 'quick_add_name_hint'.tr(),
            fillColor: AppColors.white,
            borderColor: AppColors.transparentPage,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => _phoneFocus.requestFocus(),
          ),
          Row(
            spacing: 8,
            children: [
              const _CreateEventQuickAddScreenCountry(),
              Expanded(
                child: CreateEventFlowTextField(
                  controller: _phone,
                  focusNode: _phoneFocus,
                  hint: 'quick_add_mobile_hint'.tr(),
                  fillColor: AppColors.white,
                  borderColor: AppColors.transparentPage,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [_phoneFormatter],
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _add(),
                ),
              ),
            ],
          ),
          Row(
            spacing: 8,
            children: [
              Text(
                'quick_add_seats'.tr(),
                style: AppTextStyle.outfitMedium13.copyWith(
                  color: AppColors.inkBody,
                ),
              ),
              Expanded(
                child: _CreateEventQuickAddScreenSeats(
                  selected: _seats,
                  onSelected: _selectSeats,
                ),
              ),
              AppRoundIconButton(
                icon: Assets.icons.plusIc,
                size: _addButtonSize,
                iconSize: _addIconSize,
                backgroundColor: AppColors.primary,
                iconColor: AppColors.white,
                onTap: _add,
              ),
            ],
          ),
          if (_isCustomSeats)
            CreateEventFlowTextField(
              controller: _customSeats,
              focusNode: _customSeatsFocus,
              hint: 'quick_add_custom_seats_hint'.tr(
                args: ['${CreateEventFlowConstants.minCustomSeats}'],
              ),
              fillColor: AppColors.white,
              borderColor: AppColors.transparentPage,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(
                  CreateEventFlowConstants.customSeatsDigits,
                ),
              ],
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _add(),
            ),
        ],
      ),
    );
  }
}

class _CreateEventQuickAddScreenCountry extends StatelessWidget {
  const _CreateEventQuickAddScreenCountry();

  static const double _height = 52;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        '${AuthFlowConstants.qatarIsoCode} +${AuthFlowConstants.qatarDialCode}',
        style: AppTextStyle.outfitMedium15.copyWith(color: AppColors.ink),
      ),
    );
  }
}

class _CreateEventQuickAddScreenSeats extends StatelessWidget {
  const _CreateEventQuickAddScreenSeats({
    required this.selected,
    required this.onSelected,
  });

  final int selected;
  final ValueChanged<int> onSelected;

  static const double _size = 38;

  @override
  Widget build(BuildContext context) {
    const options = CreateEventFlowConstants.seatOptions;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (final seats in options)
          Material(
            color: seats == selected ? AppColors.primary : AppColors.white,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => onSelected(seats),
              child: SizedBox.square(
                dimension: _size,
                child: Center(
                  child: Text(
                    seats == options.last ? '$seats+' : '$seats',
                    style: AppTextStyle.outfitMedium15.copyWith(
                      color: seats == selected
                          ? AppColors.white
                          : AppColors.ink,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
