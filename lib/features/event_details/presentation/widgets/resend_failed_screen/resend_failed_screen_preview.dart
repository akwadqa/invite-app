import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/presentation/widgets/create_event_preview_screen/create_event_preview_screen_bubble.dart';
import 'package:invit/features/event/presentation/widgets/create_event_preview_screen/create_event_preview_screen_message.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/home/presentation/utils/home_event_format.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// The invitation the guests will get again.
class ResendFailedScreenPreview extends ConsumerWidget {
  const ResendFailedScreenPreview({super.key, required this.occasionId});

  final String occasionId;

  static const double _radius = 22;
  static const EdgeInsets _padding = EdgeInsets.all(14);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref
        .watch(eventDetailsControllerProvider(ocassionId: occasionId))
        .value;
    final locale = context.locale.toString();
    final date = event == null ? null : HomeEventFormat.dateOf(event);
    final venue = event?.locationName?.trim() ?? '';
    final names = {
      'event': event?.title?.trim() ?? '',
      'when': date == null
          ? ''
          : 'reminder_when'.tr(
              namedArgs: {
                'day': DateFormat('EEEE, d MMMM', locale).format(date),
                'time': DateFormat.jm(locale).format(date),
              },
            ),
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
            message: CreateEventPreviewMessage(
              title: 'reminder_msg_failed_title'.tr(namedArgs: names),
              message: 'reminder_msg_failed_body'.tr(namedArgs: names),
              footer: 'create_preview_kindly_reply'.tr(),
              buttons: [
                'reminder_btn_confirm'.tr(),
                'reminder_btn_decline'.tr(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
