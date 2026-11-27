// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_failed_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Sends the invitations that were not delivered again.

@ProviderFor(ResendFailedController)
final resendFailedControllerProvider = ResendFailedControllerFamily._();

/// Sends the invitations that were not delivered again.
final class ResendFailedControllerProvider
    extends $NotifierProvider<ResendFailedController, void> {
  /// Sends the invitations that were not delivered again.
  ResendFailedControllerProvider._({
    required ResendFailedControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'resendFailedControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$resendFailedControllerHash();

  @override
  String toString() {
    return r'resendFailedControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ResendFailedController create() => ResendFailedController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ResendFailedControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$resendFailedControllerHash() =>
    r'f65ca87d378d7df1a6fb2ecda55624f2c5a6c110';

/// Sends the invitations that were not delivered again.

final class ResendFailedControllerFamily extends $Family
    with
        $ClassFamilyOverride<ResendFailedController, void, void, void, String> {
  ResendFailedControllerFamily._()
    : super(
        retry: null,
        name: r'resendFailedControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Sends the invitations that were not delivered again.

  ResendFailedControllerProvider call(String occasionId) =>
      ResendFailedControllerProvider._(argument: occasionId, from: this);

  @override
  String toString() => r'resendFailedControllerProvider';
}

/// Sends the invitations that were not delivered again.

abstract class _$ResendFailedController extends $Notifier<void> {
  late final _$args = ref.$arg as String;
  String get occasionId => _$args;

  void build(String occasionId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
