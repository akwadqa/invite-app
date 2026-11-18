import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/auth/presentation/controller/auth_flow_controller.dart';
import 'package:invit/features/auth/presentation/utils/auth_action_listener.dart';
import 'package:invit/features/auth/widgets/auth_layout.dart';
import 'package:invit/src/application/router/app_routes.dart';
import '../widgets/sign_in_crafted_by.dart';
import '../widgets/sign_in_form.dart';
import '../widgets/sign_in_header.dart';
import '../widgets/sign_in_send_code_button.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      authFlowControllerProvider.select((s) => s.value?.sendCode),
      (prev, next) => handleAuthAction(
        context,
        prev,
        next,
        onSettled: (result) {
          if (result.hasError) {
            AppToast.errorToast(result.error.toString());
            return;
          }
          final response = result.value;
          if (response == null) return;
          context.push(
            response.validation.userExist
                ? AppRoutes.verificationScreen
                : AppRoutes.signUpScreen,
          );
        },
      ),
    );

    return const AuthLayout(
      top: SignInHeader(),
      content: SignInForm(),
      bottom: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 27,
        children: [SignInSendCodeButton(), SignInCraftedBy()],
      ),
    );
  }
}
