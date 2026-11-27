import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event_details/domain/exceptions/not_enough_messages_exception.dart';
import 'package:invit/features/event_details/domain/model/guest_report_model.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_actions_controller.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/event_details/presentation/controller/resend_failed_controller.dart';
import 'package:invit/features/event_details/presentation/widgets/resend_failed_screen/resend_failed_screen_preview.dart';
import 'package:invit/features/event_details/presentation/widgets/send_reminder_screen/send_reminder_screen_cost.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:invit/features/payment/presentation/utils/offer_recharge.dart';
import 'package:invit/features/payment/presentation/utils/recharge_request.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/app_screen_header.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';
import 'package:invit/src/core/utils/functions/async_action_listener.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Send the invitation again to the guests it was not delivered to, after
/// checking the message and its cost.
class ResendFailedScreen extends ConsumerWidget {
  const ResendFailedScreen({super.key, required this.occasionId});

  final String occasionId;

  static const EdgeInsets _padding = EdgeInsets.fromLTRB(16, 8, 16, 24);
  static const EdgeInsets _labelPadding = EdgeInsets.fromLTRB(8, 0, 8, 8);
  static const EdgeInsets _bottomPadding = EdgeInsets.fromLTRB(24, 8, 24, 0);
  static const EdgeInsets _bottomInset = EdgeInsets.only(bottom: 36);
  static const double _blockGap = 16;

  Future<void> _resend(
    BuildContext context,
    WidgetRef ref, {
    required int guests,
    required int cost,
    required int? balance,
  }) async {
    final outcome = await ref
        .read(resendFailedControllerProvider(occasionId).notifier)
        .resend();
    if (!context.mounted || outcome != ResendFailedOutcome.needsTopUp) return;
    await _offerRecharge(
      context,
      ref,
      guests: guests,
      needed: cost,
      balance: balance ?? 0,
    );
  }

  Future<void> _offerRecharge(
    BuildContext context,
    WidgetRef ref, {
    required int guests,
    required int needed,
    required int balance,
  }) => offerRecharge(
    context,
    ref,
    message: 'low_balance_failed'.tr(args: ['$guests', '$needed', '$balance']),
    balance: balance,
    request: RechargeRequest(
      needed: needed,
      eventId: occasionId,
      followUp: PaymentFollowUp.resendFailed,
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This screen owns the resend: it shows the loading dialog and the
    // result, then closes.
    ref.listen(
      eventDetailsActionsControllerProvider(
        occasionId,
      ).select((state) => state.resendFailed),
      (previous, next) => handleAsyncAction(
        context,
        previous,
        next,
        onSettled: (result) {
          final error = result.error;
          if (error is NotEnoughMessagesException) {
            final needed = error.details.needed ?? 0;
            _offerRecharge(
              context,
              ref,
              guests:
                  ref
                      .read(
                        eventDetailsControllerProvider(ocassionId: occasionId),
                      )
                      .value
                      ?.guestReport
                      ?.failed ??
                  0,
              needed: needed,
              balance: error.details.available ?? 0,
            );
            return;
          }
          if (result.hasError) {
            AppToast.errorToast(error.toString());
            return;
          }
          AppToast.doneToast('details_resend_done'.tr());
          if (context.canPop()) context.pop();
        },
      ),
    );

    final title = ref.watch(
      eventDetailsControllerProvider(
        ocassionId: occasionId,
      ).select((event) => event.value?.title),
    );
    final guests = ref.watch(
      eventDetailsControllerProvider(ocassionId: occasionId).select(
        (event) =>
            (event.value?.guestReport ?? const GuestReportModel()).failed,
      ),
    );
    final balance = ref.watch(
      homeControllerProvider.select(
        (home) => home.value?.remainingBalance?.toInt(),
      ),
    );
    final cost = guests * CreateEventFlowConstants.messagesPerGuest;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        body: Column(
          children: [
            AppScreenHeader(title: 'resend_title'.tr(), subtitle: title),
            Expanded(
              child: SingleChildScrollView(
                padding: _padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: _labelPadding,
                      child: Text(
                        'reminder_what'.tr(),
                        style: AppTextStyle.outfitMedium13.copyWith(
                          color: AppColors.inkLabel,
                        ),
                      ),
                    ),
                    ResendFailedScreenPreview(occasionId: occasionId),
                    const SizedBox(height: _blockGap),
                    SendReminderScreenCost(cost: cost, balance: balance),
                  ],
                ),
              ),
            ),
            SafeArea(
              top: false,
              minimum: _bottomInset,
              child: Padding(
                padding: _bottomPadding,
                child: AppPrimaryButton(
                  label: 'resend_send'.tr(args: ['$guests']),
                  icon: Assets.icons.sendIc,
                  mirrorIconInRtl: false,
                  isEnabled: guests > 0,
                  onPressed: () => _resend(
                    context,
                    ref,
                    guests: guests,
                    cost: cost,
                    balance: balance,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
