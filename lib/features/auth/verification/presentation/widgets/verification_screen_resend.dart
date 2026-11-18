import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/auth/presentation/controller/auth_flow_controller.dart';
import 'package:invit/features/auth/presentation/controller/auth_resend_countdown.dart';
import 'package:invit/src/core/utils/functions/helper_methods.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "Resend code in 0:24" while counting down, then a "Resend code" link.
class VerificationScreenResend extends ConsumerWidget {
  const VerificationScreenResend({super.key});

  static const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 24);
  static const double _rowHeight = 34;
  static const int _secondsPerMinute = 60;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final secondsLeft = ref.watch(authResendCountdownProvider);

    final Widget child;
    if (secondsLeft > 0) {
      final minutes = secondsLeft ~/ _secondsPerMinute;
      final seconds = (secondsLeft % _secondsPerMinute).toString().padLeft(
        2,
        '0',
      );
      child = Text.rich(
        style: AppTextStyle.outfitRegular14.copyWith(color: AppColors.inkLabel),
        TextSpan(
          children: [
            TextSpan(text: '${'auth_resend_code_in'.tr()} '),
            TextSpan(
              text: '$minutes:$seconds',
              style: AppTextStyle.outfitSemiBold14.copyWith(
                color: AppColors.ink,
              ),
            ),
          ],
        ),
      );
    } else {
      child = GestureDetector(
        onTap: () {
          dismissKeyboard();
          ref.read(authFlowControllerProvider.notifier).resendCode();
        },
        child: Text(
          'resend_code'.tr(),
          style: AppTextStyle.outfitMedium14.copyWith(
            color: AppColors.ink,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.ink,
          ),
        ),
      );
    }

    return Padding(
      padding: _padding,
      child: SizedBox(
        height: _rowHeight,
        child: Align(alignment: AlignmentDirectional.centerStart, child: child),
      ),
    );
  }
}
