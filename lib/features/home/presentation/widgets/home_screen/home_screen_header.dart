import 'package:easy_localization/easy_localization.dart';
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

/// Logo, "My events", the message balance pill and the user's initials.
class HomeScreenHeader extends ConsumerWidget {
  const HomeScreenHeader({super.key});

  static const double _height = 48;
  static const double _logoSize = 30;
  static const double _titleLetterSpacing = -0.44;
  static const double _pillHeight = 36;
  static const double _pillIconSize = 16;
  static const double _avatarSize = 40;
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

    return SizedBox(
      height: _height,
      child: Row(
        spacing: 10,
        children: [
          Assets.icons.authBrandMark.svg(width: _logoSize, height: _logoSize),
          Expanded(
            child: Text(
              'home_my_events'.tr(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.outfitMedium22.copyWith(
                color: AppColors.ink,
                letterSpacing: _titleLetterSpacing,
              ),
            ),
          ),
          if (balance != null)
            Material(
              color: AppColors.mistSoft,
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
              color: AppColors.ink,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => context.push(AppRoutes.settingsScreen),
                child: AppInitialsAvatar(
                  name: name,
                  size: _avatarSize,
                  backgroundColor: AppColors.ink,
                  textColor: AppColors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
