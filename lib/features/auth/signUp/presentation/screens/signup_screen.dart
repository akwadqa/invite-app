import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/auth/presentation/controller/auth_flow_controller.dart';
import 'package:invit/features/auth/presentation/utils/auth_action_listener.dart';
import 'package:invit/features/auth/signUp/presentation/widgets/sign_up_form.dart';
import 'package:invit/features/auth/signUp/presentation/widgets/sign_up_header.dart';
import 'package:invit/features/auth/signUp/presentation/widgets/sign_up_continue_button.dart';
import 'package:invit/features/auth/widgets/auth_layout.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      authFlowControllerProvider.select((s) => s.value?.createAccount),
      (prev, next) => handleAuthAction(
        context,
        prev,
        next,
        onSettled: (result) {
          if (result.hasError) {
            AppToast.errorToast(result.error.toString());
          } else if (result.value != null) {
            context.push(AppRoutes.verificationScreen);
          }
        },
      ),
    );

    return const AuthLayout(
      top: SignupHeader(),
      content: SignUpForm(),
      bottom: SignUpContinueButton(),
    );
  }
}
