// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ContactsController)
final contactsControllerProvider = ContactsControllerFamily._();

final class ContactsControllerProvider
    extends $AsyncNotifierProvider<ContactsController, ContactsState> {
  ContactsControllerProvider._({
    required ContactsControllerFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'contactsControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$contactsControllerHash();

  @override
  String toString() {
    return r'contactsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ContactsController create() => ContactsController();

  @override
  bool operator ==(Object other) {
    return other is ContactsControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$contactsControllerHash() =>
    r'7f72d69b6e8dc4c4de9a7447a263375feca55435';

final class ContactsControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ContactsController,
          AsyncValue<ContactsState>,
          ContactsState,
          FutureOr<ContactsState>,
          String?
        > {
  ContactsControllerFamily._()
    : super(
        retry: null,
        name: r'contactsControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ContactsControllerProvider call(String? occasionId) =>
      ContactsControllerProvider._(argument: occasionId, from: this);

  @override
  String toString() => r'contactsControllerProvider';
}

abstract class _$ContactsController extends $AsyncNotifier<ContactsState> {
  late final _$args = ref.$arg as String?;
  String? get occasionId => _$args;

  FutureOr<ContactsState> build(String? occasionId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ContactsState>, ContactsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ContactsState>, ContactsState>,
              AsyncValue<ContactsState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
