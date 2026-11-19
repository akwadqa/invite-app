import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/home/presentation/widgets/home_screen/home_screen_actions.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Logo, "My events", the message balance pill and the user's initials.
class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  static const double _height = 48;
  static const double _logoSize = 30;
  static const double _titleLetterSpacing = -0.44;

  @override
  Widget build(BuildContext context) {
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
          const HomeScreenActions(),
        ],
      ),
    );
  }
}
