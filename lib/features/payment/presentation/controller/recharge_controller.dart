import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/home/domain/model/home/home_model.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:invit/features/payment/domain/model/recharge_plan.dart';
import 'package:invit/features/payment/presentation/controller/recharge_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recharge_controller.g.dart';

/// The "Choose a plan" screen: the plans (home bundles), which of them cover
/// [needed] messages and the one picked.
///
/// Selecting is synchronous, so no request counter is needed; the payment
/// request belongs to the screens that follow this one.
@riverpod
class RechargeController extends _$RechargeController {
  RechargeState get _current => state.requireValue;
  void _emit(RechargeState newState) => state = AsyncData(newState);

  @override
  FutureOr<RechargeState> build(int needed) {
    ref.listen(homeControllerProvider.select((home) => home.value), (_, home) {
      final updated = _current.copyWith(
        plans: _plansOf(home),
        balance: home?.remainingBalance?.toInt() ?? 0,
      );
      final stillValid = updated.selected != null;
      _emit(
        updated.copyWith(
          selectedPlanId: stillValid
              ? updated.selectedPlanId
              : updated.recommended?.id,
        ),
      );
    });
    final home = ref.read(homeControllerProvider).value;
    final initial = RechargeState(
      plans: _plansOf(home),
      balance: home?.remainingBalance?.toInt() ?? 0,
      needed: needed,
    );
    return initial.copyWith(selectedPlanId: initial.recommended?.id);
  }

  /// Picks [planId] unless it does not exist or cannot cover the need.
  void select(String planId) {
    final plan = _current.plans.where((p) => p.id == planId).firstOrNull;
    if (plan == null || !_current.covers(plan)) return;
    _emit(_current.copyWith(selectedPlanId: plan.id));
  }

  static List<RechargePlan> _plansOf(HomeModel? home) {
    final bundles = home?.bundles ?? const <BundleModel>[];
    return [
      for (final bundle in bundles)
        if (bundle.bundleName != null && bundle.amount != null)
          RechargePlan(
            id: bundle.bundleName ?? '',
            name: bundle.bundleName ?? '',
            messages: bundle.amount?.toInt() ?? 0,
            price: bundle.price ?? 0,
          ),
    ];
  }
}
