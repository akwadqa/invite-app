import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/event_details/domain/model/guest_report_model.dart';
import 'package:invit/features/event_details/presentation/widgets/event_details_screen/event_details_screen_reply_bar.dart';
import 'package:invit/features/guest/presentation/utils/guest_reply_status.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "Replies" card: totals, the Live/Draft chip and one bar per reply.
class EventDetailsScreenRepliesCard extends StatelessWidget {
  const EventDetailsScreenRepliesCard({
    super.key,
    required this.report,
    required this.isDraft,
    required this.onStatusTap,
    this.isPlaceholder = false,
  });

  final GuestReportModel report;
  final bool isDraft;
  final ValueChanged<GuestReplyStatus> onStatusTap;

  /// Loading skeleton: empty tracks without colored bars or values.
  final bool isPlaceholder;

  static const double _radius = 28;
  static const double _borderWidth = 1.5;
  static const double _titleLetterSpacing = -0.42;
  static const double _columnGap = 8;
  static const int _percent = 100;
  static const Duration _stagger = Duration(milliseconds: 80);
  static const EdgeInsets _padding = EdgeInsets.fromLTRB(16, 16, 16, 18);
  static const EdgeInsets _dividerPadding = EdgeInsets.only(
    top: 14,
    bottom: 16,
  );

  /// The smallest bar still fits its percentage, so bars grow from this
  /// height up to the full track for the largest count.
  static const double _minFill = 62 / EventDetailsScreenReplyBar.trackHeight;

  static const List<BoxShadow> _shadow = [
    BoxShadow(
      color: AppColors.shadowFaint,
      offset: Offset(0, 10),
      blurRadius: 30,
    ),
  ];

  int _countOf(GuestReplyStatus status) => switch (status) {
    GuestReplyStatus.confirmed => report.confirmed,
    GuestReplyStatus.noReply => report.pending + report.notSent,
    GuestReplyStatus.declined => report.declined,
    GuestReplyStatus.notDelivered => report.failed,
  };

  @override
  Widget build(BuildContext context) {
    final total = report.totalInvitees;
    final replied = report.confirmed + report.declined;
    final counts = {
      for (final status in GuestReplyStatus.values) status: _countOf(status),
    };
    final maxCount = counts.values.fold(0, (max, c) => c > max ? c : max);
    int percentOf(int count) =>
        total == 0 ? 0 : (count * _percent / total).round();

    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(_radius),
        border: Border.all(color: AppColors.mistOutline, width: _borderWidth),
        boxShadow: _shadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 3,
                  children: [
                    Text(
                      'details_replies'.tr(),
                      style: AppTextStyle.outfitMedium21.copyWith(
                        color: AppColors.ink,
                        letterSpacing: _titleLetterSpacing,
                      ),
                    ),
                    Text(
                      'details_replied_summary'.tr(
                        args: ['$total', '${percentOf(replied)}'],
                      ),
                      style: AppTextStyle.outfitRegular13_5.copyWith(
                        color: AppColors.inkLabel,
                      ),
                    ),
                  ],
                ),
              ),
              _EventDetailsScreenStateChip(isDraft: isDraft),
            ],
          ),
          const Padding(
            padding: _dividerPadding,
            child: Divider(
              height: 1,
              thickness: 1,
              color: AppColors.mistDivider,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: _columnGap,
            children: [
              for (final (index, status) in GuestReplyStatus.values.indexed)
                Expanded(
                  child: EventDetailsScreenReplyBar(
                    status: status,
                    count: counts[status] ?? 0,
                    percent: percentOf(counts[status] ?? 0),
                    fill: isPlaceholder
                        ? 0
                        : maxCount == 0
                        ? _minFill
                        : _minFill +
                              (1 - _minFill) * (counts[status] ?? 0) / maxCount,
                    delay: _stagger * index,
                    animate: !isPlaceholder,
                    onTap: () => onStatusTap(status),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EventDetailsScreenStateChip extends StatelessWidget {
  const _EventDetailsScreenStateChip({required this.isDraft});

  final bool isDraft;

  static const double _height = 26;
  static const double _dotSize = 6;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: ShapeDecoration(
        color: isDraft ? AppColors.mistSoft : AppColors.successLight,
        shape: const StadiumBorder(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [
          Container(
            width: _dotSize,
            height: _dotSize,
            decoration: BoxDecoration(
              color: isDraft ? AppColors.inkMuted : AppColors.successDot,
              shape: BoxShape.circle,
            ),
          ),
          Text(
            isDraft ? 'details_draft'.tr() : 'details_live'.tr(),
            style: AppTextStyle.outfitMedium12.copyWith(
              color: isDraft ? AppColors.inkBody : AppColors.success,
            ),
          ),
        ],
      ),
    );
  }
}
