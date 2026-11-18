import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Small label above an auth input.
class AuthLabeledField extends StatelessWidget {
  const AuthLabeledField({super.key, required this.label, required this.child});

  final String label;
  final Widget child;

  static const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsetsDirectional _labelPadding = EdgeInsetsDirectional.only(
    start: 4,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6,
        children: [
          Padding(
            padding: _labelPadding,
            child: Text(
              label,
              style: AppTextStyle.outfitMedium13.copyWith(
                color: AppColors.inkLabel,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
