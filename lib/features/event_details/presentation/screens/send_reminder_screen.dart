import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event_details/domain/model/guest_report_model.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_actions_controller.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/event_details/presentation/controller/send_reminder_controller.dart';
import 'package:invit/features/event_details/presentation/utils/reminder_audience.dart';
import 'package:invit/features/event_details/presentation/widgets/send_reminder_screen/send_reminder_screen_audiences.dart';
import 'package:invit/features/event_details/presentation/widgets/send_reminder_screen/send_reminder_screen_cost.dart';
import 'package:invit/features/event_details/presentation/widgets/send_reminder_screen/send_reminder_screen_preview.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:invit/features/payment/presentation/utils/recharge_request.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_low_balance_sheet.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/app_screen_header.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';
import 'package:invit/src/core/utils/functions/async_action_listener.dart';
import 'package:invit/src/core/utils/functions/coming_soon.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Send a message again to the guests who have not replied, the confirmed
/// ones or the ones it was not delivered to, after checking it and its cost.
class SendReminderScreen extends ConsumerWidget {
  const SendReminderScreen({super.key, required this.args});

  final SendReminderScreenArgs args;

  static const EdgeInsets _padding = EdgeInsets.fromLTRB(16, 8, 16, 24);
  static const EdgeInsets _labelPadding = EdgeInsets.fromLTRB(8, 0, 8, 8);
  static const EdgeInsets _bottomPadding = EdgeInsets.fromLTRB(24, 8, 24, 0);
  static const EdgeInsets _bottomInset = EdgeInsets.only(bottom: 36);
  static const double _sectionGap = 20;
  static const double _blockGap = 16;

  Future<void> _send(
    BuildContext context,
    WidgetRef ref, {
    required int guests,
    required int cost,
    required int? balance,
  }) async {
    final outcome = await ref
        .read(
          sendReminderControllerProvider(
            args.occasionId,
            args.audience,
          ).notifier,
        )
        .send();
    if (!context.mounted) return;
    switch (outcome) {
      case SendReminderOutcome.needsTopUp:
        final audience = ref
            .read(
              sendReminderControllerProvider(args.occasionId, args.audience),
            )
            .audience;
        final recharge = await AppLowBalanceSheet.show(
          context,
          message: audience.lowBalanceKey.tr(
            args: ['$guests', '$cost', '${balance ?? 0}'],
          ),
          needed: cost,
          balance: balance ?? 0,
        );
        if (!recharge || !context.mounted) return;
        await context.push(
          AppRoutes.rechargeScreen,
          extra: RechargeRequest(
            needed: cost,
            eventId: args.occasionId,
            followUp: audience == ReminderAudience.notDelivered
                ? PaymentFollowUp.resendFailed
                : PaymentFollowUp.none,
          ),
        );
        if (!context.mounted) return;
        ref.read(homeControllerProvider.notifier).refresh();
      case SendReminderOutcome.unavailable:
        showComingSoon();
      case SendReminderOutcome.nothing || SendReminderOutcome.started:
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This screen owns the resend: it shows the loading dialog and the
    // result, then closes.
    ref.listen(
      eventDetailsActionsControllerProvider(
        args.occasionId,
      ).select((state) => state.resendFailed),
      (previous, next) => handleAsyncAction(
        context,
        previous,
        next,
        onSettled: (result) {
          if (result.hasError) {
            AppToast.errorToast(result.error.toString());
            return;
          }
          AppToast.doneToast('details_resend_done'.tr());
          if (context.canPop()) context.pop();
        },
      ),
    );

    final title = ref.watch(
      eventDetailsControllerProvider(
        ocassionId: args.occasionId,
      ).select((event) => event.value?.title),
    );
    final report = ref.watch(
      eventDetailsControllerProvider(
        ocassionId: args.occasionId,
      ).select((event) => event.value?.guestReport ?? const GuestReportModel()),
    );
    final audience = ref.watch(
      sendReminderControllerProvider(
        args.occasionId,
        args.audience,
      ).select((state) => state.audience),
    );
    final balance = ref.watch(
      homeControllerProvider.select(
        (home) => home.value?.remainingBalance?.toInt(),
      ),
    );
    final guests = audience.countIn(report);
    final cost = guests * CreateEventFlowConstants.messagesPerGuest;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        body: Column(
          children: [
            AppScreenHeader(title: 'reminder_title'.tr(), subtitle: title),
            Expanded(
              child: SingleChildScrollView(
                padding: _padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _SendReminderScreenLabel('reminder_who'.tr()),
                    SendReminderScreenAudiences(args: args),
                    const SizedBox(height: _sectionGap),
                    _SendReminderScreenLabel('reminder_what'.tr()),
                    SendReminderScreenPreview(args: args),
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
                  label: 'reminder_send'.tr(args: ['$guests']),
                  icon: Assets.icons.sendIc,
                  mirrorIconInRtl: false,
                  isEnabled: guests > 0,
                  onPressed: () => _send(
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

class _SendReminderScreenLabel extends StatelessWidget {
  const _SendReminderScreenLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SendReminderScreen._labelPadding,
      child: Text(
        text,
        style: AppTextStyle.outfitMedium13.copyWith(color: AppColors.inkLabel),
      ),
    );
  }
}
