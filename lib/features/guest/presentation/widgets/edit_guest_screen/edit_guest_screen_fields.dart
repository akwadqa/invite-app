import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/auth/presentation/utils/auth_flow_constants.dart';
import 'package:invit/features/auth/presentation/utils/qatar_phone_input_formatter.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_field.dart';
import 'package:invit/features/guest/presentation/controller/edit_guest_controller.dart';
import 'package:invit/features/guest/presentation/utils/edit_guest_screen_args.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// The name and mobile number fields, with the previous number under it once
/// the number was changed.
class EditGuestScreenFields extends ConsumerWidget {
  const EditGuestScreenFields({
    super.key,
    required this.args,
    required this.name,
    required this.phone,
    required this.phoneFocus,
  });

  final EditGuestScreenArgs args;
  final TextEditingController name;
  final TextEditingController phone;
  final FocusNode phoneFocus;

  static const double _gap = 16;
  static const double _labelGap = 6;
  static const double _countryRadius = 16;
  static const double _borderWidth = 1.5;
  static const int _foreignDigits = 12;

  EditGuestController _controller(WidgetRef ref) => ref.read(
    editGuestControllerProvider(args.occasionId, args.guest).notifier,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = _controller(ref);
    final dialCode = ref.watch(
      editGuestControllerProvider(
        args.occasionId,
        args.guest,
      ).select((state) => state.dialCode),
    );
    final typedPhone = ref.watch(
      editGuestControllerProvider(
        args.occasionId,
        args.guest,
      ).select((state) => state.phone),
    );
    final isQatar = dialCode == AuthFlowConstants.qatarDialCode;
    final previous = controller.previousNumber;
    final showPrevious =
        previous != null && controller.isPhoneChanged && typedPhone.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: _gap,
      children: [
        _EditGuestScreenLabeled(
          label: 'edit_guest_name'.tr(),
          child: CreateEventFlowTextField(
            controller: name,
            hint: 'quick_add_name_hint'.tr(),
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            onChanged: controller.updateName,
          ),
        ),
        _EditGuestScreenLabeled(
          label: 'edit_guest_phone'.tr(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: _labelGap,
            children: [
              Row(
                spacing: 8,
                children: [
                  Container(
                    height: CreateEventFlowTextField.height,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.mistLight,
                      borderRadius: BorderRadius.circular(_countryRadius),
                      border: Border.all(
                        color: AppColors.mistBorder,
                        width: _borderWidth,
                      ),
                    ),
                    child: Text(
                      isQatar
                          ? '${AuthFlowConstants.qatarIsoCode} +$dialCode'
                          : '+$dialCode',
                      textDirection: TextDirection.ltr,
                      style: AppTextStyle.outfitMedium15.copyWith(
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                  Expanded(
                    child: CreateEventFlowTextField(
                      controller: phone,
                      focusNode: phoneFocus,
                      hint: 'quick_add_mobile_hint'.tr(),
                      keyboardType: TextInputType.phone,
                      inputFormatters: isQatar
                          ? [QatarPhoneInputFormatter()]
                          : [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(_foreignDigits),
                            ],
                      textInputAction: TextInputAction.done,
                      onChanged: controller.updatePhone,
                    ),
                  ),
                ],
              ),
              if (showPrevious)
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 4),
                  child: Text(
                    'edit_guest_was'.tr(args: [previous]),
                    textDirection: TextDirection.ltr,
                    style: AppTextStyle.outfitRegular12_5.copyWith(
                      color: AppColors.inkLabel,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _EditGuestScreenLabeled extends StatelessWidget {
  const _EditGuestScreenLabeled({required this.label, required this.child});

  final String label;
  final Widget child;

  static const double _gap = 6;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: _gap,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 4),
          child: Text(
            label,
            style: AppTextStyle.outfitMedium13.copyWith(
              color: AppColors.inkLabel,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
