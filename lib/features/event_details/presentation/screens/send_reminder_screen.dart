import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event_details/domain/exceptions/not_enough_messages_exception.dart';
import 'package:invit/features/event_details/domain/model/guest_report_model.dart';
import 'package:invit/features/event_details/domain/model/send_reminder_result_model.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/event_details/presentation/controller/send_reminder_controller.dart';
import 'package:invit/features/event_details/presentation/utils/reminder_audience.dart';
import 'package:invit/features/event_details/presentation/widgets/send_reminder_screen/send_reminder_screen_audiences.dart';
import 'package:invit/features/event_details/presentation/widgets/send_reminder_screen/send_reminder_screen_cost.dart';
import 'package:invit/features/event_details/presentation/widgets/send_reminder_screen/send_reminder_screen_preview.dart';
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

/// Remind the guests who have not replied or the confirmed ones, after
/// checking the message and its cost.
class SendReminderScreen extends ConsumerWidget {
  const SendReminderScreen({super.key, required this.args});

  final SendReminderScreenArgs args;

  static const EdgeInsets _padding = EdgeInsets.fromLTRB(16, 8, 16, 24);
  static const EdgeInsets _labelPadding = EdgeInsets.fromLTRB(8, 0, 8, 8);
  static const EdgeInsets _bottomPadding = EdgeInsets.fromLTRB(24, 8, 24, 0);
  static const EdgeInsets _bottomInset = EdgeInsets.only(bottom: 36);
  static const double _sectionGap = 20;
  static const double _blockGap = 16;

  SendReminderControllerProvider get _provider =>
      sendReminderControllerProvider(args.occasionId, args.audience);

  Future<void> _send(
    BuildContext context,
    WidgetRef ref, {
    required ReminderCost cost,
  }) async {
    final outcome = await ref.read(_provider.notifier).send();
    if (!context.mounted) return;
    switch (outcome) {
      case SendReminderOutcome.needsTopUp:
        await _offerRecharge(
          context,
          ref,
          guests: cost.guests,
          needed: cost.cost,
          balance: cost.balance ?? 0,
        );
      case SendReminderOutcome.nothing:
      case SendReminderOutcome.started:
        break;
    }
  }

  Future<void> _offerRecharge(
    BuildContext context,
    WidgetRef ref, {
    required int guests,
    required int needed,
    required int balance,
  }) async {
    final audience = ref.read(_provider).audience;
    await offerRecharge(
      context,
      ref,
      message: audience.lowBalanceKey.tr(
        args: ['$guests', '$needed', '$balance'],
      ),
      balance: balance,
      request: RechargeRequest(needed: needed, eventId: args.occasionId),
    );
  }

  void _onSent(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<SendReminderResultModel?> result,
  ) {
    final error = result.error;
    if (error is NotEnoughMessagesException) {
      final report =
          ref
              .read(eventDetailsControllerProvider(ocassionId: args.occasionId))
              .value
              ?.guestReport ??
          const GuestReportModel();
      final details = error.details;
      final needed = details.needed ?? 0;
      _offerRecharge(
        context,
        ref,
        guests: ref.read(_provider).audience.countIn(report),
        needed: needed,
        balance: details.available ?? needed - (details.missing ?? needed),
      );
      return;
    }
    if (result.hasError) {
      AppToast.errorToast(error.toString());
      return;
    }
    final reminded = result.value?.remindedCount;
    AppToast.doneToast(
      reminded == null
          ? 'reminder_done'.tr()
          : 'reminder_done_count'.tr(args: ['$reminded']),
    );
    if (context.canPop()) context.pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      _provider.select((state) => state.send),
      (previous, next) => handleAsyncAction(
        context,
        previous,
        next,
        onSettled: (result) => _onSent(context, ref, result),
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
    final homeBalance = ref.watch(
      homeControllerProvider.select(
        (home) => home.value?.remainingBalance?.toInt(),
      ),
    );
    final state = ref.watch(_provider);
    final cost = state.costOf(report, homeBalance: homeBalance);

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
                    SendReminderScreenCost(
                      cost: cost.cost,
                      balance: cost.balance,
                    ),
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
                  label: 'reminder_send'.tr(args: ['${cost.guests}']),
                  icon: Assets.icons.sendIc,
                  mirrorIconInRtl: false,
                  isEnabled: cost.guests > 0,
                  onPressed: () => _send(context, ref, cost: cost),
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
