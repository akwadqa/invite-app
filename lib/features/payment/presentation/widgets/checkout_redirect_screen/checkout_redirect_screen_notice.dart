import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "Please don't close Invite while you pay."
class CheckoutRedirectScreenNotice extends StatelessWidget {
  const CheckoutRedirectScreenNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.accentLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        spacing: 10,
        children: [
          Assets.icons.infoIc.svg(
            width: 20,
            height: 20,
            colorFilter: const ColorFilter.mode(
              AppColors.accentInk,
              BlendMode.srcIn,
            ),
          ),
          Expanded(
            child: Text(
              'checkout_redirect_notice'.tr(),
              style: AppTextStyle.outfitRegular13.copyWith(
                color: AppColors.accentInk,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
