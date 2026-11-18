import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Messages this event needs against the user's balance.
class CreateEventReviewScreenBalance extends StatelessWidget {
  const CreateEventReviewScreenBalance({
    super.key,
    required this.messagesNeeded,
    required this.balance,
  });

  final int messagesNeeded;

  /// `null` while the balance is unknown; the row is hidden then.
  final num? balance;

  static const double _radius = 22;
  static const double _iconBoxSize = 40;
  static const double _iconSize = 18;
  static const EdgeInsets _padding = EdgeInsets.all(14);

  @override
  Widget build(BuildContext context) {
    final currentBalance = balance;
    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.accentSurface,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Column(
        spacing: 12,
        children: [
          Row(
            spacing: 12,
            children: [
              Container(
                width: _iconBoxSize,
                height: _iconBoxSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Assets.icons.chatBubbleIc.svg(
                  width: _iconSize,
                  height: _iconSize,
                  colorFilter: const ColorFilter.mode(
                    AppColors.ink,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'create_review_messages_needed'.tr(
                        args: ['$messagesNeeded'],
                      ),
                      style: AppTextStyle.outfitMedium15.copyWith(
                        color: AppColors.ink,
                      ),
                    ),
                    Text(
                      'create_review_one_per_guest'.tr(),
                      style: AppTextStyle.outfitRegular13.copyWith(
                        color: AppColors.accentInk,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (currentBalance != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'create_review_balance'.tr(),
                    style: AppTextStyle.outfitRegular13_5.copyWith(
                      color: AppColors.inkBody,
                    ),
                  ),
                  Text(
                    'create_review_messages'.tr(args: ['$currentBalance']),
                    style: AppTextStyle.outfitSemiBold14.copyWith(
                      color: AppColors.ink,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
