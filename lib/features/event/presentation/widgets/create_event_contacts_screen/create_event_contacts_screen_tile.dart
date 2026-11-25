import 'package:flutter/material.dart';
import 'package:invit/features/event/presentation/controller/device_contacts/device_contacts_state.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/shared_widgets/app_initials_avatar.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// A phone contact with a round check box.
class CreateEventContactsScreenTile extends StatelessWidget {
  const CreateEventContactsScreenTile({
    super.key,
    required this.contact,
    required this.isSelected,
    required this.onTap,
  });

  final DeviceContact contact;
  final bool isSelected;
  final VoidCallback onTap;

  static const double _height = 64;
  static const double _checkSize = 24;
  static const double _checkIconSize = 14;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: _height,
        child: Row(
          spacing: 12,
          children: [
            AppInitialsAvatar(name: contact.name),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    contact.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.outfitMedium15_5.copyWith(
                      color: AppColors.ink,
                    ),
                  ),
                  Text(
                    contact.phone.display,
                    textDirection: TextDirection.ltr,
                    style: AppTextStyle.outfitRegular13.copyWith(
                      color: AppColors.inkLabel,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: _checkSize,
              height: _checkSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.primary : AppColors.white,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.mistDark,
                ),
              ),
              child: isSelected
                  ? Assets.icons.checkIc.svg(
                      width: _checkIconSize,
                      height: _checkIconSize,
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
