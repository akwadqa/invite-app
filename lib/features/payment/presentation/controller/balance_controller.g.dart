// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The balance screen: messages left (shared with the home feed), the
/// "not enough" warning and the usage / purchase history.

@ProviderFor(BalanceController)
final balanceControllerProvider = BalanceControllerProvider._();

/// The balance screen: messages left (shared with the home feed), the
/// "not enough" warning and the usage / purchase history.
final class BalanceControllerProvider
    extends $AsyncNotifierProvider<BalanceController, BalanceState> {
  /// The balance screen: messages left (shared with the home feed), the
  /// "not enough" warning and the usage / purchase history.
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

String _$balanceControllerHash() => r'a60d72e843ffaf3dddc98cf22f875a900ea3f445';

/// The balance screen: messages left (shared with the home feed), the
/// "not enough" warning and the usage / purchase history.

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
