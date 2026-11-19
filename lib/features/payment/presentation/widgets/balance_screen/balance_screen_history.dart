import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/payment/domain/model/balance_entry.dart';
import 'package:invit/features/payment/presentation/controller/balance_controller.dart';
import 'package:invit/features/payment/presentation/widgets/balance_screen/balance_screen_history_row.dart';
import 'package:invit/src/core/shared_widgets/app_error_widget.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// The history lines: skeleton while loading, error with retry, or the rows.
class BalanceScreenHistory extends ConsumerWidget {
  const BalanceScreenHistory({super.key});

  static final BalanceEntry _placeholder = BalanceEntry(
    kind: BalanceEntryKind.invitations,
    label: 'Event title placeholder',
    date: DateTime(2030),
    amount: 100,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(
      balanceControllerProvider.select((value) => value.value?.history),
    );
    if (history == null || (history.isLoading && !history.hasValue)) {
      return Skeletonizer(
        child: Column(
          children: [
            for (var i = 0; i < 4; i++)
              BalanceScreenHistoryRow(entry: _placeholder),
          ],
        ),
      );
    }
    if (history.hasError && !history.hasValue) {
      return AppErrorWidget(
        errorMsg: history.error.toString(),
        onTap: () => ref.read(balanceControllerProvider.notifier).retry(),
      );
    }
    final entries = history.value ?? const <BalanceEntry>[];
    if (entries.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            'balance_history_empty'.tr(),
            style: AppTextStyle.outfitRegular14.copyWith(
              color: AppColors.inkLabel,
            ),
          ),
        ),
      );
    }
    return Column(
      children: [
        for (final entry in entries) BalanceScreenHistoryRow(entry: entry),
      ],
    );
  }
}
