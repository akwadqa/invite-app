import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/payment/presentation/utils/recharge_format.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Paid, messages added and (when resending) the invitations being sent.
class PaymentSuccessScreenSteps extends StatelessWidget {
  const PaymentSuccessScreenSteps({
    super.key,
    required this.messagesAdded,
    required this.planName,
    required this.isSending,
    required this.guests,
  });

  final int messagesAdded;
  final String planName;
  final bool isSending;
  final int guests;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PaymentSuccessScreenStep(
          title: 'payment_success_paid'.tr(),
          // TODO(backend): nothing confirms that a receipt was emailed; the
          // design promises it.
          subtitle: 'payment_success_receipt'.tr(),
          isDone: true,
          hasConnector: true,
        ),
        _PaymentSuccessScreenStep(
          title: 'payment_success_messages_added'.tr(
            args: [RechargeFormat.thousands(messagesAdded)],
          ),
          subtitle: 'checkout_plan_name'.tr(args: [planName]),
          isDone: true,
          hasConnector: isSending,
        ),
        if (isSending)
          _PaymentSuccessScreenStep(
            title: 'payment_success_sending'.tr(
              args: [RechargeFormat.thousands(guests)],
            ),
            subtitle: 'payment_success_sending_sub'.tr(),
            isDone: false,
            hasConnector: false,
          ),
      ],
    );
  }
}

class _PaymentSuccessScreenStep extends StatelessWidget {
  const _PaymentSuccessScreenStep({
    required this.title,
    required this.subtitle,
    required this.isDone,
    required this.hasConnector,
  });

  final String title;
  final String subtitle;
  final bool isDone;
  final bool hasConnector;

  static const double _lineHeight = 1.25;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 14,
      children: [
        Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: isDone ? AppColors.primary : AppColors.accent,
                shape: BoxShape.circle,
                boxShadow: isDone
                    ? null
                    : const [
                        BoxShadow(
                          color: AppColors.accentLight,
                          spreadRadius: 5,
                        ),
                      ],
              ),
              child: SizedBox.square(
                dimension: 26,
                child: isDone
                    ? Center(
                        child: Assets.icons.checkIc.svg(
                          width: 13,
                          height: 13,
                          colorFilter: const ColorFilter.mode(
                            AppColors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      )
                    : null,
              ),
            ),
            if (hasConnector)
              const SizedBox(
                width: 2,
                height: 20,
                child: ColoredBox(color: AppColors.primary),
              ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.outfitMedium15.copyWith(
                    color: AppColors.ink,
                    height: _lineHeight,
                  ),
                ),
                Text(
                  subtitle,
                  style: AppTextStyle.outfitRegular12_5.copyWith(
                    color: AppColors.inkLabel,
                    height: _lineHeight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
