// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The balance screen: messages left, the "not enough" warning and the
/// paginated usage / purchase history, all from the message balance endpoint.

@ProviderFor(BalanceController)
final balanceControllerProvider = BalanceControllerProvider._();

/// The balance screen: messages left, the "not enough" warning and the
/// paginated usage / purchase history, all from the message balance endpoint.
final class BalanceControllerProvider
    extends $AsyncNotifierProvider<BalanceController, BalanceState> {
  /// The balance screen: messages left, the "not enough" warning and the
  /// paginated usage / purchase history, all from the message balance endpoint.
  BalanceControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'balanceControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$balanceControllerHash();

  @$internal
  @override
  BalanceController create() => BalanceController();
}

String _$balanceControllerHash() => r'fd479d09c9d4b9482036e2ad455806d32f3e1b5a';

/// The balance screen: messages left, the "not enough" warning and the
/// paginated usage / purchase history, all from the message balance endpoint.

abstract class _$BalanceController extends $AsyncNotifier<BalanceState> {
  FutureOr<BalanceState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<BalanceState>, BalanceState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<BalanceState>, BalanceState>,
              AsyncValue<BalanceState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
