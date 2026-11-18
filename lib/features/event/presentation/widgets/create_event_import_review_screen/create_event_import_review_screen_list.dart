import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_state.dart';
import 'package:invit/features/event/presentation/utils/guest_list_import.dart';
import 'package:invit/features/event/presentation/widgets/create_event_import_review_screen/create_event_import_review_screen_fix_sheet.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Rows of the selected tab, in the order of the file.
class CreateEventImportReviewScreenList extends ConsumerWidget {
  const CreateEventImportReviewScreenList({super.key});

  static const EdgeInsets _emptyPadding = EdgeInsets.only(top: 24);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tab = ref.watch(
      createEventFlowControllerProvider.select((state) => state.guestImportTab),
    );
    final draft = ref.watch(
      createEventFlowControllerProvider.select((state) => state.guestImport),
    );
    final entries = switch (tab) {
      GuestImportTab.needsFix => draft?.entriesToFix ?? const [],
      GuestImportTab.all => [...?draft?.entriesToFix, ...?draft?.readyEntries],
    };

    if (entries.isEmpty) {
      return Padding(
        padding: _emptyPadding,
        child: Text(
          'import_all_ready'.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyle.outfitRegular14.copyWith(
            color: AppColors.inkLabel,
          ),
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        final issue = entry.issue;
        return issue == null
            ? _CreateEventImportReviewScreenReadyRow(entry: entry)
            : _CreateEventImportReviewScreenIssueRow(
                entry: entry,
                issue: issue,
              );
      },
    );
  }
}

class _CreateEventImportReviewScreenIssueRow extends ConsumerWidget {
  const _CreateEventImportReviewScreenIssueRow({
    required this.entry,
    required this.issue,
  });

  final GuestImportEntry entry;
  final GuestImportIssue issue;

  static const double _buttonHeight = 34;
  static const EdgeInsets _buttonPadding = EdgeInsets.symmetric(
    horizontal: 15.5,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final row = '${entry.rowNumber}';
    final phone = entry.phone?.display ?? entry.rawPhone;
    final title = entry.name.isEmpty
        ? 'import_row'.tr(args: [row])
        : entry.name;
    final message = issue.messageKey.tr(namedArgs: {'phone': phone});
    final subtitle = issue == GuestImportIssue.missingName
        ? message
        : 'import_row_issue'.tr(namedArgs: {'row': row, 'issue': message});

    return _CreateEventImportReviewScreenRowFrame(
      child: Row(
        spacing: 12,
        children: [
          const _CreateEventImportReviewScreenBadge(
            symbol: '!',
            background: AppColors.accentLight,
            color: AppColors.accentInk,
          ),
          Expanded(
            child: _CreateEventImportReviewScreenRowText(
              title: title,
              subtitle: subtitle,
              subtitleColor: AppColors.accentInk,
            ),
          ),
          Material(
            color: AppColors.white,
            shape: const StadiumBorder(
              side: BorderSide(color: AppColors.mistDark, width: 1.5),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                if (issue.isRemovable) {
                  ref
                      .read(createEventFlowControllerProvider.notifier)
                      .removeImportEntry(entry.id);
                  return;
                }
                CreateEventImportReviewScreenFixSheet.show(
                  context,
                  entry: entry,
                );
              },
              child: Container(
                height: _buttonHeight,
                padding: _buttonPadding,
                alignment: Alignment.center,
                child: Text(
                  issue.actionKey.tr(),
                  style: AppTextStyle.outfitMedium13_5.copyWith(
                    color: AppColors.ink,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CreateEventImportReviewScreenReadyRow extends StatelessWidget {
  const _CreateEventImportReviewScreenReadyRow({required this.entry});

  final GuestImportEntry entry;

  @override
  Widget build(BuildContext context) {
    return _CreateEventImportReviewScreenRowFrame(
      child: Row(
        spacing: 12,
        children: [
          const _CreateEventImportReviewScreenBadge(
            symbol: '✓',
            background: AppColors.successLight,
            color: AppColors.successStrong,
          ),
          Expanded(
            child: _CreateEventImportReviewScreenRowText(
              title: entry.name,
              subtitle: entry.phone?.display ?? entry.rawPhone,
              subtitleColor: AppColors.inkLabel,
            ),
          ),
        ],
      ),
    );
  }
}

/// Row with the divider under it.
class _CreateEventImportReviewScreenRowFrame extends StatelessWidget {
  const _CreateEventImportReviewScreenRowFrame({required this.child});

  final Widget child;

  static const double _minHeight = 62;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: _minHeight),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.mistDivider)),
      ),
      child: child,
    );
  }
}

class _CreateEventImportReviewScreenBadge extends StatelessWidget {
  const _CreateEventImportReviewScreenBadge({
    required this.symbol,
    required this.background,
    required this.color,
  });

  final String symbol;
  final Color background;
  final Color color;

  static const double _size = 34;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: background, shape: BoxShape.circle),
      child: Text(
        symbol,
        style: AppTextStyle.outfitBold15.copyWith(color: color),
      ),
    );
  }
}

class _CreateEventImportReviewScreenRowText extends StatelessWidget {
  const _CreateEventImportReviewScreenRowText({
    required this.title,
    required this.subtitle,
    required this.subtitleColor,
  });

  final String title;
  final String subtitle;
  final Color subtitleColor;

  static const double _lineHeight = 1.25;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.outfitMedium15.copyWith(
              color: AppColors.ink,
              height: _lineHeight,
            ),
          ),
          Text(
            subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.outfitRegular12_5.copyWith(
              color: subtitleColor,
              height: _lineHeight,
            ),
          ),
        ],
      ),
    );
  }
}
