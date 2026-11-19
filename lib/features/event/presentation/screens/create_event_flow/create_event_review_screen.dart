import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_layout.dart';
import 'package:invit/features/event/presentation/widgets/create_event_review_screen/create_event_review_screen_balance.dart';
import 'package:invit/features/event/presentation/widgets/create_event_review_screen/create_event_review_screen_sections.dart';
import 'package:invit/features/event/presentation/widgets/create_event_review_screen/create_event_review_screen_summary.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';
import 'package:invit/src/core/utils/functions/async_action_listener.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Step 6: last look, then create the event and send the invitations.
class CreateEventReviewScreen extends ConsumerWidget {
  const CreateEventReviewScreen({super.key});

  static const EdgeInsets _padding = EdgeInsets.fromLTRB(20, 12, 20, 24);

  /// Opens a step to change it; its "Done" (or back) returns here.
  Future<void> _edit(BuildContext context, WidgetRef ref, String route) async {
    final notifier = ref.read(createEventFlowControllerProvider.notifier);
    notifier.setEditingFromReview(true);
    await context.push(route);
    if (!context.mounted) return;
    notifier.setEditingFromReview(false);
  }

  Future<void> _topUp(
    BuildContext context,
    WidgetRef ref,
    int messagesNeeded,
  ) async {
    await context.push(AppRoutes.rechargeScreen, extra: messagesNeeded);
    if (!context.mounted) return;
    ref.read(homeControllerProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      createEventFlowControllerProvider.select((state) => state.submit),
      (previous, next) => handleAsyncAction(
        context,
        previous,
        next,
        onSettled: (result) {
          if (result.hasError) {
            AppToast.errorToast(result.error.toString());
            return;
          }
          final submitted = result.value;
          if (submitted == null) return;
          AppToast.doneToast(
            submitted.isSent
                ? 'create_review_sent'.tr()
                : 'create_review_saved'.tr(),
          );
          context.go(AppRoutes.eventDetails, extra: submitted.eventId);
        },
      ),
    );

    final messagesNeeded = ref.watch(
      createEventFlowControllerProvider.select((state) => state.messagesNeeded),
    );
    final balance = ref.watch(
      homeControllerProvider.select((home) => home.value?.remainingBalance),
    );
    final canSend = balance == null || balance >= messagesNeeded;
    final notifier = ref.read(createEventFlowControllerProvider.notifier);

    return CreateEventFlowLayout(
      title: 'create_review_title'.tr(),
      subtitle: 'create_review_subtitle'.tr(),
      step: CreateEventFlowConstants.reviewStep,
      body: SingleChildScrollView(
        padding: _padding,
        child: Column(
          spacing: 12,
          children: [
            CreateEventReviewScreenSummary(
              onEdit: () =>
                  _edit(context, ref, AppRoutes.createEventDetailsScreen),
            ),
            CreateEventReviewScreenSections(
              onMessage: () =>
                  _edit(context, ref, AppRoutes.createEventPreviewScreen),
              onGuests: () =>
                  _edit(context, ref, AppRoutes.createEventGuestsScreen),
              onImage: () =>
                  _edit(context, ref, AppRoutes.createEventImageScreen),
            ),
            CreateEventReviewScreenBalance(
              messagesNeeded: messagesNeeded,
              balance: balance,
            ),
          ],
        ),
      ),
      bottom: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          TextButton(
            onPressed: () => notifier.submit(send: false),
            child: Text(
              'create_review_save_draft'.tr(),
              style: AppTextStyle.outfitMedium14.copyWith(
                color: AppColors.inkLabel,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.inkLabel,
              ),
            ),
          ),
          AppPrimaryButton(
            label: canSend
                ? 'create_review_send'.tr()
                : 'create_review_top_up_send'.tr(),
            icon: Assets.icons.sendIc,
            onPressed: () => canSend
                ? notifier.submit(send: true)
                : _topUp(context, ref, messagesNeeded),
          ),
        ],
      ),
    );
  }
}
