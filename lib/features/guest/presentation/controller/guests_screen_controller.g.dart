// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guests_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Search text and reply filter of an event's guest list.

@ProviderFor(GuestsScreenController)
final guestsScreenControllerProvider = GuestsScreenControllerFamily._();

/// Search text and reply filter of an event's guest list.
final class GuestsScreenControllerProvider
    extends $NotifierProvider<GuestsScreenController, GuestsScreenState> {
  /// Search text and reply filter of an event's guest list.
  GuestsScreenControllerProvider._({
    required GuestsScreenControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'guestsScreenControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$guestsScreenControllerHash();

  @override
  String toString() {
    return r'guestsScreenControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GuestsScreenController create() => GuestsScreenController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GuestsScreenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GuestsScreenState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GuestsScreenControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$guestsScreenControllerHash() =>
    r'254d45ab1707d09bca727668bd4acbe05ded8f9c';

/// Search text and reply filter of an event's guest list.

final class GuestsScreenControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          GuestsScreenController,
          GuestsScreenState,
          GuestsScreenState,
          GuestsScreenState,
          String
        > {
  GuestsScreenControllerFamily._()
    : super(
        retry: null,
        name: r'guestsScreenControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Search text and reply filter of an event's guest list.

  GuestsScreenControllerProvider call(String occasionId) =>
      GuestsScreenControllerProvider._(argument: occasionId, from: this);

  @override
  String toString() => r'guestsScreenControllerProvider';
}

/// Search text and reply filter of an event's guest list.

abstract class _$GuestsScreenController extends $Notifier<GuestsScreenState> {
  late final _$args = ref.$arg as String;
  String get occasionId => _$args;

  GuestsScreenState build(String occasionId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<GuestsScreenState, GuestsScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GuestsScreenState, GuestsScreenState>,
              GuestsScreenState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

/// The event's guests matching the current search and filter.

@ProviderFor(filteredGuests)
final filteredGuestsProvider = FilteredGuestsFamily._();

/// The event's guests matching the current search and filter.

final class FilteredGuestsProvider
    extends
        $FunctionalProvider<
          List<GuestModel>,
          List<GuestModel>,
          List<GuestModel>
        >
    with $Provider<List<GuestModel>> {
  /// The event's guests matching the current search and filter.
  FilteredGuestsProvider._({
    required FilteredGuestsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'filteredGuestsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredGuestsHash();

  @override
  String toString() {
    return r'filteredGuestsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<GuestModel>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<GuestModel> create(Ref ref) {
    final argument = this.argument as String;
    return filteredGuests(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<GuestModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<GuestModel>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredGuestsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredGuestsHash() => r'db6cca00a79cf1696b6121f4685799de9078e97c';

/// The event's guests matching the current search and filter.

final class FilteredGuestsFamily extends $Family
    with $FunctionalFamilyOverride<List<GuestModel>, String> {
  FilteredGuestsFamily._()
    : super(
        retry: null,
        name: r'filteredGuestsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The event's guests matching the current search and filter.

  FilteredGuestsProvider call(String occasionId) =>
      FilteredGuestsProvider._(argument: occasionId, from: this);

  @override
  String toString() => r'filteredGuestsProvider';
}

/// Number of guests per reply status, for the filter chips.

@ProviderFor(guestReplyCounts)
final guestReplyCountsProvider = GuestReplyCountsFamily._();

/// Number of guests per reply status, for the filter chips.

final class GuestReplyCountsProvider
    extends
        $FunctionalProvider<
          Map<GuestReplyStatus, int>,
          Map<GuestReplyStatus, int>,
          Map<GuestReplyStatus, int>
        >
    with $Provider<Map<GuestReplyStatus, int>> {
  /// Number of guests per reply status, for the filter chips.
  GuestReplyCountsProvider._({
    required GuestReplyCountsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'guestReplyCountsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$guestReplyCountsHash();

  @override
  String toString() {
    return r'guestReplyCountsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Map<GuestReplyStatus, int>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<GuestReplyStatus, int> create(Ref ref) {
    final argument = this.argument as String;
    return guestReplyCounts(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<GuestReplyStatus, int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<GuestReplyStatus, int>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GuestReplyCountsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$guestReplyCountsHash() => r'5983c114c56874207e1a1f074f91af13e9553439';

/// Number of guests per reply status, for the filter chips.

final class GuestReplyCountsFamily extends $Family
    with $FunctionalFamilyOverride<Map<GuestReplyStatus, int>, String> {
  GuestReplyCountsFamily._()
    : super(
        retry: null,
        name: r'guestReplyCountsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Number of guests per reply status, for the filter chips.

  GuestReplyCountsProvider call(String occasionId) =>
      GuestReplyCountsProvider._(argument: occasionId, from: this);

  @override
  String toString() => r'guestReplyCountsProvider';
}
