// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_reminder_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The audience picked on the "Send a reminder" screen and its sending.

@ProviderFor(SendReminderController)
final sendReminderControllerProvider = SendReminderControllerFamily._();

/// The audience picked on the "Send a reminder" screen and its sending.
final class SendReminderControllerProvider
    extends $NotifierProvider<SendReminderController, SendReminderState> {
  /// The audience picked on the "Send a reminder" screen and its sending.
  SendReminderControllerProvider._({
    required SendReminderControllerFamily super.from,
    required (String, ReminderAudience) super.argument,
  }) : super(
         retry: null,
         name: r'sendReminderControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sendReminderControllerHash();

  @override
  String toString() {
    return r'sendReminderControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  SendReminderController create() => SendReminderController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SendReminderState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SendReminderState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SendReminderControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sendReminderControllerHash() =>
    r'3abb07606b29b7397d638a7a41434ce9b4c9ab88';

/// The audience picked on the "Send a reminder" screen and its sending.

final class SendReminderControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          SendReminderController,
          SendReminderState,
          SendReminderState,
          SendReminderState,
          (String, ReminderAudience)
        > {
  SendReminderControllerFamily._()
    : super(
        retry: null,
        name: r'sendReminderControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The audience picked on the "Send a reminder" screen and its sending.

  SendReminderControllerProvider call(
    String occasionId,
    ReminderAudience initial,
  ) => SendReminderControllerProvider._(
    argument: (occasionId, initial),
    from: this,
  );

  @override
  String toString() => r'sendReminderControllerProvider';
}

/// The audience picked on the "Send a reminder" screen and its sending.

abstract class _$SendReminderController extends $Notifier<SendReminderState> {
  late final _$args = ref.$arg as (String, ReminderAudience);
  String get occasionId => _$args.$1;
  ReminderAudience get initial => _$args.$2;

  SendReminderState build(String occasionId, ReminderAudience initial);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SendReminderState, SendReminderState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SendReminderState, SendReminderState>,
              SendReminderState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}
