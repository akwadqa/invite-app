import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/auth/signIn/presentation/widgets/sign_in_crafted_by.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "Crafted by Akwad Programming" with the app version under it.
class ProfileScreenFooter extends StatelessWidget {
  const ProfileScreenFooter({super.key, required this.version});

  final String version;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 6,
      children: [
        const SignInCraftedBy(),
        Text(
          'profile_version'.tr(args: [version]),
          style: AppTextStyle.outfitRegular12.copyWith(
            color: AppColors.inkFaint,
          ),
        ),
      ],
    );
  }
}
