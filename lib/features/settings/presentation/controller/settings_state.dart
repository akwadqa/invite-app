import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    /// Profile card data (from the saved user session).
    @Default('') String fullName,
    @Default('') String phone,

    /// Messages left (shared with the home feed); `null` while unknown.
    int? balance,

    // One-off actions: `AsyncData(null)` means idle.
    @Default(AsyncData(null)) AsyncValue<void> logoutState,
    @Default(AsyncData(null)) AsyncValue<void> deleteAccountState,
  }) = _SettingsState;
}
