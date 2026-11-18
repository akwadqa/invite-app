import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/auth/presentation/controller/auth_flow_controller.dart';
import 'package:invit/features/auth/widgets/auth_primary_button.dart';
import 'package:invit/gen/assets.gen.dart';

class SignUpContinueButton extends ConsumerWidget {
  const SignUpContinueButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(
      authFlowControllerProvider.select(
        (s) => s.value?.isFullNameValid ?? false,
      ),
    );

    return AuthPrimaryButton(
      label: 'continue'.tr(),
      icon: Assets.icons.arrowRightIc,
      isEnabled: isValid,
      onPressed: ref.read(authFlowControllerProvider.notifier).createAccount,
    );
  }
}
