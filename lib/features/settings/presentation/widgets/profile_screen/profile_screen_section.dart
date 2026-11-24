import 'package:flutter/material.dart';
import 'package:invit/features/settings/presentation/widgets/profile_screen/profile_screen_glyph.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// One row of a [ProfileScreenSection].
class ProfileScreenRowData {
  const ProfileScreenRowData({
    required this.glyph,
    required this.label,
    required this.onTap,
    this.value,
    this.danger = false,
  });

  final ProfileScreenGlyph glyph;
  final String label;
  final VoidCallback onTap;

  /// Trailing text before the chevron; hidden when `null`.
  final String? value;
  final bool danger;
}

/// Uppercase section label above a bordered list of rows.
class ProfileScreenSection extends StatelessWidget {
  const ProfileScreenSection({
    super.key,
    required this.title,
    required this.rows,
  });

  final String title;
  final List<ProfileScreenRowData> rows;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 8),
          child: Text(
            title.toUpperCase(),
            style: AppTextStyle.outfitMedium12_5.copyWith(
              letterSpacing: 1,
              color: AppColors.inkLabel,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: AppColors.mistOutline, width: 1.5),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.5),
            child: Column(
              children: [
                for (var i = 0; i < rows.length; i++)
                  _ProfileScreenRow(
                    data: rows[i],
                    showDivider: i < rows.length - 1,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileScreenRow extends StatelessWidget {
  const _ProfileScreenRow({required this.data, required this.showDivider});

  final ProfileScreenRowData data;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final color = data.danger ? AppColors.dangerInk : AppColors.ink;
    final value = data.value;

    return GestureDetector(
      onTap: data.onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          border: showDivider
              ? const Border(bottom: BorderSide(color: AppColors.mistDivider))
              : null,
        ),
        child: Row(
          spacing: 12,
          children: [
            Container(
              width: 34,
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: data.danger ? AppColors.dangerLight : AppColors.mistSoft,
                borderRadius: BorderRadius.circular(11),
              ),
              child: ProfileScreenGlyphIcon(data.glyph, color: color),
            ),
            Expanded(
              child: Text(
                data.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.outfitMedium15.copyWith(color: color),
              ),
            ),
            if (value != null)
              Text(
                value,
                style: AppTextStyle.outfitRegular14.copyWith(
                  color: AppColors.inkLabel,
                ),
              ),
            Assets.icons.chevronRightIc.svg(
              width: 16,
              height: 16,
              matchTextDirection: true,
              colorFilter: const ColorFilter.mode(
                AppColors.inkChevron,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
