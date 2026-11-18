import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/auth/presentation/controller/auth_flow_controller.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "Shows as · Hosted by `name`". Hidden until a name is typed.
class SignUpNamePreview extends ConsumerWidget {
  const SignUpNamePreview({super.key});

  static const EdgeInsets _margin = EdgeInsets.fromLTRB(20, 28, 20, 0);
  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 12,
  );
  static const double _radius = 16;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(
      authFlowControllerProvider.select((s) => s.value?.fullName.trim() ?? ''),
    );
    if (name.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: _margin,
      padding: _padding,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.mistLight,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Row(
        spacing: 10,
        children: [
          Text(
            'auth_shows_as'.tr(),
            style: AppTextStyle.outfitRegular13.copyWith(
              color: AppColors.inkLabel,
            ),
          ),
          Expanded(
            child: Text(
              'auth_hosted_by'.tr(namedArgs: {'name': name}),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.outfitMedium14.copyWith(color: AppColors.ink),
            ),
          ),
        ],
      ),
    );
  }
}
