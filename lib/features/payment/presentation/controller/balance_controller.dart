import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:invit/features/payment/data/repository/payment_repository.dart';
import 'package:invit/features/payment/domain/model/balance/balance_model.dart';
import 'package:invit/features/payment/presentation/controller/balance_state.dart';
import 'package:invit/src/infrastructure/api/response/pagination/pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'balance_controller.g.dart';

/// The balance screen: messages left, the "not enough" warning and the
/// paginated usage / purchase history, all from the message balance endpoint.
@riverpod
class BalanceController extends _$BalanceController {
  static const int _firstPage = 1;

  int _currentPage = _firstPage;
  int _totalPages = _firstPage;
  int _latestRequest = 0;

  BalanceState get _current => state.requireValue;
  void _emit(BalanceState newState) => state = AsyncData(newState);

  @override
  FutureOr<BalanceState> build() {
    unawaited(_loadFirstPage());
    return BalanceState(
      // Shown until the balance endpoint answers.
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

  /// Pull to refresh: reloads the balance and the first page of the history.
  Future<bool> refresh() => _loadFirstPage();

  /// Reloads the history after an error.
  Future<void> retry() async {
    if (!state.hasValue) return;
    _emit(_current.copyWith(history: const AsyncLoading()));
    await _loadFirstPage();
  }

  /// Returns whether more pages remain, for the pagination footer.
  Future<bool> loadNextPage() async {
    if (!state.hasValue || _currentPage >= _totalPages) return false;
    final page = _currentPage + 1;
    final requestId = ++_latestRequest;
    bool isOutdated() => !ref.mounted || requestId != _latestRequest;
    final repository = ref.read(paymentRepositoryProvider);
    try {
      final response = await repository.getBalance(page: page);
      if (isOutdated() || !state.hasValue) return false;
      _emit(_merge(response.data, response.pagination, page));
      return _currentPage < _totalPages;
    } catch (_) {
      return false;
    }
  }

  Future<bool> _loadFirstPage() async {
    final requestId = ++_latestRequest;
    bool isOutdated() => !ref.mounted || requestId != _latestRequest;
    final repository = ref.read(paymentRepositoryProvider);
    try {
      final response = await repository.getBalance(page: _firstPage);
      if (isOutdated() || !state.hasValue) return false;
      _emit(_merge(response.data, response.pagination, _firstPage));
      return true;
    } catch (error, stackTrace) {
      if (isOutdated() || !state.hasValue) return false;
      // Keep the lines already on screen when a refresh fails.
      if (!_current.history.hasValue) {
        _emit(_current.copyWith(history: AsyncError(error, stackTrace)));
      }
      return false;
    }
  }

  BalanceState _merge(BalanceModel? data, Pagination? pagination, int page) {
    _currentPage = pagination?.currentPage ?? page;
    _totalPages = pagination?.totalPages ?? page;
    final pageEntries = data?.history ?? const <BalanceHistoryModel>[];
    final previous = _current.history.value ?? const <BalanceHistoryModel>[];
    return _current.copyWith(
      balance: data?.messagesLeft?.toInt() ?? _current.balance,
      history: AsyncData(
        page == _firstPage ? pageEntries : [...previous, ...pageEntries],
      ),
    );
  }
}
