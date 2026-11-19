import 'package:invit/features/payment/domain/model/recharge_plan.dart';

/// What the checkout web view needs: where to go, and the plan being paid
/// (for the "opening checkout" page it shows while loading).
class PaymentWebArgs {
  const PaymentWebArgs({required this.url, required this.plan});

  final String url;
  final RechargePlan plan;
}
