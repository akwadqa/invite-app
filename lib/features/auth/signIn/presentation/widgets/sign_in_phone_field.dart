import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/auth/presentation/controller/auth_flow_controller.dart';
import 'package:invit/features/auth/presentation/utils/auth_flow_constants.dart';
import 'package:invit/features/auth/presentation/utils/qatar_phone_input_formatter.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "QA +974 | 5512 8890" input. Always laid out left-to-right.
class SignInPhoneField extends ConsumerStatefulWidget {
  const SignInPhoneField({super.key});

  @override
  ConsumerState<SignInPhoneField> createState() => _SignInPhoneFieldState();
}

class _SignInPhoneFieldState extends ConsumerState<SignInPhoneField> {
  final _formatter = QatarPhoneInputFormatter();
  final _focusNode = FocusNode();
  late final TextEditingController _controller;

  static const double _height = 60;
  static const double _radius = 18;
  static const double _borderWidth = 1;
  static const double _numberLetterSpacing = 1.08;
  static const EdgeInsets _numberPadding = EdgeInsets.symmetric(horizontal: 16);

  @override
  void initState() {
    super.initState();
    final phone = ref.read(authFlowControllerProvider).value?.phoneNumber ?? '';
    _controller = TextEditingController(
      text: _formatter
          .formatEditUpdate(
            TextEditingValue.empty,
            TextEditingValue(text: phone),
          )
          .text,
    );
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_onFocusChanged)
      ..dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onFocusChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        height: _height,
        decoration: BoxDecoration(
          color: AppColors.mistLight,
          borderRadius: BorderRadius.circular(_radius),
          border: Border.all(
            width: _borderWidth,
            color: _focusNode.hasFocus ? AppColors.primary : AppColors.mistBorder,
          ),
        ),
        child: Row(
          children: [
            const _SignInPhoneFieldCountry(),
            Expanded(
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                keyboardType: TextInputType.phone,
                inputFormatters: [_formatter],
                cursorColor: AppColors.primary,
                style: AppTextStyle.outfitRegular18.copyWith(
                  color: AppColors.ink,
                  letterSpacing: _numberLetterSpacing,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  isCollapsed: true,
                  contentPadding: _numberPadding,
                ),
                onChanged: (text) => ref
                    .read(authFlowControllerProvider.notifier)
                    .updatePhoneNumber(QatarPhoneInputFormatter.digitsOf(text)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignInPhoneFieldCountry extends StatelessWidget {
  const _SignInPhoneFieldCountry();

  static const double _chevronSize = 12;
  static const EdgeInsets _padding = EdgeInsets.only(left: 16, right: 12);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      decoration: const BoxDecoration(
        border: Border(right: BorderSide(color: AppColors.mistBorder)),
      ),
      child: Row(
        spacing: 6,
        children: [
          Text(
            '${AuthFlowConstants.qatarIsoCode} +${AuthFlowConstants.qatarDialCode}',
            style: AppTextStyle.outfitMedium16.copyWith(color: AppColors.ink),
          ),
          Assets.icons.chevronDownIc.svg(
            width: _chevronSize,
            height: _chevronSize,
            colorFilter: const ColorFilter.mode(AppColors.ink, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}
