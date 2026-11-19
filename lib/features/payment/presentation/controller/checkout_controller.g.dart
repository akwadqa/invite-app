// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Gets the secure checkout address for a plan. The "opening checkout" screen
/// is the loading UI of this action, so no loading dialog is shown on top.

@ProviderFor(CheckoutController)
final checkoutControllerProvider = CheckoutControllerProvider._();

/// Gets the secure checkout address for a plan. The "opening checkout" screen
/// is the loading UI of this action, so no loading dialog is shown on top.
final class CheckoutControllerProvider
    extends $AsyncNotifierProvider<CheckoutController, CheckoutState> {
  /// Gets the secure checkout address for a plan. The "opening checkout" screen
  /// is the loading UI of this action, so no loading dialog is shown on top.
  CheckoutControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkoutControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkoutControllerHash();

  @$internal
  @override
  CheckoutController create() => CheckoutController();
}

String _$checkoutControllerHash() =>
    r'ff69a08c9887ad30fd8ec47630a90421b29739ee';

/// Gets the secure checkout address for a plan. The "opening checkout" screen
/// is the loading UI of this action, so no loading dialog is shown on top.

abstract class _$CheckoutController extends $AsyncNotifier<CheckoutState> {
  FutureOr<CheckoutState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CheckoutState>, CheckoutState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CheckoutState>, CheckoutState>,
              AsyncValue<CheckoutState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
