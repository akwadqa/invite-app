// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_resend_countdown.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Seconds left before "Resend code" is enabled. The sent code can be verified
/// only while this is above zero.
///
/// Kept apart from `AuthFlowState` so the per-second tick does not re-emit
/// (and re-log) the whole flow state. `AuthFlowController` keeps it alive
/// and is the only one that starts or stops it.

@ProviderFor(AuthResendCountdown)
final authResendCountdownProvider = AuthResendCountdownProvider._();

/// Seconds left before "Resend code" is enabled. The sent code can be verified
/// only while this is above zero.
///
/// Kept apart from `AuthFlowState` so the per-second tick does not re-emit
/// (and re-log) the whole flow state. `AuthFlowController` keeps it alive
/// and is the only one that starts or stops it.
final class AuthResendCountdownProvider
    extends $NotifierProvider<AuthResendCountdown, int> {
  /// Seconds left before "Resend code" is enabled. The sent code can be verified
  /// only while this is above zero.
  ///
  /// Kept apart from `AuthFlowState` so the per-second tick does not re-emit
  /// (and re-log) the whole flow state. `AuthFlowController` keeps it alive
  /// and is the only one that starts or stops it.
  AuthResendCountdownProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authResendCountdownProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authResendCountdownHash();

  @$internal
  @override
  AuthResendCountdown create() => AuthResendCountdown();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$authResendCountdownHash() =>
    r'e75ed08224eafeec510e3f33ad2e0b46badfff2b';

/// Seconds left before "Resend code" is enabled. The sent code can be verified
/// only while this is above zero.
///
/// Kept apart from `AuthFlowState` so the per-second tick does not re-emit
/// (and re-log) the whole flow state. `AuthFlowController` keeps it alive
/// and is the only one that starts or stops it.

abstract class _$AuthResendCountdown extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
