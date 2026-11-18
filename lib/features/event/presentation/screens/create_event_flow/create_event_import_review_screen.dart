import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/utils/guest_list_import.dart';
import 'package:invit/features/event/presentation/utils/guest_list_import_listener.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_layout.dart';
import 'package:invit/features/event/presentation/widgets/create_event_import_review_screen/create_event_import_review_screen_file_card.dart';
import 'package:invit/features/event/presentation/widgets/create_event_import_review_screen/create_event_import_review_screen_list.dart';
import 'package:invit/features/event/presentation/widgets/create_event_import_review_screen/create_event_import_review_screen_stats.dart';
import 'package:invit/features/event/presentation/widgets/create_event_import_review_screen/create_event_import_review_screen_tabs.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';
import 'package:invit/src/core/utils/functions/async_action_listener.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Step 4 (upload): review the rows read from an Excel/CSV file, fix the
/// ones with problems, then add the ready ones as guests.
class CreateEventImportReviewScreen extends ConsumerWidget {
  const CreateEventImportReviewScreen({super.key});

  static const EdgeInsets _padding = EdgeInsets.fromLTRB(20, 8, 20, 0);
  static const double _gap = 12;
  static const double _templateGap = 16;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // "Replace" reads another file into the same screen.
    listenGuestListImport(
      context,
      ref,
      origin: GuestListImportOrigin.review,
      onImported: () {},
    );
    ref.listen(
      createEventFlowControllerProvider.select(
        (state) => state.guestListTemplate,
      ),
      (previous, next) => handleAsyncAction(
        context,
        previous,
        next,
        onSettled: (result) {
          if (result.hasError) {
            AppToast.errorToast(result.error.toString());
            return;
          }
          if (result.value ?? false) {
            AppToast.doneToast('import_template_saved'.tr());
          }
        },
      ),
    );

    final readyCount = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.guestImport?.readyCount ?? 0,
      ),
    );
    final notifier = ref.read(createEventFlowControllerProvider.notifier);

    return CreateEventFlowLayout(
      title: 'import_title'.tr(),
      subtitle: 'import_subtitle'.tr(),
      step: CreateEventFlowConstants.guestsStep,
      body: const Padding(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: _gap,
          children: [
            CreateEventImportReviewScreenFileCard(),
            CreateEventImportReviewScreenStats(),
            CreateEventImportReviewScreenTabs(),
            Expanded(child: CreateEventImportReviewScreenList()),
          ],
        ),
      ),
      bottom: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: _templateGap,
        children: [
          Center(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: notifier.downloadGuestListTemplate,
              child: Text(
                'import_download_template'.tr(),
                style: AppTextStyle.outfitMedium14.copyWith(
                  color: AppColors.ink,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          AppPrimaryButton(
            label: 'import_add_guests'.tr(args: ['$readyCount']),
            isEnabled: readyCount > 0,
            onPressed: () {
              final added = notifier.addImportedGuests();
              if (context.canPop()) context.pop();
              AppToast.doneToast('import_added'.tr(args: ['$added']));
            },
          ),
        ],
      ),
    );
  }
}
