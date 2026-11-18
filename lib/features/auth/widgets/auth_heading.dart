import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Screen title and description, optionally preceded by [leading].
class AuthHeading extends StatelessWidget {
  const AuthHeading({
    super.key,
    required this.title,
    required this.subtitle,
    this.leading,
    this.spacing = 8,
  });

  final String title;
  final InlineSpan subtitle;
  final Widget? leading;
  final double spacing;

  static const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 28);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: spacing,
        children: [
          ?leading,
          Text(
            title,
            style: AppTextStyle.outfitMedium30.copyWith(color: AppColors.ink),
          ),
          Text.rich(
            subtitle,
            style: AppTextStyle.outfitRegular15.copyWith(
              color: AppColors.inkBody,
            ),
          ),
        ],
      ),
    );
  }
}
