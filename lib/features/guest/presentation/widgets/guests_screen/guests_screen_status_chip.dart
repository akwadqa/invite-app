import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/guest/presentation/utils/guest_reply_status.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Dot and label of a guest's reply.
class GuestsScreenStatusChip extends StatelessWidget {
  const GuestsScreenStatusChip({super.key, required this.status});

  final GuestReplyStatus status;

  static const double _height = 26;
  static const double _dotSize = 7;
  static const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 10);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: _padding,
      decoration: ShapeDecoration(
        color: status.background,
        shape: const StadiumBorder(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [
          Container(
            width: _dotSize,
            height: _dotSize,
            decoration: BoxDecoration(
              color: status.dot,
              shape: BoxShape.circle,
            ),
          ),
          Text(
            status.titleKey.tr(),
            style: AppTextStyle.outfitMedium12.copyWith(
              color: status.foreground,
            ),
          ),
        ],
      ),
    );
  }
}
