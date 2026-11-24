import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/auth/presentation/utils/qatar_phone_input_formatter.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_actions_controller.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/guest/presentation/controller/edit_guest_controller.dart';
import 'package:invit/features/guest/presentation/utils/edit_guest_screen_args.dart';
import 'package:invit/features/guest/presentation/utils/guest_reply_status.dart';
import 'package:invit/features/guest/presentation/widgets/edit_guest_screen/edit_guest_screen_banner.dart';
import 'package:invit/features/guest/presentation/widgets/edit_guest_screen/edit_guest_screen_fields.dart';
import 'package:invit/features/guest/presentation/widgets/edit_guest_screen/edit_guest_screen_seats.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/shared_widgets/app_dialogs.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/app_screen_header.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';
import 'package:invit/src/core/utils/functions/async_action_listener.dart';
import 'package:invit/src/core/utils/functions/coming_soon.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Status of a draft event, as sent by the backend (nothing was sent yet).
const String _draftStatus = 'Draft';

/// Change a guest's name, number and seats, then save and send the
/// invitation again.
class EditGuestScreen extends ConsumerStatefulWidget {
  const EditGuestScreen({super.key, required this.args});

  final EditGuestScreenArgs args;

  @override
  ConsumerState<EditGuestScreen> createState() => _EditGuestScreenState();
}

class _EditGuestScreenState extends ConsumerState<EditGuestScreen> {
  static const EdgeInsets _padding = EdgeInsets.fromLTRB(16, 8, 16, 24);
  static const EdgeInsets _bottomPadding = EdgeInsets.fromLTRB(24, 0, 24, 0);
  static const EdgeInsets _bottomInset = EdgeInsets.only(bottom: 36);
  static const double _sectionGap = 16;
  static const double _removeHeight = 44;

  late final TextEditingController _name;
  late final TextEditingController _phone;
  final FocusNode _phoneFocus = FocusNode();

  EditGuestScreenArgs get _args => widget.args;

  EditGuestController get _controller => ref.read(
    editGuestControllerProvider(_args.occasionId, _args.guest).notifier,
  );

  @override
  void initState() {
    super.initState();
    final state = ref.read(
      editGuestControllerProvider(_args.occasionId, _args.guest),
    );
    _name = TextEditingController(text: state.name);
    _phone = TextEditingController(
      text: _controller.isQatar
          ? QatarPhoneInputFormatter()
                .formatEditUpdate(
                  TextEditingValue.empty,
                  TextEditingValue(text: state.phone),
                )
                .text
          : state.phone,
    );
    // A number WhatsApp could not reach is what needs fixing.
    if (GuestReplyStatus.of(_args.guest) == GuestReplyStatus.notDelivered) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _phoneFocus.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final error = await _controller.save();
    if (!mounted) return;
    if (error != null) {
      AppToast.errorToast(
        error.messageKey.tr(
          args: ['${CreateEventFlowConstants.minCustomSeats}'],
        ),
      );
      return;
    }
    showComingSoon();
  }

  Future<void> _confirmRemove() async {
    final confirmed = await AppDialogs.confirm(
      context,
      title: 'guests_remove_confirm_title'.tr(
        args: [_args.guest.fullName ?? ''],
      ),
      message: 'guests_remove_confirm_message'.tr(),
      cancelText: 'common_cancel'.tr(),
      confirmText: 'create_guests_remove'.tr(),
      destructive: true,
    );
    if (!confirmed || !mounted) return;
    _controller.remove();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      eventDetailsActionsControllerProvider(
        _args.occasionId,
      ).select((state) => state.removeGuest),
      (previous, next) => handleAsyncAction(
        context,
        previous,
        next,
        onSettled: (result) {
          if (result.hasError) {
            AppToast.errorToast(result.error.toString());
            return;
          }
          AppToast.doneToast('guests_removed'.tr());
          if (context.canPop()) context.pop();
        },
      ),
    );

    final event = ref
        .watch(eventDetailsControllerProvider(ocassionId: _args.occasionId))
        .value;
    final isDraft = event?.status == _draftStatus;
    final isNotDelivered =
        GuestReplyStatus.of(_args.guest) == GuestReplyStatus.notDelivered;
    final canRemove = _args.guest.inviteeId != null;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        body: Column(
          children: [
            AppScreenHeader(
              title: 'edit_guest_title'.tr(),
              subtitle: event?.title,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: _padding,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: _sectionGap,
                  children: [
                    if (isNotDelivered) const EditGuestScreenBanner(),
                    EditGuestScreenFields(
                      args: _args,
                      name: _name,
                      phone: _phone,
                      phoneFocus: _phoneFocus,
                    ),
                    EditGuestScreenSeats(args: _args),
                  ],
                ),
              ),
            ),
            SafeArea(
              top: false,
              minimum: _bottomInset,
              child: Padding(
                padding: _bottomPadding,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (canRemove)
                      SizedBox(
                        height: _removeHeight,
                        child: Center(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: _confirmRemove,
                            child: Text(
                              'edit_guest_remove'.tr(),
                              style: AppTextStyle.outfitMedium15.copyWith(
                                color: AppColors.dangerInk,
                              ),
                            ),
                          ),
                        ),
                      ),
                    AppPrimaryButton(
                      label: isDraft
                          ? 'edit_guest_save'.tr()
                          : 'edit_guest_save_resend'.tr(),
                      subtitle: isDraft ? null : 'edit_guest_uses_one'.tr(),
                      icon: Assets.icons.sendIc,
                      mirrorIconInRtl: false,
                      onPressed: _save,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
