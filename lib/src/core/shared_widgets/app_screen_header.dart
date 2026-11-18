import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/shared_widgets/app_round_icon_button.dart';
import 'package:invit/src/core/utils/functions/helper_methods.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Top bar of the redesigned inner screens: round back button, a title with
/// an optional subtitle and an optional trailing widget.
class AppScreenHeader extends StatelessWidget {
  const AppScreenHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.subtitleMaxLines = 1,
    this.trailing,
    this.onBack,
  });

  final String title;
  final String? subtitle;

  /// `null` lets the subtitle wrap so it is always shown in full.
  final int? subtitleMaxLines;
  final Widget? trailing;

  /// Defaults to popping the current route when there is one.
  final VoidCallback? onBack;

  static const EdgeInsets _padding = EdgeInsets.fromLTRB(16, 8, 16, 8);
  static const double _lineHeight = 1.15;

  @override
  Widget build(BuildContext context) {
    final canGoBack = onBack != null || context.canPop();
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: _padding,
        child: Row(
          spacing: 12,
          children: [
            if (canGoBack)
              AppRoundIconButton(
                icon: Assets.icons.chevronLeftIc,
                matchTextDirection: true,
                onTap: () {
                  dismissKeyboard();
                  if (onBack != null) {
                    onBack!();
                  } else if (context.canPop()) {
                    context.pop();
                  }
                },
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.outfitMedium17.copyWith(
                      color: AppColors.ink,
                      height: _lineHeight,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      maxLines: subtitleMaxLines,
                      overflow: subtitleMaxLines == null
                          ? null
                          : TextOverflow.ellipsis,
                      style: AppTextStyle.outfitRegular12_5.copyWith(
                        color: AppColors.inkLabel,
                        height: _lineHeight,
                      ),
                    ),
                ],
              ),
            ),
            ?trailing,
          ],
        ),
      ),
    );
  }
}
