import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invit/features/payment/domain/model/balance/balance_model.dart';

part 'balance_state.freezed.dart';

@freezed
abstract class BalanceState with _$BalanceState {
  const factory BalanceState({
    /// `null` while the balance is unknown.
    int? balance,

    /// Guests the user still has to remind, for the "not enough" warning.
    @Default(0) int guestsToRemind,
    @Default(AsyncLoading()) AsyncValue<List<BalanceHistoryModel>> history,
  }) = _BalanceState;
}
