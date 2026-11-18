// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_details_actions_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// One-off actions on an event: send a draft, resend failed invitations and
/// remove a guest. Each one reloads the event when it succeeds.

@ProviderFor(EventDetailsActionsController)
final eventDetailsActionsControllerProvider =
    EventDetailsActionsControllerFamily._();

/// One-off actions on an event: send a draft, resend failed invitations and
/// remove a guest. Each one reloads the event when it succeeds.
final class EventDetailsActionsControllerProvider
    extends
        $NotifierProvider<
          EventDetailsActionsController,
          EventDetailsActionsState
        > {
  /// One-off actions on an event: send a draft, resend failed invitations and
  /// remove a guest. Each one reloads the event when it succeeds.
  EventDetailsActionsControllerProvider._({
    required EventDetailsActionsControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'eventDetailsActionsControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$eventDetailsActionsControllerHash();

  @override
  String toString() {
    return r'eventDetailsActionsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EventDetailsActionsController create() => EventDetailsActionsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EventDetailsActionsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EventDetailsActionsState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EventDetailsActionsControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$eventDetailsActionsControllerHash() =>
    r'2cb7aaf312ee8087874e975d61ab94cfff723805';

/// One-off actions on an event: send a draft, resend failed invitations and
/// remove a guest. Each one reloads the event when it succeeds.

final class EventDetailsActionsControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          EventDetailsActionsController,
          EventDetailsActionsState,
          EventDetailsActionsState,
          EventDetailsActionsState,
          String
        > {
  EventDetailsActionsControllerFamily._()
    : super(
        retry: null,
        name: r'eventDetailsActionsControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// One-off actions on an event: send a draft, resend failed invitations and
  /// remove a guest. Each one reloads the event when it succeeds.

  EventDetailsActionsControllerProvider call(String occasionId) =>
      EventDetailsActionsControllerProvider._(argument: occasionId, from: this);

  @override
  String toString() => r'eventDetailsActionsControllerProvider';
}

/// One-off actions on an event: send a draft, resend failed invitations and
/// remove a guest. Each one reloads the event when it succeeds.

abstract class _$EventDetailsActionsController
    extends $Notifier<EventDetailsActionsState> {
  late final _$args = ref.$arg as String;
  String get occasionId => _$args;

  EventDetailsActionsState build(String occasionId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<EventDetailsActionsState, EventDetailsActionsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EventDetailsActionsState, EventDetailsActionsState>,
              EventDetailsActionsState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
