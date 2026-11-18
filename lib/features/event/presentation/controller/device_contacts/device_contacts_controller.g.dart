// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_contacts_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Phone contacts the user can pick guests from.

@ProviderFor(DeviceContactsController)
final deviceContactsControllerProvider = DeviceContactsControllerProvider._();

/// Phone contacts the user can pick guests from.
final class DeviceContactsControllerProvider
    extends $NotifierProvider<DeviceContactsController, DeviceContactsState> {
  /// Phone contacts the user can pick guests from.
  DeviceContactsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceContactsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceContactsControllerHash();

  @$internal
  @override
  DeviceContactsController create() => DeviceContactsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceContactsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceContactsState>(value),
    );
  }
}

String _$deviceContactsControllerHash() =>
    r'7920882b3c273030672a6101b7b49836dd876df3';

/// Phone contacts the user can pick guests from.

abstract class _$DeviceContactsController
    extends $Notifier<DeviceContactsState> {
  DeviceContactsState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<DeviceContactsState, DeviceContactsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DeviceContactsState, DeviceContactsState>,
              DeviceContactsState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
