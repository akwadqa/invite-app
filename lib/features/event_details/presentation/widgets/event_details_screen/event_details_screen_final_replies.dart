import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/event_details/domain/model/guest_report_model.dart';
import 'package:invit/features/event_details/presentation/widgets/event_details_screen/event_details_screen_reply_bar.dart';
import 'package:invit/features/guest/presentation/utils/guest_reply_status.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Past event: the final replies as one bar per answer.
class EventDetailsScreenFinalReplies extends StatelessWidget {
  const EventDetailsScreenFinalReplies({super.key, required this.report});

  final GuestReportModel report;

  static const double _radius = 26;
  static const double _borderWidth = 1.5;
  static const double _barGap = 10;
  static const double _trackHeight = 170;
  static const double _barRadius = 36;
  static const double _percentBottom = 16;
  static const double _labelGap = 8;
  static const int _percent = 100;
  static const Duration _stagger = Duration(milliseconds: 80);
  static const EdgeInsets _padding = EdgeInsets.fromLTRB(16, 14, 16, 16);
  static const EdgeInsets _dividerPadding = EdgeInsets.only(
    top: 12,
    bottom: 14,
  );

  /// The smallest bar still fits its percentage; the others grow from it.
  static const double _minFill = 62 / _trackHeight;

  /// Answers shown, in order (no "not delivered" once the event is over).
  static const List<GuestReplyStatus> _statuses = [
    GuestReplyStatus.confirmed,
    GuestReplyStatus.noReply,
    GuestReplyStatus.declined,
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
    final counts = {for (final status in _statuses) status: _countOf(status)};
    final maxCount = counts.values.fold(0, (max, c) => c > max ? c : max);
    int percentOf(int count) =>
        total == 0 ? 0 : (count * _percent / total).round();

    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_radius),
        border: Border.all(color: AppColors.mistOutline, width: _borderWidth),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                child: Text(
                  'details_final_replies'.tr(),
                  style: AppTextStyle.outfitMedium18.copyWith(
                    color: AppColors.ink,
                  ),
                ),
              ),
              Text(
                'details_invited_count'.tr(args: ['$total']),
                style: AppTextStyle.outfitRegular13.copyWith(
                  color: AppColors.inkLabel,
                ),
              ),
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
            spacing: _barGap,
            children: [
              for (final (index, status) in _statuses.indexed)
                Expanded(
                  child: EventDetailsScreenReplyBar(
                    status: status,
                    count: counts[status] ?? 0,
                    percent: percentOf(counts[status] ?? 0),
                    fill: maxCount == 0
                        ? _minFill
                        : _minFill +
                              (1 - _minFill) * (counts[status] ?? 0) / maxCount,
                    delay: _stagger * index,
                    trackHeight: _trackHeight,
                    radius: _barRadius,
                    percentBottom: _percentBottom,
                    labelGap: _labelGap,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
