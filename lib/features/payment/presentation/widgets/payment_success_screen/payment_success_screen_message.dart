import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "Payment successful" and what was added to the balance.
class PaymentSuccessScreenMessage extends StatelessWidget {
  const PaymentSuccessScreenMessage({
    super.key,
    required this.messagesAdded,
    required this.isSending,
  });

  final String messagesAdded;

  /// Adds "Your invitations are on their way".
  final bool isSending;

  static const double _titleLetterSpacing = -0.9;

  @override
  Widget build(BuildContext context) {
    final key = isSending
        ? 'payment_success_added_sending'
        : 'payment_success_added';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'payment_success_title'.tr(),
          style: AppTextStyle.outfitMedium30.copyWith(
            color: AppColors.ink,
            height: 1.1,
            letterSpacing: _titleLetterSpacing,
          ),
        ),
        Text(
          key.tr(args: [messagesAdded]),
          style: AppTextStyle.outfitRegular15.copyWith(
            color: AppColors.inkBody,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
