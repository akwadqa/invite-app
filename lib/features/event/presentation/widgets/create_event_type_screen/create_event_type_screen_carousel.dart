import 'package:flutter/material.dart';
import 'package:invit/features/event/presentation/widgets/create_event_type_screen/create_event_type_screen_card.dart';
import 'package:invit/features/home/domain/model/ocation%20type/ocation_type_model.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/shared_widgets/app_round_icon_button.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// Endless carousel of occasion cards (the last type is followed by the
/// first) with previous/next buttons. The centered card is the largest.
class CreateEventTypeScreenCarousel extends StatelessWidget {
  const CreateEventTypeScreenCarousel({
    super.key,
    required this.types,
    required this.controller,
    required this.onPageChanged,
  });

  final List<OcationTypeModel> types;

  /// Built with [initialPageFor] and [viewportFractionFor].
  final PageController controller;

  /// Receives the index in [types] of the centered card.
  final ValueChanged<int> onPageChanged;

  /// A far first page so the carousel can loop in both directions.
  static const int _loopBase = 600;
  static const double _arrowInset = 30;
  static const Duration _pageDuration = Duration(milliseconds: 380);
  static const List<BoxShadow> _arrowShadow = [
    BoxShadow(
      color: AppColors.shadowMedium,
      offset: Offset(0, 6),
      blurRadius: 16,
    ),
  ];

  static int initialPageFor({required int index, required int count}) =>
      _loopBase * count + index;

  /// Each page is exactly one card wide, whatever the screen width.
  static double viewportFractionFor(double screenWidth) =>
      (CreateEventTypeScreenCard.width / screenWidth).clamp(0.1, 1.0);

  void _step(BuildContext context, int delta) {
    if (!controller.hasClients) return;
    final target = (controller.page ?? controller.initialPage).round() + delta;
    final reduceMotion = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    if (reduceMotion) {
      controller.jumpToPage(target);
    } else {
      controller.animateToPage(
        target,
        duration: _pageDuration,
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CreateEventTypeScreenCard.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: controller,
            clipBehavior: Clip.none,
            onPageChanged: (page) => onPageChanged(page % types.length),
            itemBuilder: (context, page) => AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                final position =
                    controller.hasClients && controller.position.haveDimensions
                    ? controller.page ?? controller.initialPage.toDouble()
                    : controller.initialPage.toDouble();
                final index = page % types.length;
                return CreateEventTypeScreenCard(
                  type: types[index],
                  delta: page - position,
                  // TODO(backend): occasion_types has no popularity flag;
                  // the first type is tagged "Most popular" for now.
                  isMostPopular: index == 0,
                );
              },
            ),
          ),
          PositionedDirectional(
            start: _arrowInset,
            child: AppRoundIconButton(
              icon: Assets.icons.chevronLeftIc,
              backgroundColor: AppColors.white,
              matchTextDirection: true,
              shadows: _arrowShadow,
              onTap: () => _step(context, -1),
            ),
          ),
          PositionedDirectional(
            end: _arrowInset,
            child: AppRoundIconButton(
              icon: Assets.icons.chevronRightIc,
              backgroundColor: AppColors.white,
              matchTextDirection: true,
              shadows: _arrowShadow,
              onTap: () => _step(context, 1),
            ),
          ),
        ],
      ),
    );
  }
}

/// Page dots under the carousel; the current one is a wide black pill.
class CreateEventTypeScreenDots extends StatelessWidget {
  const CreateEventTypeScreenDots({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  final int count;
  final int currentIndex;

  static const double _dotSize = 6;
  static const double _activeWidth = 22;
  static const Duration _duration = Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 6,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: _duration,
          curve: Curves.easeOutCubic,
          width: isActive ? _activeWidth : _dotSize,
          height: _dotSize,
          decoration: BoxDecoration(
            color: isActive ? AppColors.ink : AppColors.mistDark,
            borderRadius: BorderRadius.circular(_dotSize / 2),
          ),
        );
      }),
    );
  }
}
