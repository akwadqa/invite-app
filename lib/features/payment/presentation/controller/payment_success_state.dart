import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_success_state.freezed.dart';

@freezed
abstract class PaymentSuccessState with _$PaymentSuccessState {
  const factory PaymentSuccessState({
    @Default(0) int messagesAdded,
    @Default('') String planName,

    /// The failed invitations are being resent now that the balance covers
    /// them (shows the "Sending to N guests" step).
    @Default(false) bool isSending,
    @Default(0) int guests,

    /// What is left once the payment (and the resend, if any) is done;
    /// `null` when the current balance is unknown, which hides the card.
    int? balanceAfter,
    String? eventId,
  }) = _PaymentSuccessState;
}
