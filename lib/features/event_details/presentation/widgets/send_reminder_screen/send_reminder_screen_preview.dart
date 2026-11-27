import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/presentation/widgets/create_event_preview_screen/create_event_preview_screen_bubble.dart';
import 'package:invit/features/event/presentation/widgets/create_event_preview_screen/create_event_preview_screen_message.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/event_details/presentation/controller/send_reminder_controller.dart';
import 'package:invit/features/event_details/presentation/utils/reminder_audience.dart';
import 'package:invit/features/home/domain/model/reminder_templates/reminder_templates_model.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:invit/features/home/presentation/utils/home_event_format.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// The WhatsApp message the selected guests will get.
class SendReminderScreenPreview extends ConsumerWidget {
  const SendReminderScreenPreview({super.key, required this.args});

  final SendReminderScreenArgs args;

  static const double _radius = 22;
  static const EdgeInsets _padding = EdgeInsets.all(14);

  /// "Thursday, 12 November at 8:00 PM".
  static String _when(BuildContext context, DateTime date) {
    final locale = context.locale.toString();
    return 'reminder_when'.tr(
      namedArgs: {
        'day': DateFormat('EEEE, d MMMM', locale).format(date),
        'time': DateFormat.jm(locale).format(date),
      },
    );
  }

  /// The message exactly as the backend template defines it.
  static CreateEventPreviewMessage _fromTemplate(
    ReminderTemplateModel template,
  ) {
    return CreateEventPreviewMessage(
      title: template.header,
      message: template.message,
      imagePath: template.image,
      footer: template.footer,
      buttons: [
        for (final button
            in template.buttons ?? const <ReminderTemplateButton>[])
          if (button.label?.isNotEmpty ?? false) button.label!,
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audience = ref.watch(
      sendReminderControllerProvider(
        args.occasionId,
        args.audience,
      ).select((state) => state.audience),
    );
    final template = ref.watch(
      homeControllerProvider.select(
        (home) => switch (audience) {
          ReminderAudience.noReply => home.value?.reminderTemplates?.noReply,
          ReminderAudience.confirmed =>
            home.value?.reminderTemplates?.confirmed,
        },
      ),
    );
    final event = ref
        .watch(eventDetailsControllerProvider(ocassionId: args.occasionId))
        .value;
    final date = event == null ? null : HomeEventFormat.dateOf(event);
    final venue = event?.locationName?.trim() ?? '';
    final names = {
      'event': event?.title?.trim() ?? '',
      'when': date == null ? '' : _when(context, date),
      'time': date == null
          ? ''
          : DateFormat.jm(context.locale.toString()).format(date),
      'where': venue.isEmpty ? '' : ', $venue',
    };

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.whatsappChat,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Padding(
        padding: _padding,
        child: Align(
          alignment: Alignment.topLeft,
          child: CreateEventPreviewScreenIncomingBubble(
            message: template?.available == true
                ? _fromTemplate(template!)
                : CreateEventPreviewMessage(
                    title: audience.titleKey.tr(namedArgs: names),
                    message: audience.bodyKey.tr(namedArgs: names),
                    footer: 'create_preview_kindly_reply'.tr(),
                    buttons: [for (final key in audience.buttonKeys) key.tr()],
                  ),
          ),
        ),
      ),
    );
  }
}
