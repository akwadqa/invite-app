// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_event_flow_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Holds everything the six "create event" screens collect. It lives while
/// any of those screens is on the stack, so leaving the flow resets it.

@ProviderFor(CreateEventFlowController)
final createEventFlowControllerProvider = CreateEventFlowControllerProvider._();

/// Holds everything the six "create event" screens collect. It lives while
/// any of those screens is on the stack, so leaving the flow resets it.
final class CreateEventFlowControllerProvider
    extends $NotifierProvider<CreateEventFlowController, CreateEventFlowState> {
  /// Holds everything the six "create event" screens collect. It lives while
  /// any of those screens is on the stack, so leaving the flow resets it.
  CreateEventFlowControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createEventFlowControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createEventFlowControllerHash();

  @$internal
  @override
  CreateEventFlowController create() => CreateEventFlowController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateEventFlowState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateEventFlowState>(value),
    );
  }
}

String _$createEventFlowControllerHash() =>
    r'6096a4dd40c595849faa46ff3917467e988b48b6';

/// Holds everything the six "create event" screens collect. It lives while
/// any of those screens is on the stack, so leaving the flow resets it.

abstract class _$CreateEventFlowController
    extends $Notifier<CreateEventFlowState> {
  CreateEventFlowState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CreateEventFlowState, CreateEventFlowState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CreateEventFlowState, CreateEventFlowState>,
              CreateEventFlowState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
