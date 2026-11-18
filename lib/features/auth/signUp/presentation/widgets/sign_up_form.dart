import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/auth/widgets/auth_heading.dart';
import 'package:invit/features/auth/widgets/auth_labeled_field.dart';
import 'sign_up_name_field.dart';
import 'sign_up_name_preview.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuthHeading(
          title: 'auth_name_title'.tr(),
          subtitle: TextSpan(text: 'auth_name_subtitle'.tr()),
        ),
        const SizedBox(height: 32),
        AuthLabeledField(
          label: 'auth_full_name'.tr(),
          child: const SignUpNameField(),
        ),
        const SignUpNamePreview(),
      ],
    );
  }
}
