import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/payment/presentation/controller/recharge_controller.dart';
import 'package:invit/features/payment/presentation/controller/recharge_state.dart';
import 'package:invit/features/payment/presentation/widgets/recharge_screen/recharge_screen_need_banner.dart';
import 'package:invit/features/payment/presentation/widgets/recharge_screen/recharge_screen_plans.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/app_screen_header.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "Choose a plan": the message plans, the ones that cover what the user
/// needs, and the button that continues to the payment steps.
class ChoosePlanScreen extends ConsumerWidget {
  /// [needed] is the messages the user's action requires (`0` when opened
  /// from the balance, which hides the need banner and the plan tags).
  const ChoosePlanScreen({super.key, this.needed = 0});

  final int needed;

  static const EdgeInsets _contentPadding = EdgeInsets.fromLTRB(20, 12, 20, 24);
  static const EdgeInsets _buttonPadding = EdgeInsets.fromLTRB(24, 0, 24, 36);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(
      rechargeControllerProvider(
        needed,
      ).select((value) => value.value?.selected),
    );
    final state = ref.watch(
      rechargeControllerProvider(needed).select(
        (value) => (
          balance: value.value?.balance ?? 0,
          hasNeed: value.value?.hasNeed ?? false,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: Column(
        children: [
          AppScreenHeader(
            title: 'recharge_title'.tr(),
            subtitle: 'recharge_subtitle'.tr(),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: _contentPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  if (state.hasNeed)
                    RechargeScreenNeedBanner(
                      needed: needed,
                      balance: state.balance,
                    ),
                  RechargeScreenPlans(needed: needed),
                  const SizedBox(height: 12),
                  Text(
                    'recharge_note'.tr(),
                    style: AppTextStyle.outfitRegular13.copyWith(
                      color: AppColors.inkLabel,
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: _buttonPadding,
              child: AppPrimaryButton(
                label: selected == null
                    ? 'recharge_choose'.tr()
                    : 'recharge_continue_with'.tr(args: [selected.name]),
                isEnabled: selected != null,
                onPressed: () =>
                    context.push(AppRoutes.paymentStepsScreen, extra: selected),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
