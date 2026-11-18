import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event/presentation/utils/guest_phone_number.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_actions_controller.dart';
import 'package:invit/features/guest/presentation/utils/guest_reply_status.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/shared_widgets/app_dialogs.dart';
import 'package:invit/src/core/shared_widgets/app_initials_avatar.dart';
import 'package:invit/src/core/shared_widgets/app_round_icon_button.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';
import 'package:invit/src/core/utils/functions/async_action_listener.dart';
import 'package:invit/src/core/utils/functions/coming_soon.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Bottom sheet with one guest's reply, seats and check-in, and the actions
/// on that guest (edit, resend the invitation, remove).
class GuestsScreenGuestSheet extends ConsumerWidget {
  const GuestsScreenGuestSheet({
    super.key,
    required this.guest,
    required this.occasionId,
  });

  final GuestModel guest;
  final String occasionId;

  static const double _radius = 32;
  static const double _handleWidth = 40;
  static const double _handleHeight = 5;
  static const double _handleRadius = 3;
  static const double _avatarSize = 56;
  static const double _closeSize = 40;
  static const double _closeIconSize = 16;
  static const double _nameLetterSpacing = -0.2;
  static const double _lineHeight = 1.25;
  static const double _bottomInset = 30;
  static const EdgeInsets _padding = EdgeInsets.fromLTRB(20, 10, 20, 0);

  static Future<void> show(
    BuildContext context, {
    required GuestModel guest,
    required String occasionId,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: false,
      backgroundColor: Colors.transparent,
      barrierColor: AppColors.overlay,
      elevation: 0,
      builder: (_) =>
          GuestsScreenGuestSheet(guest: guest, occasionId: occasionId),
    );
  }

  Future<void> _confirmRemove(BuildContext context, WidgetRef ref) async {
    final inviteeId = guest.inviteeId;
    if (inviteeId == null) return;
    final confirmed = await AppDialogs.confirm(
      context,
      title: 'guests_remove_confirm_title'.tr(args: [guest.fullName ?? '']),
      message: 'guests_remove_confirm_message'.tr(),
      cancelText: 'common_cancel'.tr(),
      confirmText: 'create_guests_remove'.tr(),
      destructive: true,
    );
    if (!confirmed || !context.mounted) return;
    ref
        .read(eventDetailsActionsControllerProvider(occasionId).notifier)
        .removeGuest(inviteeId);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      eventDetailsActionsControllerProvider(
        occasionId,
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
          Navigator.of(context).pop();
        },
      ),
    );

    final name = guest.fullName ?? '';
    final number = guest.whatsappNumber;
    final status = GuestReplyStatus.of(guest);
    final seats = guest.partySize;
    final bottomSafeArea = MediaQuery.paddingOf(context).bottom;

    return Container(
      width: double.infinity,
      padding: _padding.copyWith(bottom: _bottomInset + bottomSafeArea),
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
          Row(
            spacing: 14,
            children: [
              AppInitialsAvatar(
                name: name,
                size: _avatarSize,
                textStyle: AppTextStyle.outfitSemiBold19,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.outfitMedium20.copyWith(
                        color: AppColors.ink,
                        letterSpacing: _nameLetterSpacing,
                        height: _lineHeight,
                      ),
                    ),
                    if (number != null)
                      Text(
                        GuestPhoneNumber.fromContact('+$number')?.display ??
                            number,
                        textDirection: TextDirection.ltr,
                        style: AppTextStyle.outfitRegular14.copyWith(
                          color: AppColors.inkLabel,
                          height: _lineHeight,
                        ),
                      ),
                  ],
                ),
              ),
              AppRoundIconButton(
                icon: Assets.icons.closeIc,
                size: _closeSize,
                iconSize: _closeIconSize,
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: _GuestsScreenGuestSheetInfo(
                  label: 'guests_reply'.tr(),
                  value: status.titleKey.tr(),
                  color: status.background,
                ),
              ),
              if (seats != null && seats > 0)
                Expanded(
                  child: _GuestsScreenGuestSheetInfo(
                    label: 'guests_seats'.tr(),
                    value: '$seats',
                    color: AppColors.mistLight,
                  ),
                ),
              // TODO(backend): GuestModel has no check-in field; the value
              // is a fixed "Not yet" until the API returns it.
              Expanded(
                child: _GuestsScreenGuestSheetInfo(
                  label: 'guests_check_in'.tr(),
                  value: 'guests_check_in_not_yet'.tr(),
                  color: AppColors.mistLight,
                ),
              ),
            ],
          ),
          const _GuestsScreenGuestSheetActions(),
          if (guest.inviteeId != null)
            _GuestsScreenGuestSheetRemoveButton(
              onTap: () => _confirmRemove(context, ref),
            ),
        ],
      ),
    );
  }
}

class _GuestsScreenGuestSheetInfo extends StatelessWidget {
  const _GuestsScreenGuestSheetInfo({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  static const double _radius = 16;
  static const double _labelGap = 2;
  static const EdgeInsets _padding = EdgeInsets.all(12);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: _labelGap,
        children: [
          Text(
            label,
            style: AppTextStyle.outfitRegular12_5.copyWith(
              color: AppColors.inkBody,
              height: 1.2,
            ),
          ),
          Text(
            value,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.outfitSemiBold16.copyWith(
              color: AppColors.ink,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

/// "Edit" and "Resend invitation" buttons (widths 10 : 16).
class _GuestsScreenGuestSheetActions extends StatelessWidget {
  const _GuestsScreenGuestSheetActions();

  static const double _height = 52;
  static const double _borderWidth = 1.5;
  static const double _iconSize = 17;
  static const int _editFlex = 10;
  static const int _resendFlex = 16;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 8,
        children: [
          Expanded(
            flex: _editFlex,
            child: Material(
              color: AppColors.white,
              shape: const StadiumBorder(
                side: BorderSide(
                  color: AppColors.mistDark,
                  width: _borderWidth,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                // TODO(backend): no endpoint to edit a single guest.
                onTap: showComingSoon,
                child: Center(
                  child: Text(
                    'guests_edit'.tr(),
                    style: AppTextStyle.outfitMedium15.copyWith(
                      color: AppColors.ink,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _resendFlex,
            child: Material(
              color: AppColors.ink,
              shape: const StadiumBorder(),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                splashColor: AppColors.white.withValues(alpha: 0.12),
                // TODO(backend): no endpoint to resend one guest's invitation.
                onTap: showComingSoon,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Assets.icons.sendIc.svg(
                      width: _iconSize,
                      height: _iconSize,
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'guests_resend_invitation'.tr(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.outfitMedium15.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GuestsScreenGuestSheetRemoveButton extends StatelessWidget {
  const _GuestsScreenGuestSheetRemoveButton({required this.onTap});

  final VoidCallback onTap;

  static const double _height = 40;
  static const double _splashOpacity = 0.08;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: Material(
        color: AppColors.transparentPage,
        shape: const StadiumBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          splashColor: AppColors.dangerInk.withValues(alpha: _splashOpacity),
          onTap: onTap,
          child: Center(
            child: Text(
              'guests_remove'.tr(),
              style: AppTextStyle.outfitMedium15.copyWith(
                color: AppColors.dangerInk,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
