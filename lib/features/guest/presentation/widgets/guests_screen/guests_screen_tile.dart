import 'package:flutter/material.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event/presentation/utils/guest_phone_number.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_seats_label.dart';
import 'package:invit/features/guest/presentation/utils/guest_reply_status.dart';
import 'package:invit/features/guest/presentation/widgets/guests_screen/guests_screen_status_chip.dart';
import 'package:invit/src/core/shared_widgets/app_initials_avatar.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// One invited guest: initials, name, number · seats and reply.
class GuestsScreenTile extends StatelessWidget {
  const GuestsScreenTile({super.key, required this.guest, this.onTap});

  final GuestModel guest;

  /// `null` shows the guest without opening anything (past events).
  final VoidCallback? onTap;

  static const double _avatarSize = 40;
  static const double _lineHeight = 1.25;
  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: 2,
    vertical: 10,
  );

  /// "+974 5512 8890 · 2 seats" without the parts that are missing.
  static String subtitleOf(GuestModel guest) {
    final number = guest.whatsappNumber;
    final phone = number == null
        ? null
        : GuestPhoneNumber.fromContact('+$number')?.display ?? number;
    final seats = guest.partySize;
    return [
      ?phone,
      if (seats != null && seats > 0) seatsLabel(seats),
    ].join(' · ');
  }

  @override
  Widget build(BuildContext context) {
    final name = guest.fullName ?? '';
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: _padding,
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.mistSoft)),
        ),
        child: Row(
          spacing: 12,
          children: [
            AppInitialsAvatar(
              name: name,
              size: _avatarSize,
              backgroundColor: AppColors.mistSoft,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.outfitMedium15.copyWith(
                      color: AppColors.ink,
                      height: _lineHeight,
                    ),
                  ),
                  Text(
                    subtitleOf(guest),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.outfitRegular12_5.copyWith(
                      color: AppColors.inkLabel,
                      height: _lineHeight,
                    ),
                  ),
                ],
              ),
            ),
            GuestsScreenStatusChip(status: GuestReplyStatus.of(guest)),
          ],
        ),
      ),
    );
  }
}
