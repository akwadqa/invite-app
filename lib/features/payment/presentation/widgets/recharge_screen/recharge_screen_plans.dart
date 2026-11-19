import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/payment/domain/model/recharge_plan.dart';
import 'package:invit/features/payment/presentation/controller/recharge_controller.dart';
import 'package:invit/features/payment/presentation/controller/recharge_state.dart';
import 'package:invit/features/payment/presentation/utils/recharge_format.dart';
import 'package:invit/features/payment/presentation/widgets/recharge_screen/recharge_screen_plan_card.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// The plan cards: which are disabled, recommended or just roomy.
class RechargeScreenPlans extends ConsumerWidget {
  const RechargeScreenPlans({super.key, required this.needed});

  final int needed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      rechargeControllerProvider(needed).select((value) => value.value),
    );
    if (state == null) return const SizedBox.shrink();
    final notifier = ref.read(rechargeControllerProvider(needed).notifier);
    final recommended = state.recommended;

    return Semantics(
      container: true,
      child: Column(
        spacing: 10,
        children: [
          for (final plan in state.plans)
            _card(
              state: state,
              plan: plan,
              isRecommended: plan.id == recommended?.id,
              onTap: () => notifier.select(plan.id),
            ),
        ],
      ),
    );
  }

  Widget _card({
    required RechargeState state,
    required RechargePlan plan,
    required bool isRecommended,
    required VoidCallback onTap,
  }) {
    final covers = !state.hasNeed || state.covers(plan);
    final String? tag;
    final Color tagBackground;
    final Color tagColor;
    if (!state.hasNeed) {
      tag = null;
      tagBackground = AppColors.mistSoft;
      tagColor = AppColors.inkBody;
    } else if (!covers) {
      tag = 'recharge_not_enough'.tr(
        args: [RechargeFormat.thousands(state.needed)],
      );
      tagBackground = AppColors.mistSoft;
      tagColor = AppColors.inkLabel;
    } else if (isRecommended) {
      tag = 'recharge_covers'.tr(
        args: [RechargeFormat.thousands(state.leftAfter(plan))],
      );
      tagBackground = AppColors.accentLight;
      tagColor = AppColors.accentInk;
    } else {
      tag = 'recharge_left_later'.tr(
        args: [RechargeFormat.thousands(state.leftAfter(plan))],
      );
      tagBackground = AppColors.mistSoft;
      tagColor = AppColors.inkBody;
    }
    return RechargeScreenPlanCard(
      name: plan.name,
      messages: 'details_messages'.tr(
        args: [RechargeFormat.thousands(plan.messages)],
      ),
      price: '${RechargeFormat.thousands(plan.price)} ${'qar'.tr()}',
      isSelected: plan.id == state.selectedPlanId,
      isEnabled: covers,
      tag: tag,
      tagBackground: tagBackground,
      tagColor: tagColor,
      onTap: onTap,
    );
  }
}
