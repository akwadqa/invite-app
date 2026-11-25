import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/auth/presentation/controller/auth_flow_controller.dart';
import 'package:invit/features/auth/presentation/utils/auth_flow_constants.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';
import 'package:pinput/pinput.dart';

class VerificationScreenPin extends ConsumerStatefulWidget {
  const VerificationScreenPin({super.key});

  @override
  ConsumerState<VerificationScreenPin> createState() =>
      _VerificationScreenPinState();
}

class _VerificationScreenPinState extends ConsumerState<VerificationScreenPin> {
  final _controller = TextEditingController();

  static const double _cellHeight = 64;
  static const double _gap = 8;
  static const double _radius = 16;
  static const double _cursorWidth = 2;
  static const double _cursorHeight = 26;
  static const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  PinTheme _theme({
    required double width,
    required Color fill,
    required Color border,
  }) {
    return PinTheme(
      width: width,
      height: _cellHeight,
      textStyle: AppTextStyle.outfitMedium26.copyWith(color: AppColors.ink),
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(_radius),
        border: Border.all(color: border),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // A resent code invalidates whatever was typed.
    ref.listen(authFlowControllerProvider.select((s) => s.value?.otp ?? ''), (
      _,
      otp,
    ) {
      if (otp.isEmpty && _controller.text.isNotEmpty) _controller.clear();
    });
    final hasError = ref.watch(
      authFlowControllerProvider.select(
        (s) => s.value?.verifyOtp.hasError ?? false,
      ),
    );

    return Padding(
      padding: _padding,
      child: LayoutBuilder(
        builder: (context, constraints) {
          const length = AuthFlowConstants.otpLength;
          final cellWidth =
              (constraints.maxWidth - _gap * (length - 1)) / length;
          final empty = _theme(
            width: cellWidth,
            fill: AppColors.mistLight,
            border: AppColors.mistBorder,
          );

          return Directionality(
            textDirection: TextDirection.ltr,
            child: Semantics(
              label: 'auth_verification_code'.tr(),
              child: Pinput(
                controller: _controller,
                length: length,
                autofocus: true,
                separatorBuilder: (_) => const SizedBox(width: _gap),
                defaultPinTheme: empty,
                focusedPinTheme: empty,
                submittedPinTheme: _theme(
                  width: cellWidth,
                  fill: AppColors.white,
                  border: AppColors.primary,
                ),
                errorPinTheme: _theme(
                  width: cellWidth,
                  fill: AppColors.white,
                  border: AppColors.darkRed,
                ),
                forceErrorState: hasError,
                showCursor: true,
                cursor: Container(
                  width: _cursorWidth,
                  height: _cursorHeight,
                  color: AppColors.primary,
                ),
                onChanged: ref
                    .read(authFlowControllerProvider.notifier)
                    .updateOtp,
                onCompleted: (_) =>
                    ref.read(authFlowControllerProvider.notifier).verifyOtp(),
              ),
            ),
          );
        },
      ),
    );
  }
}
