import 'package:invit/features/payment/domain/model/recharge_plan.dart';
import 'package:invit/features/payment/presentation/utils/recharge_request.dart';

/// The plan the user chose and the reason they are paying, carried through
/// the payment screens up to the result.
class PaymentOrder {
  const PaymentOrder({required this.plan, required this.request});

  final RechargePlan plan;
  final RechargeRequest request;

  @override
  bool operator ==(Object other) =>
      other is PaymentOrder &&
      other.plan.id == plan.id &&
      other.request == request;

  @override
  int get hashCode => Object.hash(plan.id, request);
}
