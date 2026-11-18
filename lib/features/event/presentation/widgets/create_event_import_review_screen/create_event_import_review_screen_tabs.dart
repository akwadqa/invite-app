import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/utils/guest_list_import.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "Needs a fix · 6" / "All · 248" switch.
class CreateEventImportReviewScreenTabs extends ConsumerWidget {
  const CreateEventImportReviewScreenTabs({super.key});

  static const double _radius = 20;
  static const EdgeInsets _padding = EdgeInsets.all(4);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(
      createEventFlowControllerProvider.select((state) => state.guestImportTab),
    );
    final toFix = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.guestImport?.fixCount ?? 0,
      ),
    );
    final all = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.guestImport?.entries.length ?? 0,
      ),
    );
    final notifier = ref.read(createEventFlowControllerProvider.notifier);

    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.mistSoft,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Row(
        spacing: 4,
        children: [
          for (final tab in GuestImportTab.values)
            Expanded(
              child: _CreateEventImportReviewScreenTab(
                label: switch (tab) {
                  GuestImportTab.needsFix => 'import_tab_needs_fix'.tr(
                    args: ['$toFix'],
                  ),
                  GuestImportTab.all => 'import_tab_all'.tr(args: ['$all']),
                },
                isSelected: tab == selected,
                onTap: () => notifier.selectImportTab(tab),
              ),
            ),
        ],
      ),
    );
  }
}

class _CreateEventImportReviewScreenTab extends StatelessWidget {
  const _CreateEventImportReviewScreenTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  static const double _height = 36;
  static const double _radius = 16;
  static const Duration _duration = Duration(milliseconds: 180);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: _duration,
        height: _height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : AppColors.transparentPage,
          borderRadius: BorderRadius.circular(_radius),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? AppColors.shadowMedium
                  : AppColors.transparentPage,
              offset: const Offset(0, 1),
              blurRadius: 3,
            ),
          ],
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.outfitMedium14.copyWith(
            color: isSelected ? AppColors.ink : AppColors.inkLabel,
          ),
        ),
      ),
    );
  }
}
