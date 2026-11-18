import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Small label above a create event input.
class CreateEventFlowFieldLabel extends StatelessWidget {
  const CreateEventFlowFieldLabel({
    super.key,
    required this.label,
    required this.child,
    this.optionalLabel,
  });

  final String label;
  final Widget child;

  /// Lighter suffix after the label, e.g. "(optional)".
  final String? optionalLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 6,
      children: [
        Text.rich(
          TextSpan(
            text: label,
            children: [
              if (optionalLabel != null)
                TextSpan(
                  text: ' $optionalLabel',
                  style: const TextStyle(fontWeight: FontWeight.w400),
                ),
            ],
          ),
          style: AppTextStyle.outfitMedium13.copyWith(
            color: AppColors.inkLabel,
          ),
        ),
        child,
      ],
    );
  }
}

/// Filled rounded text input used across the create event steps. It is
/// white with a black border while focused.
class CreateEventFlowTextField extends StatefulWidget {
  const CreateEventFlowTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    this.fillColor = AppColors.mistLight,
    this.borderColor = AppColors.mistBorder,
    this.textCapitalization = TextCapitalization.sentences,
    this.prefix,
  });

  final TextEditingController controller;
  final String hint;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final Color fillColor;

  /// Border while not focused.
  final Color borderColor;
  final TextCapitalization textCapitalization;
  final Widget? prefix;

  static const double height = 52;
  static const double radius = 16;
  static const double borderWidth = 1.5;
  static const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 16);

  @override
  State<CreateEventFlowTextField> createState() =>
      _CreateEventFlowTextFieldState();
}

class _CreateEventFlowTextFieldState extends State<CreateEventFlowTextField> {
  FocusNode? _ownFocus;

  FocusNode get _focus => widget.focusNode ?? (_ownFocus ??= FocusNode());

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(covariant CreateEventFlowTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode != widget.focusNode) {
      (oldWidget.focusNode ?? _ownFocus)?.removeListener(_onFocusChanged);
      _focus.addListener(_onFocusChanged);
    }
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChanged);
    _ownFocus?.dispose();
    super.dispose();
  }

  void _onFocusChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final isFocused = _focus.hasFocus;
    OutlineInputBorder border(Color color) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(CreateEventFlowTextField.radius),
      borderSide: BorderSide(
        color: color,
        width: CreateEventFlowTextField.borderWidth,
      ),
    );
    return SizedBox(
      height: CreateEventFlowTextField.height,
      child: TextField(
        controller: widget.controller,
        focusNode: _focus,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        cursorColor: AppColors.ink,
        style: AppTextStyle.outfitRegular16.copyWith(color: AppColors.ink),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: AppTextStyle.outfitRegular16.copyWith(
            color: AppColors.inkLabel,
          ),
          filled: true,
          fillColor: isFocused ? AppColors.white : widget.fillColor,
          contentPadding: CreateEventFlowTextField._padding,
          prefixIcon: widget.prefix,
          border: border(widget.borderColor),
          enabledBorder: border(widget.borderColor),
          focusedBorder: border(AppColors.ink),
        ),
      ),
    );
  }
}
