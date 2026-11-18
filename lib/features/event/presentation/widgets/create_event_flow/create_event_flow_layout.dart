import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/src/core/shared_widgets/app_screen_header.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Frame of the create event steps: header with the step counter, the step
/// content and a bottom action pinned above the keyboard. With
/// [isBottomFloating] the action floats over the content behind a fade, so
/// lists scroll under it (they add [floatingBottomSpace] at their end).
class CreateEventFlowLayout extends StatelessWidget {
  const CreateEventFlowLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.step,
    required this.body,
    this.bottom,
    this.isBottomFloating = false,
  });

  final String title;
  final String subtitle;
  final int step;
  final Widget body;
  final Widget? bottom;
  final bool isBottomFloating;

  static const EdgeInsets _bottomPadding = EdgeInsets.fromLTRB(24, 8, 24, 0);
  static const double _bottomGap = 36;
  static const EdgeInsets _bottomInset = EdgeInsets.only(bottom: _bottomGap);
  static const double _buttonHeight = 64;
  static const double _fadeHeight = 60;
  static const double _listEndGap = 30;

  /// Space a list keeps at its end so its last row clears the floating
  /// action (button + gap under it + room to breathe).
  static const double floatingBottomSpace =
      _buttonHeight + _bottomGap + _listEndGap;

  /// [floatingBottomSpace] plus the device's bottom inset.
  static double floatingBottomPadding(BuildContext context) =>
      floatingBottomSpace + MediaQuery.viewPaddingOf(context).bottom;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        body: Column(
          children: [
            AppScreenHeader(
              title: title,
              subtitle: subtitle,
              trailing: CreateEventFlowStepChip(step: step),
            ),
            Expanded(
              child: isBottomFloating
                  ? Stack(
                      children: [
                        Positioned.fill(child: body),
                        if (bottom != null)
                          PositionedDirectional(
                            start: 0,
                            end: 0,
                            bottom: 0,
                            child: _CreateEventFlowFloatingBottom(
                              child: _bottomArea(),
                            ),
                          ),
                      ],
                    )
                  : body,
            ),
            if (!isBottomFloating && bottom != null) _bottomArea(),
          ],
        ),
      ),
    );
  }

  Widget _bottomArea() => SafeArea(
    top: false,
    minimum: _bottomInset,
    child: Padding(padding: _bottomPadding, child: bottom),
  );
}

/// The floating action over a fade that hides the rows scrolling under it.
class _CreateEventFlowFloatingBottom extends StatelessWidget {
  const _CreateEventFlowFloatingBottom({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: IgnorePointer(
            child: Column(
              children: [
                const SizedBox(
                  height: CreateEventFlowLayout._fadeHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.transparentPage,
                          AppColors.pageBackground,
                        ],
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: ColoredBox(color: AppColors.pageBackground),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: CreateEventFlowLayout._fadeHeight,
          ),
          child: child,
        ),
      ],
    );
  }
}

/// "3 / 6" pill shown at the end of each step's header.
class CreateEventFlowStepChip extends StatelessWidget {
  const CreateEventFlowStepChip({super.key, required this.step});

  final int step;

  static const double _height = 32;
  static const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 12);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: _padding,
      alignment: Alignment.center,
      decoration: const ShapeDecoration(
        color: AppColors.mist,
        shape: StadiumBorder(),
      ),
      child: Text(
        'create_step'.tr(
          args: ['$step', '${CreateEventFlowConstants.totalSteps}'],
        ),
        style: AppTextStyle.outfitMedium13.copyWith(color: AppColors.ink),
      ),
    );
  }
}
