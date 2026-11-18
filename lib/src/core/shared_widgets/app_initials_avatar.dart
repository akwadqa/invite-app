import 'package:flutter/material.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Round avatar showing up to two initials of [name].
class AppInitialsAvatar extends StatelessWidget {
  const AppInitialsAvatar({
    super.key,
    required this.name,
    this.size = 42,
    this.backgroundColor = AppColors.mist,
    this.textColor = AppColors.ink,
    this.textStyle,
  });

  final String name;
  final double size;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle? textStyle;

  static const int _maxInitials = 2;

  static String initialsOf(String name) {
    final parts = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .take(_maxInitials);
    return parts.map((part) => part.characters.first).join().toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: Text(
        initialsOf(name),
        style: (textStyle ?? AppTextStyle.outfitSemiBold14).copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
