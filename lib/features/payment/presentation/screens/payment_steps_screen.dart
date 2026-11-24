import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/payment/presentation/utils/payment_order.dart';
import 'package:invit/features/payment/presentation/widgets/payment_steps_screen/payment_steps_screen_security_note.dart';
import 'package:invit/features/payment/presentation/widgets/payment_steps_screen/payment_steps_screen_steps.dart';
import 'package:invit/features/payment/presentation/widgets/payment_steps_screen/payment_steps_screen_summary.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/app_screen_header.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// Order summary and how the payment will go, before leaving for the secure
/// checkout. Static: it only shows the chosen [order].
class PaymentStepsScreen extends StatelessWidget {
  const PaymentStepsScreen({super.key, required this.order});

  final PaymentOrder order;

  static const EdgeInsets _contentPadding = EdgeInsets.fromLTRB(20, 14, 20, 24);
  static const EdgeInsets _buttonPadding = EdgeInsets.fromLTRB(24, 0, 24, 36);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: Column(
        children: [
          AppScreenHeader(
            title: 'checkout_title'.tr(),
            subtitle: 'checkout_subtitle'.tr(),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: _contentPadding,
              child: Column(
                spacing: 32,
                children: [
                  PaymentStepsScreenSummary(plan: order.plan),
                  const PaymentStepsScreenSteps(),
                  const PaymentStepsScreenSecurityNote(),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: _buttonPadding,
              child: AppPrimaryButton(
                label: 'checkout_continue'.tr(),
                icon: Assets.icons.externalLinkIc,
                mirrorIconInRtl: false,
                onPressed: () => context.push(
                  AppRoutes.checkoutRedirectScreen,
                  extra: order,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
