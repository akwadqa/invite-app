import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/auth/presentation/controller/auth_flow_controller.dart';
import 'package:invit/features/auth/widgets/auth_back_button.dart';
import 'package:invit/features/auth/widgets/auth_hero.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Hero with an avatar showing the initials of the name being typed, and a
/// back button to the sign-in screen.
class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        AuthHero(child: _SignupHeaderAvatar()),
        PositionedDirectional(
          top: 0,
          start: 0,
          child: AuthBackButton(backgroundColor: AppColors.white),
        ),
      ],
    );
  }
}

class _SignupHeaderAvatar extends ConsumerWidget {
  const _SignupHeaderAvatar();

  static const double _size = 96;
  static const double _haloWidth = 8;
  static const double _haloOpacity = 0.45;
  static const double _badgeSize = 20;
  static const double _badgeBorderWidth = 3;
  static const double _badgeTop = 4;
  static const double _badgeEnd = 2;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initials = ref.watch(
      authFlowControllerProvider.select((s) => s.value?.nameInitials ?? ''),
    );

    return SizedBox.square(
      dimension: _size,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.white.withValues(alpha: _haloOpacity),
                  spreadRadius: _haloWidth,
                ),
              ],
            ),
            child: Text(
              initials,
              style: AppTextStyle.outfitSemiBold34.copyWith(
                color: AppColors.ink,
              ),
            ),
          ),
          PositionedDirectional(
            top: _badgeTop,
            end: _badgeEnd,
            child: Container(
              width: _badgeSize,
              height: _badgeSize,
              decoration: BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.white,
                  width: _badgeBorderWidth,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
