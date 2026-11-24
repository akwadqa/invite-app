import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Avatar with the user's initials, name, phone and the language pill.
class ProfileScreenCard extends StatelessWidget {
  const ProfileScreenCard({
    super.key,
    required this.name,
    required this.phone,
    required this.languageLabel,
    required this.onChangeLanguage,
  });

  final String name;
  final String phone;
  final String languageLabel;
  final VoidCallback onChangeLanguage;

  static const double _avatarSize = 60;
  static const double _lineHeight = 1.25;

  String get _initials {
    final parts = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .take(2);
    return parts.map((part) => part.characters.first).join().toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.mist,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        spacing: 14,
        children: [
          Container(
            width: _avatarSize,
            height: _avatarSize,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.ink,
              shape: BoxShape.circle,
            ),
            child: Text(
              _initials,
              style: AppTextStyle.outfitSemiBold21.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.outfitMedium19.copyWith(
                    color: AppColors.ink,
                    height: _lineHeight,
                  ),
                ),
                if (phone.isNotEmpty)
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      phone,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.outfitRegular14.copyWith(
                        color: AppColors.inkBody,
                        height: _lineHeight,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onChangeLanguage,
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 6,
                children: [
                  Assets.icons.langIc.svg(
                    width: 16,
                    height: 16,
                    colorFilter: const ColorFilter.mode(
                      AppColors.ink,
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    languageLabel,
                    style: AppTextStyle.outfitMedium14.copyWith(
                      color: AppColors.ink,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
