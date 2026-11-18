import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Outlined shortcut tile ("Guest list", "Balance").
class EventDetailsScreenTile extends StatelessWidget {
  const EventDetailsScreenTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final SvgGenImage icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  static const double _radius = 18;
  static const double _borderWidth = 1.5;
  static const double _iconBoxSize = 34;
  static const double _iconBoxRadius = 11;
  static const double _iconSize = 17;
  static const double _lineHeight = 1.2;
  static const EdgeInsets _padding = EdgeInsets.all(12);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparentPage,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_radius),
        side: const BorderSide(
          color: AppColors.mistOutline,
          width: _borderWidth,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: _padding,
          child: Row(
            spacing: 10,
            children: [
              Container(
                width: _iconBoxSize,
                height: _iconBoxSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.mistSoft,
                  borderRadius: BorderRadius.circular(_iconBoxRadius),
                ),
                child: icon.svg(
                  width: _iconSize,
                  height: _iconSize,
                  colorFilter: const ColorFilter.mode(
                    AppColors.ink,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.outfitMedium14.copyWith(
                        color: AppColors.ink,
                        height: _lineHeight,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.outfitRegular12.copyWith(
                          color: AppColors.inkLabel,
                          height: _lineHeight,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Light blue banner: bell, a bold highlight with a message and an action
/// pill. The whole banner runs the action.
class EventDetailsScreenBanner extends StatelessWidget {
  const EventDetailsScreenBanner({
    super.key,
    required this.highlight,
    required this.message,
    required this.actionLabel,
    required this.onAction,
  });

  final String highlight;
  final String message;
  final String actionLabel;
  final VoidCallback onAction;

  static const double _height = 52;
  static const double _radius = 18;
  static const double _actionHeight = 36;
  static const double _iconSize = 18;
  static const EdgeInsetsDirectional _padding = EdgeInsetsDirectional.only(
    start: 14,
    end: 8,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: Material(
        color: AppColors.accentSurface,
        borderRadius: BorderRadius.circular(_radius),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onAction,
          child: Padding(
            padding: _padding,
            child: Row(
              spacing: 10,
              children: [
                Assets.icons.bellIc.svg(
                  width: _iconSize,
                  height: _iconSize,
                  colorFilter: const ColorFilter.mode(
                    AppColors.accentInk,
                    BlendMode.srcIn,
                  ),
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: highlight,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextSpan(text: ' $message'),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.outfitRegular13_5.copyWith(
                      color: AppColors.accentInk,
                    ),
                  ),
                ),
                Container(
                  height: _actionHeight,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  alignment: Alignment.center,
                  decoration: const ShapeDecoration(
                    color: AppColors.accent,
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    actionLabel,
                    style: AppTextStyle.outfitMedium14.copyWith(
                      color: AppColors.ink,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
