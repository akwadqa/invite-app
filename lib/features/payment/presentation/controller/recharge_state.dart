import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invit/features/payment/domain/model/recharge_plan.dart';

part 'recharge_state.freezed.dart';

@freezed
abstract class RechargeState with _$RechargeState {
  const factory RechargeState({
    @Default(<RechargePlan>[]) List<RechargePlan> plans,
    @Default(0) int balance,

    /// Messages the user's action needs; `0` when opened from the balance.
    @Default(0) int needed,
    String? selectedPlanId,
  }) = _RechargeState;
}

extension RechargeStateX on RechargeState {
  bool get hasNeed => needed > 0;

  /// Whether the balance plus this plan reaches [needed].
  bool covers(RechargePlan plan) => balance + plan.messages >= needed;

  /// Messages left after buying [plan] and spending [needed].
  int leftAfter(RechargePlan plan) => balance + plan.messages - needed;

  /// The smallest plan that covers the need.
  RechargePlan? get recommended {
    if (!hasNeed) return null;
    final covering = plans.where(covers).toList()
      ..sort((a, b) => a.messages.compareTo(b.messages));
    return covering.firstOrNull;
  }

  RechargePlan? get selected =>
      plans.where((plan) => plan.id == selectedPlanId).firstOrNull;
}
