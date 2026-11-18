import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/auth/presentation/controller/auth_flow_controller.dart';
import 'package:invit/features/auth/presentation/controller/auth_resend_countdown.dart';
import 'package:invit/features/auth/widgets/auth_primary_button.dart';
import 'package:invit/gen/assets.gen.dart';

/// Enabled only while the code is complete and the countdown is running;
/// after it ends the user has to resend a new code.
class VerificationScreenVerifyButton extends ConsumerWidget {
  const VerificationScreenVerifyButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOtpComplete = ref.watch(
      authFlowControllerProvider.select((s) => s.value?.isOtpComplete ?? false),
    );
    final isCodeActive = ref.watch(
      authResendCountdownProvider.select((secondsLeft) => secondsLeft > 0),
    );

    return AuthPrimaryButton(
      label: 'auth_verify'.tr(),
      icon: Assets.icons.checkIc,
      isEnabled: isOtpComplete && isCodeActive,
      mirrorIconInRtl: false,
      onPressed: ref.read(authFlowControllerProvider.notifier).verifyOtp,
    );
  }
}
