import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event_details/domain/model/guest_report_model.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/event_details/presentation/controller/send_reminder_controller.dart';
import 'package:invit/features/event_details/presentation/utils/reminder_audience.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// The options for who gets the message, two to a row.
class SendReminderScreenAudiences extends ConsumerWidget {
  const SendReminderScreenAudiences({super.key, required this.args});

  final SendReminderScreenArgs args;

  static const int _perRow = 2;
  static const double _gap = 8;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.watch(
      eventDetailsControllerProvider(
        ocassionId: args.occasionId,
      ).select((event) => event.value?.guestReport ?? const GuestReportModel()),
    );
    final selected = ref.watch(
      sendReminderControllerProvider(
        args.occasionId,
        args.audience,
      ).select((state) => state.audience),
    );
    final notifier = ref.read(
      sendReminderControllerProvider(args.occasionId, args.audience).notifier,
    );
    // "Not delivered" is offered only when there is something to resend.
    final audiences = [
      for (final audience in ReminderAudience.values)
        if (audience != ReminderAudience.notDelivered ||
            audience.countIn(report) > 0 ||
            audience == args.audience)
          audience,
    ];

    return Column(
      spacing: _gap,
      children: [
        for (var start = 0; start < audiences.length; start += _perRow)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: _gap,
              children: [
                for (var i = 0; i < _perRow; i++)
                  Expanded(
                    child: start + i < audiences.length
                        ? _SendReminderScreenOption(
                            audience: audiences[start + i],
                            count: audiences[start + i].countIn(report),
                            isSelected: audiences[start + i] == selected,
                            onTap: () => notifier.select(audiences[start + i]),
                          )
                        : const SizedBox.shrink(),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

class _SendReminderScreenOption extends StatelessWidget {
  const _SendReminderScreenOption({
    required this.audience,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  final ReminderAudience audience;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  static const double _radius = 18;
  static const double _dotSize = 7;
  static const double _selectedBorder = 2;
  static const double _border = 1.5;
  static const double _gap = 3;
  static const double _countLetterSpacing = -0.4;
  static const Duration _duration = Duration(milliseconds: 150);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: _duration,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.optionSelectedSurface : AppColors.white,
          borderRadius: BorderRadius.circular(_radius),
          border: Border.all(
            color: isSelected ? AppColors.ink : AppColors.mistBorder,
            width: isSelected ? _selectedBorder : _border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: _gap,
          children: [
            Row(
              spacing: 6,
              children: [
                Container(
                  width: _dotSize,
                  height: _dotSize,
                  decoration: BoxDecoration(
                    color: audience.dot,
                    shape: BoxShape.circle,
                  ),
                ),
                Flexible(
                  child: Text(
                    audience.labelKey.tr(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.outfitRegular13.copyWith(
                      color: AppColors.inkBody,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'details_guests_count'.tr(args: ['$count']),
              style: AppTextStyle.outfitSemiBold20.copyWith(
                color: AppColors.ink,
                letterSpacing: _countLetterSpacing,
              ),
            ),
            Text(
              audience.hintKey.tr(),
              style: AppTextStyle.outfitRegular12.copyWith(
                color: AppColors.inkLabel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
