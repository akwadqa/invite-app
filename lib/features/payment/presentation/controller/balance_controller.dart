import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:invit/features/payment/domain/model/balance_entry.dart';
import 'package:invit/features/payment/presentation/controller/balance_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'balance_controller.g.dart';

/// The balance screen: messages left (shared with the home feed), the
/// "not enough" warning and the usage / purchase history.
@riverpod
class BalanceController extends _$BalanceController {
  int _latestRefreshRequest = 0;
  int _latestHistoryRequest = 0;

  BalanceState get _current => state.requireValue;
  void _emit(BalanceState newState) => state = AsyncData(newState);

  @override
  FutureOr<BalanceState> build() {
    ref.listen(
      homeControllerProvider.select((home) => home.value?.remainingBalance),
      (_, balance) => _emit(_current.copyWith(balance: balance?.toInt())),
    );
    unawaited(_loadHistory());
    return BalanceState(
      balance: ref
          .read(homeControllerProvider)
          .value
          ?.remainingBalance
          ?.toInt(),
      // TODO(backend): the number of guests that still need a reminder across
      // the user's events has no endpoint; this is a stand-in.
      guestsToRemind: 55,
    );
  }

  /// Pull to refresh: reloads the balance (home feed) and the history.
  Future<bool> refresh() async {
    final requestId = ++_latestRefreshRequest;
    bool isOutdated() => !ref.mounted || requestId != _latestRefreshRequest;
    final homeController = ref.read(homeControllerProvider.notifier);
    final refreshed = await homeController.refresh();
    if (isOutdated()) return false;
    await _loadHistory();
    return refreshed && !isOutdated();
  }

  /// Reloads the history after an error.
  Future<void> retry() async {
    if (!state.hasValue) return;
    _emit(_current.copyWith(history: const AsyncLoading()));
    await _loadHistory();
  }

  Future<void> _loadHistory() async {
    final requestId = ++_latestHistoryRequest;
    bool isOutdated() => !ref.mounted || requestId != _latestHistoryRequest;
    try {
      final entries = await _fetchHistory();
      if (isOutdated() || !state.hasValue) return;
      _emit(_current.copyWith(history: AsyncData(entries)));
    } catch (error, stackTrace) {
      if (isOutdated() || !state.hasValue) return;
      _emit(_current.copyWith(history: AsyncError(error, stackTrace)));
    }
  }

  // TODO(backend): there is no endpoint for the balance history (messages
  // spent per event, plans bought and their price). Replace this stand-in with a
  // repository call when it exists.
  Future<List<BalanceEntry>> _fetchHistory() async {
    await Future<void>.value();
    return [
      BalanceEntry(
        kind: BalanceEntryKind.invitations,
        label: "Fatima & Hamad's Wedding",
        date: DateTime(2026, 11, 3),
        amount: 254,
      ),
      BalanceEntry(
        kind: BalanceEntryKind.purchase,
        label: 'Celebration plan',
        date: DateTime(2026, 11, 3),
        amount: 300,
      ),
      BalanceEntry(
        kind: BalanceEntryKind.reminders,
        label: 'Al-Kuwari Family Ghabga',
        date: DateTime(2026, 3, 12),
        amount: 14,
      ),
      BalanceEntry(
        kind: BalanceEntryKind.invitations,
        label: 'Al-Kuwari Family Ghabga',
        date: DateTime(2026, 3, 10),
        amount: 86,
      ),
      BalanceEntry(
        kind: BalanceEntryKind.purchase,
        label: 'Essential plan',
        date: DateTime(2026, 3, 10),
        amount: 100,
      ),
    ];
  }
}
