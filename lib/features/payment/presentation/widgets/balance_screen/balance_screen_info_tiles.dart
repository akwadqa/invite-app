import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// What one invitation, one reminder and an RSVP reply cost.
class BalanceScreenInfoTiles extends StatelessWidget {
  const BalanceScreenInfoTiles({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = 'balance_tile_messages'.tr(
      args: ['${CreateEventFlowConstants.messagesPerGuest}'],
    );
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 8,
        children: [
          Expanded(
            child: _BalanceScreenInfoTile(
              value: messages,
              label: 'balance_per_invitation'.tr(),
            ),
          ),
          Expanded(
            child: _BalanceScreenInfoTile(
              value: messages,
              label: 'balance_per_reminder'.tr(),
            ),
          ),
          Expanded(
            child: _BalanceScreenInfoTile(
              value: 'balance_free'.tr(),
              label: 'balance_rsvp_replies'.tr(),
            ),
          ),
        ],
      ),
    );
  }
}

class _BalanceScreenInfoTile extends StatelessWidget {
  const _BalanceScreenInfoTile({required this.value, required this.label});

  final String value;
  final String label;

  static const double _lineHeight = 1.35;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.mistLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: AppTextStyle.outfitSemiBold14.copyWith(
              color: AppColors.ink,
              height: _lineHeight,
            ),
          ),
          Text(
            label,
            style: AppTextStyle.outfitRegular12_5.copyWith(
              color: AppColors.inkBody,
              height: _lineHeight,
            ),
          ),
        ],
      ),
    );
  }
}
