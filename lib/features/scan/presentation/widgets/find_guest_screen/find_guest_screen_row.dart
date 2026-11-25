import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_seats_label.dart';
import 'package:invit/features/guest/presentation/utils/guest_reply_status.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// One guest: name, reply · seats and the manual "Check in" button.
class FindGuestScreenRow extends StatelessWidget {
  const FindGuestScreenRow({
    super.key,
    required this.guest,
    required this.onCheckIn,
  });

  final GuestModel guest;
  final VoidCallback onCheckIn;

  static const EdgeInsets _padding = EdgeInsets.fromLTRB(12, 10, 10, 10);
  static const double _radius = 18;
  static const double _dotSize = 7;
  static const double _lineHeight = 1.2;
  static const double _buttonHeight = 40;

  @override
  Widget build(BuildContext context) {
    final reply = GuestReplyStatus.of(guest);
    final seats = guest.partySize;
    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.mistLight,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Row(
        spacing: 12,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                Text(
                  guest.fullName ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.outfitMedium15_5.copyWith(
                    color: AppColors.ink,
                    height: _lineHeight,
                  ),
                ),
                Row(
                  spacing: 6,
                  children: [
                    SizedBox.square(
                      dimension: _dotSize,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: reply.dot,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        [
                          reply.titleKey.tr(),
                          if (seats != null && seats > 0) seatsLabel(seats),
                        ].join(' · '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.outfitRegular12_5.copyWith(
                          color: AppColors.inkLabel,
                          height: _lineHeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onCheckIn,
            child: Container(
              height: _buttonHeight,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: const ShapeDecoration(
                color: AppColors.primary,
                shape: StadiumBorder(),
              ),
              child: Text(
                'find_guest_check_in'.tr(),
                style: AppTextStyle.outfitMedium14.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
