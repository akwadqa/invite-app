import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';

/// Date texts shown on the home and event screens.
abstract class HomeEventFormat {
  static DateTime? dateOf(EventModel event) =>
      DateTime.tryParse(event.dateTime ?? '');

  /// "Thu, 12 Nov · 8:00 PM · Katara Hall" (missing parts are skipped).
  static String whenAndWhere(BuildContext context, EventModel event) {
    final date = dateOf(event);
    final locale = context.locale.toString();
    return [
      if (date != null) DateFormat('EEE, d MMM', locale).format(date),
      if (date != null) DateFormat.jm(locale).format(date),
      if (event.locationName?.trim().isNotEmpty ?? false)
        event.locationName!.trim(),
    ].join(' · ');
  }

  /// "Sat, 14 Mar 2026".
  static String? fullDate(BuildContext context, EventModel event) {
    final date = dateOf(event);
    if (date == null) return null;
    return DateFormat(
      'EEE, d MMM yyyy',
      context.locale.toString(),
    ).format(date);
  }

  /// "Today", "Tomorrow" or "In 9 days"; `null` when the date is unknown.
  static String? countdown(EventModel event) {
    final date = dateOf(event);
    if (date == null) return null;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final day = DateTime(date.year, date.month, date.day);
    final days = day.difference(today).inDays;
    if (days <= 0) return 'home_today'.tr();
    if (days == 1) return 'home_tomorrow'.tr();
    return 'home_in_days'.tr(args: ['$days']);
  }
}
