import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/utils/functions/helper_methods.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// Round back button placed below the status bar. Hidden when there is no
/// route to return to (e.g. opened from a deep link).
class AuthBackButton extends StatelessWidget {
  const AuthBackButton({super.key, this.backgroundColor = AppColors.mistSoft});

  final Color backgroundColor;

  static const double _size = 44;
  static const double _iconSize = 18;
  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 2,
  );

  @override
  Widget build(BuildContext context) {
    if (!context.canPop()) return const SafeArea(child: SizedBox.shrink());

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: _padding,
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Material(
            color: backgroundColor,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                dismissKeyboard();
                context.pop();
              },
              child: SizedBox.square(
                dimension: _size,
                child: Center(
                  child: Assets.icons.chevronLeftIc.svg(
                    width: _iconSize,
                    height: _iconSize,
                    matchTextDirection: true,
                    colorFilter: const ColorFilter.mode(
                      AppColors.ink,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
