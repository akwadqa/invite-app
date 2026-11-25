import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_initials_avatar.dart';
import 'package:invit/src/infrastructure/storage/local_storage_service.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// The message balance pill (opens the payment screen) and the user's
/// initials (open the settings). Used on the home header and the welcome
/// screen; [pillColor] lets the pill stand out from its background.
class HomeScreenActions extends ConsumerWidget {
  const HomeScreenActions({super.key, this.pillColor = AppColors.mistSoft});

  final Color pillColor;

  static const double _pillHeight = 36;
  static const double _pillIconSize = 16;
  static const double _avatarSize = 40;
  static const double _gap = 10;
  static const EdgeInsetsDirectional _pillPadding = EdgeInsetsDirectional.only(
    start: 10,
    end: 12,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(
      homeControllerProvider.select((home) => home.value?.remainingBalance),
    );
    final name = ref.read(localStorageServiceProvider).userInfo.fullName;

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: _gap,
      children: [
        if (balance != null)
          Material(
            color: pillColor,
            shape: const StadiumBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => context.push(AppRoutes.paymentScreen),
              child: SizedBox(
                height: _pillHeight,
                child: Padding(
                  padding: _pillPadding,
                  child: Row(
                    spacing: 6,
                    children: [
                      Assets.icons.chatBubbleIc.svg(
                        width: _pillIconSize,
                        height: _pillIconSize,
                        colorFilter: const ColorFilter.mode(
                          AppColors.ink,
                          BlendMode.srcIn,
                        ),
                      ),
                      Text(
                        '$balance',
                        style: AppTextStyle.outfitMedium13_5.copyWith(
                          color: AppColors.ink,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        if (name.trim().isNotEmpty)
          Material(
            color: AppColors.primary,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => context.push(AppRoutes.settingsScreen),
              child: AppInitialsAvatar(
                name: name,
                size: _avatarSize,
                backgroundColor: AppColors.primary,
                textColor: AppColors.white,
              ),
            ),
          ),
      ],
    );
  }
}
