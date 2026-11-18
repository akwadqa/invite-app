import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/domain/model/template%20model/template_model.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_layout.dart';
import 'package:invit/features/event/presentation/widgets/create_event_preview_screen/create_event_preview_screen_controls.dart';
import 'package:invit/features/event/presentation/widgets/create_event_preview_screen/create_event_preview_screen_message.dart';
import 'package:invit/features/event/presentation/widgets/create_event_preview_screen/create_event_preview_screen_whatsapp.dart';
import 'package:invit/src/core/shared_widgets/app_empty_data_widget.dart';
import 'package:invit/src/core/shared_widgets/app_error_widget.dart';
import 'package:invit/src/core/shared_widgets/app_screen_header.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Step 2: the WhatsApp message guests will receive, per reply.
class CreateEventPreviewScreen extends ConsumerWidget {
  const CreateEventPreviewScreen({super.key});

  static const double _headerGap = 6;
  static const EdgeInsets _framePadding = EdgeInsets.symmetric(horizontal: 10);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templates = ref.watch(
      createEventFlowControllerProvider.select((state) => state.templates),
    );
    final hasTemplate = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.selectedTemplate != null,
      ),
    );
    final hasSwitcher = (templates.value?.length ?? 0) > 1;
    final showControls =
        templates.isLoading || (templates.value?.isNotEmpty ?? false);
    final controlsHeight = CreateEventPreviewScreenControls.heightFor(
      context,
      hasSwitcher: hasSwitcher,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        body: Stack(
          children: [
            Column(
              children: [
                AppScreenHeader(
                  title: 'create_preview_title'.tr(),
                  subtitle: 'create_preview_subtitle'.tr(),
                  trailing: const CreateEventFlowStepChip(
                    step: CreateEventFlowConstants.previewStep,
                  ),
                ),
                const SizedBox(height: _headerGap),
                Expanded(
                  child: Padding(
                    padding: _framePadding,
                    child: templates.when(
                      data: (data) => data.isEmpty
                          ? AppEmptyDataWidget(text: 'create_preview_empty')
                          : _CreateEventPreviewScreenChat(
                              bottomInset: controlsHeight,
                            ),
                      error: (error, _) => AppErrorWidget(
                        errorMsg: error.toString(),
                        onTap: () => ref
                            .read(createEventFlowControllerProvider.notifier)
                            .retryTemplates(),
                      ),
                      loading: () => Skeletonizer(
                        child: CreateEventPreviewScreenWhatsapp(
                          chat: _placeholderChat,
                          bottomInset: controlsHeight,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (showControls)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: CreateEventPreviewScreenControls(
                  isEnabled: hasTemplate,
                  hasSwitcher: hasSwitcher,
                ),
              ),
          ],
        ),
      ),
    );
  }

  static const CreateEventPreviewChat _placeholderChat = CreateEventPreviewChat(
    incoming: CreateEventPreviewMessage(
      title: 'Invitation title',
      message: 'You are warmly invited to celebrate with us on the day.',
      buttons: ['Confirm', 'Decline', 'Location'],
    ),
  );
}

class _CreateEventPreviewScreenChat extends ConsumerWidget {
  const _CreateEventPreviewScreenChat({required this.bottomInset});

  final double bottomInset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final template = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.selectedTemplate,
      ),
    );
    final tab = ref.watch(
      createEventFlowControllerProvider.select((state) => state.previewTab),
    );
    final image = ref.watch(
      createEventFlowControllerProvider.select((state) => state.image),
    );
    return CreateEventPreviewScreenWhatsapp(
      chat: _chatFor(template, tab, image),
      bottomInset: bottomInset,
    );
  }

  /// The invitation shows the template with its reply buttons; the other tabs
  /// show the guest's reply (the matching button) and the message linked to it.
  CreateEventPreviewChat? _chatFor(
    TemplateModel? template,
    TemplatePreviewTab tab,
    File? image,
  ) {
    if (template == null) return null;
    final label = tab.buttonLabel;
    if (label == null) {
      return CreateEventPreviewChat(
        incoming: CreateEventPreviewMessage(
          title: template.templateName,
          message: template.message,
          imagePath: template.image,
          imageFile: image,
          buttons: (template.buttons ?? const [])
              .map((button) => button.buttonLabel)
              .nonNulls
              .toList(),
          // TODO(backend): templates have no footer field; this is the
          // design's fixed footer line.
          footer: 'create_preview_kindly_reply'.tr(),
        ),
      );
    }
    final button = template.buttons
        ?.where((button) => button.buttonLabel?.toLowerCase() == label)
        .firstOrNull;
    final linked = button?.linkedTemplate;
    return CreateEventPreviewChat(
      replyLabel: button?.buttonLabel,
      quotedTitle: template.name,
      incoming: CreateEventPreviewMessage(
        title: linked?.name,
        message: linked?.message,
        imagePath: linked?.image,
      ),
    );
  }
}
