import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_navigation.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/app_round_icon_button.dart';
import 'package:invit/src/core/utils/functions/coming_soon.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// White sheet over the bottom of the chat: the template switcher (when
/// there are several templates), the reply tabs, edit and "Looks good".
class CreateEventPreviewScreenControls extends ConsumerWidget {
  const CreateEventPreviewScreenControls({
    super.key,
    required this.isEnabled,
    required this.hasSwitcher,
  });

  final bool isEnabled;
  final bool hasSwitcher;

  static const double _radius = 28;
  static const double _tabsHeight = 40;
  static const double _buttonHeight = 60;
  static const double _gap = 14;
  static const double _top = 16;
  static const double _bottom = 30;
  static const double _switcherHeight = 36;
  static const double _editIconSize = 22;
  static const EdgeInsets _sidePadding = EdgeInsets.symmetric(horizontal: 20);
  static const List<BoxShadow> _shadow = [
    BoxShadow(
      color: AppColors.shadowSheet,
      offset: Offset(0, -10),
      blurRadius: 30,
    ),
  ];

  /// Height of the sheet, so the chat can leave room under its messages.
  static double heightFor(BuildContext context, {required bool hasSwitcher}) {
    return _top +
        (hasSwitcher ? _switcherHeight + _gap : 0) +
        _tabsHeight +
        _gap +
        _buttonHeight +
        _bottom +
        MediaQuery.paddingOf(context).bottom;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        _sidePadding.left,
        _top,
        _sidePadding.right,
        _bottom + MediaQuery.paddingOf(context).bottom,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(_radius)),
        boxShadow: _shadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: _gap,
        children: [
          if (hasSwitcher) const _CreateEventPreviewScreenTemplateSwitcher(),
          const _CreateEventPreviewScreenTabs(),
          Row(
            spacing: 10,
            children: [
              AppRoundIconButton(
                icon: Assets.icons.pencilIc,
                size: _buttonHeight,
                iconSize: _editIconSize,
                // TODO(backend): no endpoint to edit a template's message;
                // the templates come fixed from the server.
                onTap: showComingSoon,
              ),
              Expanded(
                child: AppPrimaryButton(
                  label: 'create_preview_looks_good'.tr(),
                  icon: Assets.icons.arrowRightIc,
                  isEnabled: isEnabled,
                  onPressed: () => CreateEventFlowNavigation.next(
                    context,
                    ref,
                    AppRoutes.createEventDetailsScreen,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// "Invitation / If Confirmed / If Declined" pills.
class _CreateEventPreviewScreenTabs extends ConsumerWidget {
  const _CreateEventPreviewScreenTabs();

  static const double _height = 40;
  static const double _borderWidth = 1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(
      createEventFlowControllerProvider.select((state) => state.previewTab),
    );
    return Row(
      spacing: 8,
      children: [
        for (final tab in TemplatePreviewTab.values)
          Expanded(
            child: Material(
              color: tab == selected ? AppColors.ink : AppColors.white,
              shape: StadiumBorder(
                side: BorderSide(
                  color: tab == selected ? AppColors.ink : AppColors.mistDark,
                  width: _borderWidth,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => ref
                    .read(createEventFlowControllerProvider.notifier)
                    .selectPreviewTab(tab),
                child: SizedBox(
                  height: _height,
                  child: Center(
                    child: Text(
                      tab.titleKey.tr(),
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      style: AppTextStyle.outfitMedium14.copyWith(
                        color: tab == selected
                            ? AppColors.white
                            : AppColors.ink,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// Previous/next between the templates of the occasion type.
class _CreateEventPreviewScreenTemplateSwitcher extends ConsumerWidget {
  const _CreateEventPreviewScreenTemplateSwitcher();

  static const double _buttonSize = 36;
  static const double _iconSize = 16;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final names = ref.watch(
      createEventFlowControllerProvider.select(
        (state) =>
            state.templates.value?.map((template) => template.name).toList() ??
            const <String?>[],
      ),
    );
    final selected = ref.watch(
      createEventFlowControllerProvider.select((state) => state.templateName),
    );
    final index = names.indexOf(selected);
    final notifier = ref.read(createEventFlowControllerProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12,
      children: [
        AppRoundIconButton(
          icon: Assets.icons.chevronLeftIc,
          size: _buttonSize,
          iconSize: _iconSize,
          matchTextDirection: true,
          onTap: () {
            if (index > 0) notifier.selectTemplate(names[index - 1]);
          },
        ),
        Text(
          'create_preview_template_of'.tr(
            args: ['${index + 1}', '${names.length}'],
          ),
          style: AppTextStyle.outfitMedium13.copyWith(
            color: AppColors.inkLabel,
          ),
        ),
        AppRoundIconButton(
          icon: Assets.icons.chevronRightIc,
          size: _buttonSize,
          iconSize: _iconSize,
          matchTextDirection: true,
          onTap: () {
            if (index < names.length - 1) {
              notifier.selectTemplate(names[index + 1]);
            }
          },
        ),
      ],
    );
  }
}
