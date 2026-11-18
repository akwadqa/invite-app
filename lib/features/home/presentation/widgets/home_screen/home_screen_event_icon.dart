import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:invit/features/home/presentation/utils/occasion_type_lookup.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/shared_widgets/app_network_icon.dart';
import 'package:invit/src/core/utils/extenssions/color_extension.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// Occasion type icon in a rounded box tinted with the type's color.
class HomeScreenEventIcon extends ConsumerWidget {
  const HomeScreenEventIcon({
    super.key,
    required this.type,
    this.size = 44,
    this.iconSize = 20,
    this.radius = 14,
    this.backgroundColor,
  });

  final String? type;
  final double size;
  final double iconSize;
  final double radius;

  /// Defaults to a pastel of the type's color.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final occasion = ref.watch(
      homeControllerProvider.select(
        (home) => home.value?.occasionTypes.byName(type),
      ),
    );
    final color = occasion?.color.toColorOrNull ?? AppColors.accentInk;
    final image = occasion?.image;
    final fallback = Assets.icons.ringsIc.svg(
      width: iconSize,
      height: iconSize,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor ?? color.soft,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: AppNetworkIcon(
        path: image,
        size: iconSize,
        color: color,
        fallback: fallback,
      ),
    );
  }
}
