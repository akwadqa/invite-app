import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/localization/current_language.dart';
import 'package:invit/src/core/shared_widgets/app_round_icon_button.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Languages the app ships; each is shown in its own language.
enum ProfileScreenLanguage {
  english('en', 'language_name_en'),
  arabic('ar', 'language_name_ar');

  const ProfileScreenLanguage(this.code, this.nameKey);

  final String code;
  final String nameKey;

  static ProfileScreenLanguage of(Locale locale) => values.firstWhere(
    (language) => language.code == locale.languageCode,
    orElse: () => english,
  );
}

/// Bottom sheet to pick the app language.
class ProfileScreenLanguageSheet extends ConsumerWidget {
  const ProfileScreenLanguageSheet({super.key});

  static const double _radius = 32;
  static const double _handleWidth = 40;
  static const double _handleHeight = 5;
  static const double _handleRadius = 3;
  static const double _closeSize = 40;
  static const double _closeIconSize = 16;
  static const double _bottomInset = 30;
  static const Duration _languageFade = Duration(milliseconds: 350);
  static const EdgeInsets _padding = EdgeInsets.fromLTRB(20, 10, 20, 0);

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: false,
      backgroundColor: Colors.transparent,
      barrierColor: AppColors.overlay,
      elevation: 0,
      builder: (_) => const ProfileScreenLanguageSheet(),
    );
  }

  void _select(
    BuildContext context,
    WidgetRef ref,
    ProfileScreenLanguage language,
  ) {
    if (language != ProfileScreenLanguage.of(context.locale)) {
      ref
          .read(currentLanguageProvider.notifier)
          .changeLanguage(context, language.code);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ProfileScreenLanguage.of(context.locale);
    final bottomSafeArea = MediaQuery.paddingOf(context).bottom;

    return Container(
      width: double.infinity,
      padding: _padding.copyWith(bottom: _bottomInset + bottomSafeArea),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(_radius)),
      ),
      child: AnimatedSwitcher(
        duration: _languageFade,
        child: KeyedSubtree(
          key: ValueKey(context.locale.languageCode),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            children: [
              Center(
                child: Container(
                  width: _handleWidth,
                  height: _handleHeight,
                  margin: const EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                    color: AppColors.mistDark,
                    borderRadius: BorderRadius.circular(_handleRadius),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'change_language'.tr(),
                      style: AppTextStyle.outfitMedium20.copyWith(
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                  AppRoundIconButton(
                    icon: Assets.icons.closeIc,
                    size: _closeSize,
                    iconSize: _closeIconSize,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              for (final language in ProfileScreenLanguage.values)
                _ProfileScreenLanguageOption(
                  label: language.nameKey.tr(),
                  isSelected: language == selected,
                  onTap: () => _select(context, ref, language),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileScreenLanguageOption extends StatelessWidget {
  const _ProfileScreenLanguageOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  static const double _checkSize = 24;
  static const double _checkIconSize = 12;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mistLight : AppColors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? AppColors.ink : AppColors.mistOutline,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: AppTextStyle.outfitMedium16.copyWith(
                  color: AppColors.ink,
                ),
              ),
            ),
            if (isSelected)
              Container(
                width: _checkSize,
                height: _checkSize,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.ink,
                  shape: BoxShape.circle,
                ),
                child: Assets.icons.checkIc.svg(
                  width: _checkIconSize,
                  height: _checkIconSize,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
