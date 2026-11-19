import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/home/presentation/widgets/home_screen/home_screen_actions.dart';
import 'package:invit/features/home/presentation/widgets/home_screen/home_screen_welcome_hero.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Shown instead of the events list when the account has no event yet:
/// a welcome illustration and the button to create the first invitation.
class HomeScreenWelcome extends StatelessWidget {
  const HomeScreenWelcome({super.key});

  /// Share of the screen's height the illustration takes (540 of 844).
  static const double _heroShare = 540 / 844;
  static const EdgeInsets _buttonPadding = EdgeInsets.fromLTRB(24, 0, 24, 0);
  static const EdgeInsets _bottomInset = EdgeInsets.only(bottom: 40);
  static const double _titleGap = 40;
  static const EdgeInsets _actionsPadding = EdgeInsets.fromLTRB(16, 6, 16, 0);
  static const EdgeInsets _titlePadding = EdgeInsets.symmetric(horizontal: 28);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final heroHeight = (constraints.maxHeight * _heroShare).clamp(
              0.0,
              HomeScreenWelcomeHero.designHeight,
            );
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: HomeScreenWelcomeHero(height: heroHeight),
                ),
                const PositionedDirectional(
                  top: 0,
                  end: 0,
                  child: SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: _actionsPadding,
                      child: HomeScreenActions(pillColor: AppColors.white),
                    ),
                  ),
                ),
                Positioned(
                  top: heroHeight + _titleGap,
                  left: 0,
                  right: 0,
                  child: const Padding(
                    padding: _titlePadding,
                    child: _HomeScreenWelcomeTitle(),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SafeArea(
                    top: false,
                    minimum: _bottomInset,
                    child: Padding(
                      padding: _buttonPadding,
                      child: AppPrimaryButton(
                        label: 'home_create_invitation'.tr(),
                        icon: Assets.icons.arrowUpRightIc,
                        onPressed: () =>
                            context.push(AppRoutes.createEventTypeScreen),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// "Bring your people closer" followed by an accent dot.
class _HomeScreenWelcomeTitle extends StatelessWidget {
  const _HomeScreenWelcomeTitle();

  static const double _dotSize = 10;
  static const double _dotGap = 4;
  static const double _lineHeight = 1.08;
  static const double _letterSpacing = -1.08;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      child: Text.rich(
        TextSpan(
          text: 'home_welcome_title'.tr(),
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: ExcludeSemantics(
                child: Container(
                  width: _dotSize,
                  height: _dotSize,
                  margin: const EdgeInsetsDirectional.only(start: _dotGap),
                  decoration: const BoxDecoration(
                    color: AppColors.accent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
        style: AppTextStyle.outfitMedium36.copyWith(
          color: AppColors.ink,
          height: _lineHeight,
          letterSpacing: _letterSpacing,
        ),
      ),
    );
  }
}
