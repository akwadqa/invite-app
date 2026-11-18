import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// Circular icon button used in headers and sheets (back, close, add...).
class AppRoundIconButton extends StatelessWidget {
  const AppRoundIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 44,
    this.iconSize = 18,
    this.backgroundColor = AppColors.mistSoft,
    this.iconColor = AppColors.ink,
    this.matchTextDirection = false,
    this.shadows,
  });

  final SvgGenImage icon;
  final VoidCallback onTap;
  final double size;
  final double iconSize;
  final Color backgroundColor;
  final Color iconColor;
  final bool matchTextDirection;
  final List<BoxShadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: shadows),
      child: Material(
        color: backgroundColor,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: SizedBox.square(
            dimension: size,
            child: Center(
              child: icon.svg(
                width: iconSize,
                height: iconSize,
                matchTextDirection: matchTextDirection,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
