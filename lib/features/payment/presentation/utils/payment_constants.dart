abstract class PaymentConstants {
  /// The payment provider, shown to the user. The API does not return it.
  static const String providerName = 'Sadad';

  /// The language sent to the payment-link endpoint (the app has always sent
  /// English here).
  static const String paymentLanguage = 'en';

  /// Screens between the screen that opened the recharge flow and the result
  /// screen (recharge, order summary, result): popping this many returns to
  /// where the user started.
  static const int pagesAboveOrigin = 3;

  /// How long the "opening checkout" screen stays up, so the user sees the
  /// payment is about to happen even when the link arrives sooner.
  static const Duration redirectDuration = Duration(seconds: 3);
}
