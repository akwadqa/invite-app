import 'package:flutter/painting.dart';
import 'package:invit/features/event_details/domain/model/guest_report_model.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// Who a message can be sent to again from the "Send a reminder" screen.
enum ReminderAudience {
  noReply(
    apiValue: 'no_reply',
    labelKey: 'reminder_aud_no_reply',
    hintKey: 'reminder_aud_no_reply_hint',
    dot: AppColors.accent,
    titleKey: 'reminder_msg_no_reply_title',
    bodyKey: 'reminder_msg_no_reply_body',
    buttonKeys: ['reminder_btn_confirm', 'reminder_btn_decline'],
    lowBalanceKey: 'low_balance_no_reply',
  ),
  confirmed(
    apiValue: 'confirmed',
    labelKey: 'reminder_aud_confirmed',
    hintKey: 'reminder_aud_confirmed_hint',
    dot: AppColors.primary,
    titleKey: 'reminder_msg_confirmed_title',
    bodyKey: 'reminder_msg_confirmed_body',
    buttonKeys: ['reminder_btn_location'],
    lowBalanceKey: 'low_balance_confirmed',
  );

  const ReminderAudience({
    required this.apiValue,
    required this.labelKey,
    required this.hintKey,
    required this.dot,
    required this.titleKey,
    required this.bodyKey,
    required this.buttonKeys,
    required this.lowBalanceKey,
  });

  /// The `audience` sent to `send_reminder`.
  final String apiValue;
  final String labelKey;
  final String hintKey;
  final Color dot;

  /// The message the guests get: bold first line, text and reply buttons.
  final String titleKey;
  final String bodyKey;
  final List<String> buttonKeys;

  /// "Reminding the {} guests … needs {} messages. You have {}."
  final String lowBalanceKey;

  /// How many guests of [report] belong to this audience.
  int countIn(GuestReportModel report) => switch (this) {
    ReminderAudience.noReply => report.pending + report.notSent,
    ReminderAudience.confirmed => report.confirmed,
  };
}

/// Route extra of the "Send a reminder" screen.
class SendReminderScreenArgs {
  const SendReminderScreenArgs({
    required this.occasionId,
    this.audience = ReminderAudience.noReply,
  });

  final String occasionId;

  /// The option selected when the screen opens.
  final ReminderAudience audience;

  /// Accepts these args or a bare occasion id.
  factory SendReminderScreenArgs.from(Object? extra) =>
      extra is SendReminderScreenArgs
      ? extra
      : SendReminderScreenArgs(occasionId: '$extra');
}
