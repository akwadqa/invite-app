import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_state.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_field.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Sheet to correct one uploaded row's name and number.
class CreateEventImportReviewScreenFixSheet extends ConsumerStatefulWidget {
  const CreateEventImportReviewScreenFixSheet({super.key, required this.entry});

  final GuestImportEntry entry;

  static Future<void> show(
    BuildContext context, {
    required GuestImportEntry entry,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: false,
      backgroundColor: Colors.transparent,
      barrierColor: AppColors.overlay,
      elevation: 0,
      builder: (_) => CreateEventImportReviewScreenFixSheet(entry: entry),
    );
  }

  @override
  ConsumerState<CreateEventImportReviewScreenFixSheet> createState() =>
      _CreateEventImportReviewScreenFixSheetState();
}

class _CreateEventImportReviewScreenFixSheetState
    extends ConsumerState<CreateEventImportReviewScreenFixSheet> {
  static const double _radius = 32;
  static const double _handleWidth = 40;
  static const double _handleHeight = 5;
  static const double _handleRadius = 3;
  static const double _bottomInset = 30;
  static const EdgeInsets _padding = EdgeInsets.fromLTRB(20, 10, 20, 0);

  late final TextEditingController _name;
  late final TextEditingController _phone;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.entry.name);
    _phone = TextEditingController(text: widget.entry.rawPhone);
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    super.dispose();
  }

  void _save() {
    ref
        .read(createEventFlowControllerProvider.notifier)
        .updateImportEntry(
          widget.entry.id,
          name: _name.text,
          phone: _phone.text,
        );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final bottom =
        MediaQuery.viewInsetsOf(context).bottom +
        MediaQuery.paddingOf(context).bottom +
        _bottomInset;

    return Container(
      width: double.infinity,
      padding: _padding.copyWith(bottom: bottom),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(_radius)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16,
        children: [
          Center(
            child: Container(
              width: _handleWidth,
              height: _handleHeight,
              decoration: BoxDecoration(
                color: AppColors.mistDark,
                borderRadius: BorderRadius.circular(_handleRadius),
              ),
            ),
          ),
          Text(
            'import_fix_title'.tr(args: ['${widget.entry.rowNumber}']),
            style: AppTextStyle.outfitMedium17.copyWith(color: AppColors.ink),
          ),
          CreateEventFlowFieldLabel(
            label: 'import_fix_name_label'.tr(),
            child: CreateEventFlowTextField(
              controller: _name,
              hint: 'quick_add_name_hint'.tr(),
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
            ),
          ),
          CreateEventFlowFieldLabel(
            label: 'import_fix_phone_label'.tr(),
            child: CreateEventFlowTextField(
              controller: _phone,
              hint: 'import_fix_phone_hint'.tr(),
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _save(),
            ),
          ),
          AppPrimaryButton(
            label: 'import_fix_save'.tr(),
            icon: Assets.icons.checkIc,
            mirrorIconInRtl: false,
            onPressed: _save,
          ),
        ],
      ),
    );
  }
}
