// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recharge_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The "Choose a plan" screen: the plans (home bundles), which of them cover
/// [needed] messages and the one picked.
///
/// Selecting is synchronous, so no request counter is needed; the payment
/// request belongs to the screens that follow this one.

@ProviderFor(RechargeController)
final rechargeControllerProvider = RechargeControllerFamily._();

/// The "Choose a plan" screen: the plans (home bundles), which of them cover
/// [needed] messages and the one picked.
///
/// Selecting is synchronous, so no request counter is needed; the payment
/// request belongs to the screens that follow this one.
final class RechargeControllerProvider
    extends $AsyncNotifierProvider<RechargeController, RechargeState> {
  /// The "Choose a plan" screen: the plans (home bundles), which of them cover
  /// [needed] messages and the one picked.
  ///
  /// Selecting is synchronous, so no request counter is needed; the payment
  /// request belongs to the screens that follow this one.
  RechargeControllerProvider._({
    required RechargeControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'rechargeControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$rechargeControllerHash();

  @override
  String toString() {
    return r'rechargeControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RechargeController create() => RechargeController();

  @override
  bool operator ==(Object other) {
    return other is RechargeControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$rechargeControllerHash() =>
    r'79e18a0c1bf74d6216e8d3a52331fcd1452f1f5c';

/// The "Choose a plan" screen: the plans (home bundles), which of them cover
/// [needed] messages and the one picked.
///
/// Selecting is synchronous, so no request counter is needed; the payment
/// request belongs to the screens that follow this one.

final class RechargeControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          RechargeController,
          AsyncValue<RechargeState>,
          RechargeState,
          FutureOr<RechargeState>,
          int
        > {
  RechargeControllerFamily._()
    : super(
        retry: null,
        name: r'rechargeControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The "Choose a plan" screen: the plans (home bundles), which of them cover
  /// [needed] messages and the one picked.
  ///
  /// Selecting is synchronous, so no request counter is needed; the payment
  /// request belongs to the screens that follow this one.

  RechargeControllerProvider call(int needed) =>
      RechargeControllerProvider._(argument: needed, from: this);

  @override
  String toString() => r'rechargeControllerProvider';
}

/// The "Choose a plan" screen: the plans (home bundles), which of them cover
/// [needed] messages and the one picked.
///
/// Selecting is synchronous, so no request counter is needed; the payment
/// request belongs to the screens that follow this one.

abstract class _$RechargeController extends $AsyncNotifier<RechargeState> {
  late final _$args = ref.$arg as int;
  int get needed => _$args;

  FutureOr<RechargeState> build(int needed);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<RechargeState>, RechargeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RechargeState>, RechargeState>,
              AsyncValue<RechargeState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
