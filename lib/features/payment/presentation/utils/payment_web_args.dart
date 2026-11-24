import 'package:invit/features/payment/presentation/utils/payment_order.dart';

/// What the checkout web view needs: where to go, and the order being paid
/// (for the "opening checkout" page it shows while loading).
class PaymentWebArgs {
  const PaymentWebArgs({required this.url, required this.order});

  final String url;
  final PaymentOrder order;
}
