// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_guest_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Search text of the "find a guest" screen of one event.

@ProviderFor(FindGuestController)
final findGuestControllerProvider = FindGuestControllerFamily._();

/// Search text of the "find a guest" screen of one event.
final class FindGuestControllerProvider
    extends $NotifierProvider<FindGuestController, FindGuestState> {
  /// Search text of the "find a guest" screen of one event.
  FindGuestControllerProvider._({
    required FindGuestControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'findGuestControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$findGuestControllerHash();

  @override
  String toString() {
    return r'findGuestControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FindGuestController create() => FindGuestController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FindGuestState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FindGuestState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FindGuestControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$findGuestControllerHash() =>
    r'3b5ecf795d98ff457be14d202dc334ef8296369c';

/// Search text of the "find a guest" screen of one event.

final class FindGuestControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          FindGuestController,
          FindGuestState,
          FindGuestState,
          FindGuestState,
          String
        > {
  FindGuestControllerFamily._()
    : super(
        retry: null,
        name: r'findGuestControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Search text of the "find a guest" screen of one event.

  FindGuestControllerProvider call(String occasionId) =>
      FindGuestControllerProvider._(argument: occasionId, from: this);

  @override
  String toString() => r'findGuestControllerProvider';
}

/// Search text of the "find a guest" screen of one event.

abstract class _$FindGuestController extends $Notifier<FindGuestState> {
  late final _$args = ref.$arg as String;
  String get occasionId => _$args;

  FindGuestState build(String occasionId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<FindGuestState, FindGuestState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FindGuestState, FindGuestState>,
              FindGuestState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

/// The event's guests whose name or number match the current search.

@ProviderFor(findGuestMatches)
final findGuestMatchesProvider = FindGuestMatchesFamily._();

/// The event's guests whose name or number match the current search.

final class FindGuestMatchesProvider
    extends
        $FunctionalProvider<
          List<GuestModel>,
          List<GuestModel>,
          List<GuestModel>
        >
    with $Provider<List<GuestModel>> {
  /// The event's guests whose name or number match the current search.
  FindGuestMatchesProvider._({
    required FindGuestMatchesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'findGuestMatchesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$findGuestMatchesHash();

  @override
  String toString() {
    return r'findGuestMatchesProvider'
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
    return findGuestMatches(ref, argument);
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
    return other is FindGuestMatchesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$findGuestMatchesHash() => r'2c72802111e4878fba14e31dd1086e208d88cf25';

/// The event's guests whose name or number match the current search.

final class FindGuestMatchesFamily extends $Family
    with $FunctionalFamilyOverride<List<GuestModel>, String> {
  FindGuestMatchesFamily._()
    : super(
        retry: null,
        name: r'findGuestMatchesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The event's guests whose name or number match the current search.

  FindGuestMatchesProvider call(String occasionId) =>
      FindGuestMatchesProvider._(argument: occasionId, from: this);

  @override
  String toString() => r'findGuestMatchesProvider';
}
