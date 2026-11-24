// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_success_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The result of a paid [PaymentOrder]: what was bought, what happens next
/// and the balance afterwards. For a failed-invitations resend it also runs
/// the resend once the payment is confirmed.

@ProviderFor(PaymentSuccessController)
final paymentSuccessControllerProvider = PaymentSuccessControllerFamily._();

/// The result of a paid [PaymentOrder]: what was bought, what happens next
/// and the balance afterwards. For a failed-invitations resend it also runs
/// the resend once the payment is confirmed.
final class PaymentSuccessControllerProvider
    extends
        $AsyncNotifierProvider<PaymentSuccessController, PaymentSuccessState> {
  /// The result of a paid [PaymentOrder]: what was bought, what happens next
  /// and the balance afterwards. For a failed-invitations resend it also runs
  /// the resend once the payment is confirmed.
  PaymentSuccessControllerProvider._({
    required PaymentSuccessControllerFamily super.from,
    required PaymentOrder super.argument,
  }) : super(
         retry: null,
         name: r'paymentSuccessControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$paymentSuccessControllerHash();

  @override
  String toString() {
    return r'paymentSuccessControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PaymentSuccessController create() => PaymentSuccessController();

  @override
  bool operator ==(Object other) {
    return other is PaymentSuccessControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paymentSuccessControllerHash() =>
    r'c23dedf58e94ff82fd0c3d605af94d93f53724ef';

/// The result of a paid [PaymentOrder]: what was bought, what happens next
/// and the balance afterwards. For a failed-invitations resend it also runs
/// the resend once the payment is confirmed.

final class PaymentSuccessControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          PaymentSuccessController,
          AsyncValue<PaymentSuccessState>,
          PaymentSuccessState,
          FutureOr<PaymentSuccessState>,
          PaymentOrder
        > {
  PaymentSuccessControllerFamily._()
    : super(
        retry: null,
        name: r'paymentSuccessControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The result of a paid [PaymentOrder]: what was bought, what happens next
  /// and the balance afterwards. For a failed-invitations resend it also runs
  /// the resend once the payment is confirmed.

  PaymentSuccessControllerProvider call(PaymentOrder order) =>
      PaymentSuccessControllerProvider._(argument: order, from: this);

  @override
  String toString() => r'paymentSuccessControllerProvider';
}

/// The result of a paid [PaymentOrder]: what was bought, what happens next
/// and the balance afterwards. For a failed-invitations resend it also runs
/// the resend once the payment is confirmed.

abstract class _$PaymentSuccessController
    extends $AsyncNotifier<PaymentSuccessState> {
  late final _$args = ref.$arg as PaymentOrder;
  PaymentOrder get order => _$args;

  FutureOr<PaymentSuccessState> build(PaymentOrder order);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<PaymentSuccessState>, PaymentSuccessState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PaymentSuccessState>, PaymentSuccessState>,
              AsyncValue<PaymentSuccessState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
