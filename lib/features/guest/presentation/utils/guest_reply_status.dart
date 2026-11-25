import 'package:flutter/painting.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// A guest's reply, grouped from the backend `rsvp_status` values.
enum GuestReplyStatus {
  confirmed(
    'details_confirmed',
    {'Confirmed'},
    background: AppColors.mist,
    foreground: AppColors.primary,
    dot: AppColors.primary,
  ),
  noReply(
    'details_no_reply',
    {'Pending', 'Not Sent'},
    background: AppColors.accentLight,
    foreground: AppColors.accentInk,
    dot: AppColors.accent,
  ),
  declined(
    'details_declined',
    {'Declined'},
    background: AppColors.declinedSurface,
    foreground: AppColors.declinedInk,
    dot: AppColors.inkFaint,
  ),
  notDelivered(
    'details_not_delivered',
    {'Failed'},
    background: AppColors.dangerLight,
    foreground: AppColors.dangerInk,
    dot: AppColors.danger,
  );

  const GuestReplyStatus(
    this.titleKey,
    this.apiValues, {
    required this.background,
    required this.foreground,
    required this.dot,
  });

  final String titleKey;
  final Set<String> apiValues;
  final Color background;
  final Color foreground;
  final Color dot;

  /// Unknown or missing statuses count as "no reply" (the old screen did the
  /// same with `null`).
  static GuestReplyStatus of(GuestModel guest) {
    final status = guest.rsvpStatus;
    return values
            .where((reply) => reply.apiValues.contains(status))
            .firstOrNull ??
        noReply;
  }
}
