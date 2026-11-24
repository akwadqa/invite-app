// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_guest_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The values being edited for one guest.

@ProviderFor(EditGuestController)
final editGuestControllerProvider = EditGuestControllerFamily._();

/// The values being edited for one guest.
final class EditGuestControllerProvider
    extends $NotifierProvider<EditGuestController, EditGuestState> {
  /// The values being edited for one guest.
  EditGuestControllerProvider._({
    required EditGuestControllerFamily super.from,
    required (String, GuestModel) super.argument,
  }) : super(
         retry: null,
         name: r'editGuestControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$editGuestControllerHash();

  @override
  String toString() {
    return r'editGuestControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  EditGuestController create() => EditGuestController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EditGuestState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EditGuestState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EditGuestControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$editGuestControllerHash() =>
    r'b9839579239b4bcce7dc01a087ff29c3923a20af';

/// The values being edited for one guest.

final class EditGuestControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          EditGuestController,
          EditGuestState,
          EditGuestState,
          EditGuestState,
          (String, GuestModel)
        > {
  EditGuestControllerFamily._()
    : super(
        retry: null,
        name: r'editGuestControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The values being edited for one guest.

  EditGuestControllerProvider call(String occasionId, GuestModel guest) =>
      EditGuestControllerProvider._(argument: (occasionId, guest), from: this);

  @override
  String toString() => r'editGuestControllerProvider';
}

/// The values being edited for one guest.

abstract class _$EditGuestController extends $Notifier<EditGuestState> {
  late final _$args = ref.$arg as (String, GuestModel);
  String get occasionId => _$args.$1;
  GuestModel get guest => _$args.$2;

  EditGuestState build(String occasionId, GuestModel guest);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<EditGuestState, EditGuestState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EditGuestState, EditGuestState>,
              EditGuestState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}
