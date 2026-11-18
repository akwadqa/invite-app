import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/auth/presentation/controller/auth_flow_controller.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

class SignUpNameField extends ConsumerStatefulWidget {
  const SignUpNameField({super.key});

  @override
  ConsumerState<SignUpNameField> createState() => _SignUpNameFieldState();
}

class _SignUpNameFieldState extends ConsumerState<SignUpNameField> {
  late final TextEditingController _controller;

  static const double _radius = 18;
  static const EdgeInsets _contentPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 18,
  );

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: ref.read(authFlowControllerProvider).value?.fullName,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(_radius),
    borderSide: BorderSide(color: color),
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.done,
      cursorColor: AppColors.ink,
      style: AppTextStyle.outfitRegular18.copyWith(color: AppColors.ink),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        isDense: true,
        contentPadding: _contentPadding,
        enabledBorder: _border(AppColors.mistBorder),
        focusedBorder: _border(AppColors.ink),
      ),
      onChanged: ref.read(authFlowControllerProvider.notifier).updateFullName,
      onSubmitted: (_) =>
          ref.read(authFlowControllerProvider.notifier).createAccount(),
    );
  }
}
