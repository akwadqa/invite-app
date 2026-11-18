import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/widgets/create_event_type_screen/create_event_type_screen_card.dart';
import 'package:invit/features/event/presentation/widgets/create_event_type_screen/create_event_type_screen_carousel.dart';
import 'package:invit/features/home/domain/model/ocation%20type/ocation_type_model.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_empty_data_widget.dart';
import 'package:invit/src/core/shared_widgets/app_error_widget.dart';
import 'package:invit/src/core/shared_widgets/app_network_icon.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/app_round_icon_button.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Step 1: "What are we celebrating?" — pick the occasion type.
class CreateEventTypeScreen extends ConsumerStatefulWidget {
  const CreateEventTypeScreen({super.key});

  @override
  ConsumerState<CreateEventTypeScreen> createState() =>
      _CreateEventTypeScreenState();
}

class _CreateEventTypeScreenState extends ConsumerState<CreateEventTypeScreen> {
  static const double _headerHeight = 44;
  static const double _backIconSize = 20;
  static const double _titleLetterSpacing = -1.02;
  static const double _titleHeight = 1.08;
  static const double _titleToCarousel = 41;
  static const EdgeInsets _headerPadding = EdgeInsets.fromLTRB(20, 9, 20, 0);
  static const EdgeInsets _titlePadding = EdgeInsets.fromLTRB(24, 20, 24, 0);
  static const EdgeInsets _buttonPadding = EdgeInsets.fromLTRB(24, 16, 24, 0);
  static const EdgeInsets _buttonInset = EdgeInsets.only(bottom: 40);
  static const OcationTypeModel _placeholder = OcationTypeModel(
    title: 'Occasion',
    color: '',
  );

  PageController? _pageController;
  int _currentIndex = 0;
  bool _iconsPrecached = false;

  @override
  void initState() {
    super.initState();
    // Coming back to this step keeps the type picked before.
    final picked = ref.read(createEventFlowControllerProvider).occasionType;
    final types = ref.read(homeControllerProvider).value?.occasionTypes;
    final index = types?.indexWhere((type) => type.title == picked) ?? -1;
    _currentIndex = index < 0 ? 0 : index;
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  /// Built once the types are known: the endless carousel starts far from
  /// page 0, at the picked type.
  PageController _controllerFor(int count) {
    return _pageController ??= PageController(
      viewportFraction: CreateEventTypeScreenCarousel.viewportFractionFor(
        MediaQuery.sizeOf(context).width,
      ),
      initialPage: CreateEventTypeScreenCarousel.initialPageFor(
        index: _currentIndex.clamp(0, count - 1),
        count: count,
      ),
    );
  }

  /// Loads every type's icon when the screen opens, so swiping never shows
  /// an empty circle; an icon that fails shows the rings icon instead.
  void _precacheIcons(List<OcationTypeModel> types) {
    if (_iconsPrecached) return;
    _iconsPrecached = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      for (final type in types) {
        AppNetworkIcon.precache(context, type.image);
      }
    });
  }

  void _continue(OcationTypeModel type) {
    ref
        .read(createEventFlowControllerProvider.notifier)
        .selectOccasionType(type.title);
    context.push(AppRoutes.createEventPreviewScreen);
  }

  static String _twoDigits(int value) => value.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    // Keeps the flow alive while its first screen is on the stack.
    ref.watch(createEventFlowControllerProvider.select((s) => s.occasionType));
    final types = ref.watch(
      homeControllerProvider.select(
        (home) => home.whenData((data) => data.occasionTypes),
      ),
    );
    final loaded = types.value ?? const <OcationTypeModel>[];
    if (loaded.isNotEmpty) _precacheIcons(loaded);
    final current = loaded.isEmpty
        ? null
        : loaded[_currentIndex.clamp(0, loaded.length - 1)];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(
              bottom: false,
              child: Padding(
                padding: _headerPadding,
                child: SizedBox(
                  height: _headerHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppRoundIconButton(
                        icon: Assets.icons.chevronLeftIc,
                        iconSize: _backIconSize,
                        matchTextDirection: true,
                        onTap: () {
                          if (context.canPop()) context.pop();
                        },
                      ),
                      // Step 1 of the six create steps, not the carousel position.
                      Text(
                        'create_step'.tr(
                          args: [
                            _twoDigits(CreateEventFlowConstants.typeStep),
                            _twoDigits(CreateEventFlowConstants.totalSteps),
                          ],
                        ),
                        style: AppTextStyle.outfitMedium15.copyWith(
                          color: AppColors.inkLabel,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: _titlePadding,
              child: Text(
                'create_type_title'.tr(),
                style: AppTextStyle.outfitMedium34.copyWith(
                  color: AppColors.ink,
                  letterSpacing: _titleLetterSpacing,
                  height: _titleHeight,
                ),
              ),
            ),
            const SizedBox(height: _titleToCarousel),
            Expanded(
              child: types.when(
                data: (data) => data.isEmpty
                    ? AppEmptyDataWidget(text: 'create_type_empty')
                    : _CreateEventTypeScreenFit(
                        child: Column(
                          spacing: _CreateEventTypeScreenFit.dotsGap,
                          children: [
                            CreateEventTypeScreenCarousel(
                              types: data,
                              controller: _controllerFor(data.length),
                              onPageChanged: (index) =>
                                  setState(() => _currentIndex = index),
                            ),
                            CreateEventTypeScreenDots(
                              count: data.length,
                              currentIndex: _currentIndex,
                            ),
                          ],
                        ),
                      ),
                error: (error, _) => AppErrorWidget(
                  errorMsg: error.toString(),
                  onTap: () =>
                      ref.read(homeControllerProvider.notifier).retry(),
                ),
                loading: () => const _CreateEventTypeScreenFit(
                  child: Skeletonizer(
                    child: CreateEventTypeScreenCard(type: _placeholder),
                  ),
                ),
              ),
            ),
            SafeArea(
              top: false,
              minimum: _buttonInset,
              child: Padding(
                padding: _buttonPadding,
                child: AppPrimaryButton(
                  label: current == null
                      ? 'create_next'.tr()
                      : 'create_type_continue_with'.tr(args: [current.title]),
                  isEnabled: current != null,
                  onPressed: () {
                    if (current != null) _continue(current);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shows the carousel and its dots at their design size, scaled down only
/// when the screen is too short.
class _CreateEventTypeScreenFit extends StatelessWidget {
  const _CreateEventTypeScreenFit({required this.child});

  final Widget child;

  static const double dotsGap = 22;
  static const double _dotsHeight = 6;
  static const double _height =
      CreateEventTypeScreenCard.height + dotsGap + _dotsHeight;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: _height,
          child: Align(alignment: Alignment.topCenter, child: child),
        ),
      ),
    );
  }
}
