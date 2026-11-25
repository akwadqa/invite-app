import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/guest/presentation/controller/guests_screen_controller.dart';
import 'package:invit/features/guest/presentation/utils/guest_reply_status.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "All / Confirmed / No reply / Declined / Not delivered" tabs with counts.
class GuestsScreenFilters extends ConsumerWidget {
  const GuestsScreenFilters({super.key, required this.occasionId});

  final String occasionId;

  static const double _height = 38;
  static const double _gap = 6;
  static const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 16);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(
      guestsScreenControllerProvider(
        occasionId,
      ).select((state) => state.filter),
    );
    final counts = ref.watch(guestReplyCountsProvider(occasionId));
    final total = counts.values.fold(0, (sum, count) => sum + count);
    final notifier = ref.read(
      guestsScreenControllerProvider(occasionId).notifier,
    );
    final tabs = <(GuestReplyStatus?, String, int)>[
      (null, 'guests_all'.tr(), total),
      for (final status in GuestReplyStatus.values)
        (status, status.titleKey.tr(), counts[status] ?? 0),
    ];

    return SizedBox(
      height: _height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: _padding,
        itemCount: tabs.length,
        separatorBuilder: (_, _) => const SizedBox(width: _gap),
        itemBuilder: (context, index) {
          final (status, label, count) = tabs[index];
          return _GuestsScreenFilterTab(
            label: label,
            count: count,
            isSelected: selected == status,
            onTap: () => notifier.selectFilter(status),
          );
        },
      ),
    );
  }
}

class _GuestsScreenFilterTab extends StatelessWidget {
  const _GuestsScreenFilterTab({
    required this.label,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  static const double _height = 38;
  static const double _borderWidth = 1.5;
  static const double _countOpacity = 0.7;
  static const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 14);

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.white : AppColors.ink;
    return Material(
      color: isSelected ? AppColors.primary : AppColors.white,
      shape: StadiumBorder(
        side: BorderSide(
          color: isSelected ? AppColors.primary : AppColors.mistBorder,
          width: _borderWidth,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: _height,
          padding: _padding,
          alignment: Alignment.center,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '$label '),
                TextSpan(
                  text: '$count',
                  style: TextStyle(
                    color: color.withValues(alpha: _countOpacity),
                  ),
                ),
              ],
            ),
            maxLines: 1,
            softWrap: false,
            style: AppTextStyle.outfitMedium14.copyWith(color: color),
          ),
        ),
      ),
    );
  }
}
