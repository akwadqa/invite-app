import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:invit/features/home/domain/model/ocation%20type/ocation_type_model.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/shared_widgets/app_network_icon.dart';
import 'package:invit/src/core/utils/extenssions/color_extension.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// One occasion type in the "What are we celebrating?" carousel.
///
/// It moves smoothly between two states by its distance from the center
/// ([delta]): centered it is 290×420 with all its content; one page away it
/// is 270×380, shows its color only and sits 8px further out.
class CreateEventTypeScreenCard extends StatelessWidget {
  const CreateEventTypeScreenCard({
    super.key,
    required this.type,
    this.delta = 0,
    this.isMostPopular = false,
  });

  final OcationTypeModel type;

  /// Pages between this card and the center (0 = centered).
  final double delta;

  /// Shows the "Most popular" tag.
  final bool isMostPopular;

  static const double width = 290;
  static const double height = 420;
  static const double _sideWidth = 270;
  static const double _sideHeight = 380;
  static const double _radius = 40;
  static const double _sideRadius = 36;
  static const double _sideShift = 8;

  /// Content fades out before the card reaches its side size.
  static const double _contentFadeSpeed = 1.6;

  static double _lerp(double a, double b, double t) => a + (b - a) * t;

  @override
  Widget build(BuildContext context) {
    final color = type.color.toColorOrNull ?? AppColors.accentInk;
    final t = delta.abs().clamp(0.0, 1.0);
    final contentOpacity = (1 - t * _contentFadeSpeed).clamp(0.0, 1.0);
    final direction = Directionality.of(context) == TextDirection.rtl ? -1 : 1;

    return Center(
      child: Transform.translate(
        offset: Offset(direction * delta.sign * _sideShift * t, 0),
        child: Container(
          width: _lerp(width, _sideWidth, t),
          height: _lerp(height, _sideHeight, t),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: color.soft,
            borderRadius: BorderRadius.circular(_lerp(_radius, _sideRadius, t)),
          ),
          child: contentOpacity <= 0
              ? null
              : Opacity(
                  opacity: contentOpacity,
                  // The content is always laid out at the full card size.
                  child: OverflowBox(
                    minWidth: width,
                    maxWidth: width,
                    minHeight: height,
                    maxHeight: height,
                    child: _CreateEventTypeScreenCardContent(
                      type: type,
                      color: color,
                      isMostPopular: isMostPopular,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class _CreateEventTypeScreenCardContent extends StatelessWidget {
  const _CreateEventTypeScreenCardContent({
    required this.type,
    required this.color,
    required this.isMostPopular,
  });

  final OcationTypeModel type;
  final Color color;
  final bool isMostPopular;

  static const double _iconCircleSize = 120;
  static const double _iconCircleStart = 85;
  static const double _iconCircleTop = 124;
  static const double _iconSize = 56;
  static const double _iconLift = -1.5;
  static const double _titleLetterSpacing = -1.02;
  static const EdgeInsets _padding = EdgeInsets.all(26);
  static const List<BoxShadow> _iconShadow = [
    BoxShadow(
      color: AppColors.shadowSoft,
      offset: Offset(0, 14),
      blurRadius: 30,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Assets.icons.ringsBackdrop.svg()),
        PositionedDirectional(
          start: _iconCircleStart,
          top: _iconCircleTop,
          child: Container(
            width: _iconCircleSize,
            height: _iconCircleSize,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              boxShadow: _iconShadow,
            ),
            child: Transform.translate(
              offset: const Offset(0, _iconLift),
              child: AppNetworkIcon(
                path: type.image,
                size: _iconSize,
                color: color,
                fallback: Assets.icons.ringsIc.svg(
                  width: _iconSize,
                  height: _iconSize,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: _padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // TODO(backend): the design shows a tag on every type
              // ("Celebrate success", "Gather together"...); occasion_types
              // has no tag or popularity field, so only the first type is
              // tagged "Most popular" for now.
              if (isMostPopular)
                _CreateEventTypeScreenCardTag(
                  label: 'create_type_most_popular'.tr(),
                  color: color,
                )
              else
                const SizedBox.shrink(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(
                    type.title,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: AppTextStyle.outfitMedium34.copyWith(
                      color: AppColors.ink,
                      letterSpacing: _titleLetterSpacing,
                    ),
                  ),
                  // TODO(backend): the design shows a one-line description
                  // here ("Weddings, engagements and milka"); occasion_types
                  // has no description field yet.
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CreateEventTypeScreenCardTag extends StatelessWidget {
  const _CreateEventTypeScreenCardTag({
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 6,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      decoration: const ShapeDecoration(
        color: AppColors.whiteMuted,
        shape: StadiumBorder(),
      ),
      child: Text(
        label,
        style: AppTextStyle.outfitMedium13.copyWith(color: color),
      ),
    );
  }
}
