import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/auth/presentation/controller/auth_flow_controller.dart';
import 'package:invit/features/auth/presentation/utils/auth_action_listener.dart';
import 'package:invit/features/auth/widgets/auth_back_button.dart';
import 'package:invit/features/auth/verification/presentation/widgets/verification_screen_heading.dart';
import 'package:invit/features/auth/verification/presentation/widgets/verification_screen_pin.dart';
import 'package:invit/features/auth/verification/presentation/widgets/verification_screen_resend.dart';
import 'package:invit/features/auth/verification/presentation/widgets/verification_screen_verify_button.dart';
import 'package:invit/features/auth/widgets/auth_layout.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';

class VerificationAccountScreen extends ConsumerWidget {
  const VerificationAccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      authFlowControllerProvider.select((s) => s.value?.verifyOtp),
      (prev, next) => handleAuthAction(
        context,
        prev,
        next,
        onSettled: (result) {
          if (result.hasError) {
            AppToast.errorToast(result.error.toString());
          } else if (result.value != null) {
            context.go(AppRoutes.mainScreen);
          }
        },
      ),
    );
    ref.listen(
      authFlowControllerProvider.select((s) => s.value?.resendCode),
      (prev, next) => handleAuthAction(
        context,
        prev,
        next,
        onSettled: (result) {
          if (result.hasError) {
            AppToast.errorToast(result.error.toString());
          }
        },
      ),
    );

    return const AuthLayout(
      top: AuthBackButton(),
      contentTopSpacing: 24,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerificationScreenHeading(),
          SizedBox(height: 48),
          VerificationScreenPin(),
          SizedBox(height: 24),
          VerificationScreenResend(),
        ],
      ),
      bottom: VerificationScreenVerifyButton(),
    );
  }
}
