import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:invit/features/settings/data/repositories/settings_repository.dart';
import 'package:invit/features/settings/presentation/controller/settings_state.dart';
import 'package:invit/src/infrastructure/storage/local_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller.g.dart';

/// The profile screen: user card, balance and the logout / delete actions.
@riverpod
class SettingsController extends _$SettingsController {
  SettingsState get _current => state.requireValue;
  void _emit(SettingsState newState) => state = AsyncData(newState);

  @override
  FutureOr<SettingsState> build() {
    ref.listen(
      homeControllerProvider.select((home) => home.value?.remainingBalance),
      (_, balance) {
        if (!state.hasValue) return;
        _emit(_current.copyWith(balance: balance?.toInt()));
      },
    );
    final userInfo = ref.read(localStorageServiceProvider).userInfo;
    return SettingsState(
      fullName: userInfo.fullName,
      phone: userInfo.mobileNumber,
      balance: ref
          .read(homeControllerProvider)
          .value
          ?.remainingBalance
          ?.toInt(),
    );
  }

  /// Logs out on the server, then clears the local session. If the server
  /// call fails the user stays signed in and the error is emitted.
  Future<bool> logout() async {
    if (!state.hasValue || _current.logoutState.isLoading) return false;
    final storage = ref.read(localStorageServiceProvider);
    final repository = ref.read(settingsRepositoryProvider);
    _emit(_current.copyWith(logoutState: const AsyncLoading()));
    try {
      await repository.logout();
      if (!ref.mounted) return false;
      await storage.logout();
      if (!ref.mounted) return false;
      _emit(_current.copyWith(logoutState: const AsyncData(null)));
      return true;
    } catch (e, st) {
      if (!ref.mounted) return false;
      _emit(_current.copyWith(logoutState: AsyncError(e, st)));
      return false;
    }
  }

  /// Deletes the account (same payload as before: the saved `user_id`), then
  /// clears the local session.
  Future<bool> deleteAccount() async {
    if (!state.hasValue || _current.deleteAccountState.isLoading) return false;
    final storage = ref.read(localStorageServiceProvider);
    final repository = ref.read(settingsRepositoryProvider);
    final userId = storage.userInfo.userId ?? '';
    _emit(_current.copyWith(deleteAccountState: const AsyncLoading()));
    try {
      final response = await repository.deleteAccount(userId);
      if (!ref.mounted) return false;
      if (response.hasFailed) {
        _emit(
          _current.copyWith(
            deleteAccountState: AsyncError(
              response.message ?? '',
              StackTrace.current,
            ),
          ),
        );
        return false;
      }
      await storage.logout();
      if (!ref.mounted) return false;
      _emit(_current.copyWith(deleteAccountState: const AsyncData(null)));
      return true;
    } catch (e, st) {
      if (!ref.mounted) return false;
      _emit(_current.copyWith(deleteAccountState: AsyncError(e, st)));
      return false;
    }
  }
}
