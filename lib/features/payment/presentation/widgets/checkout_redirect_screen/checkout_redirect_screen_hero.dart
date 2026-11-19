import 'package:flutter/material.dart';
import 'package:invit/features/payment/presentation/widgets/checkout_redirect_screen/checkout_redirect_screen_animations.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// The rounded mist block holding the rings and the gathering guests.
class CheckoutRedirectScreenHero extends StatelessWidget {
  const CheckoutRedirectScreenHero({super.key});

  static const double _height = 420;
  static const double _bottomRadius = 48;
  static const double _loaderSize = 140;
  static const double _loaderTop = 160;
  static const double _ringsCenterY = 230;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(_bottomRadius),
        ),
        child: ColoredBox(
          color: AppColors.mist,
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              children: [
                Positioned.fill(
                  child: CheckoutRedirectScreenRipple(
                    center: Offset(constraints.maxWidth / 2, _ringsCenterY),
                  ),
                ),
                Positioned(
                  left: constraints.maxWidth / 2 - _loaderSize / 2,
                  top: _loaderTop,
                  child: const CheckoutRedirectScreenLoader(size: _loaderSize),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
