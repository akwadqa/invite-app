import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_state.freezed.dart';

@freezed
abstract class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    /// The secure checkout address; idle (`AsyncData(null)`) before opening.
    @Default(AsyncData(null)) AsyncValue<String?> paymentUrl,
  }) = _CheckoutState;
}
