import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/auth/presentation/utils/auth_flow_constants.dart';
import 'package:invit/features/auth/widgets/auth_heading.dart';
import 'package:invit/features/auth/widgets/auth_labeled_field.dart';
import 'sign_in_phone_field.dart';
import 'sign_in_terms.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuthHeading(
          title: 'auth_welcome_title'.tr(),
          subtitle: TextSpan(
            text: 'auth_welcome_subtitle'.tr(
              args: ['${AuthFlowConstants.otpLength}'],
            ),
          ),
        ),
        const SizedBox(height: 32),
        AuthLabeledField(
          label: 'auth_mobile_number'.tr(),
          child: const SignInPhoneField(),
        ),
        const SizedBox(height: 28),
        const SignInTerms(),
      ],
    );
  }
}
