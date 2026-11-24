// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Checks guests in at the door of one event by scanning their QR codes.

@ProviderFor(ScanController)
final scanControllerProvider = ScanControllerFamily._();

/// Checks guests in at the door of one event by scanning their QR codes.
final class ScanControllerProvider
    extends $NotifierProvider<ScanController, ScanState> {
  /// Checks guests in at the door of one event by scanning their QR codes.
  ScanControllerProvider._({
    required ScanControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'scanControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$scanControllerHash();

  @override
  String toString() {
    return r'scanControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ScanController create() => ScanController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScanState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScanState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ScanControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$scanControllerHash() => r'1b13908a6d7d4d90ebddc4cfba6f9a5132ef7ddc';

/// Checks guests in at the door of one event by scanning their QR codes.

final class ScanControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ScanController,
          ScanState,
          ScanState,
          ScanState,
          String
        > {
  ScanControllerFamily._()
    : super(
        retry: null,
        name: r'scanControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Checks guests in at the door of one event by scanning their QR codes.

  ScanControllerProvider call(String occasionId) =>
      ScanControllerProvider._(argument: occasionId, from: this);

  @override
  String toString() => r'scanControllerProvider';
}

/// Checks guests in at the door of one event by scanning their QR codes.

abstract class _$ScanController extends $Notifier<ScanState> {
  late final _$args = ref.$arg as String;
  String get occasionId => _$args;

  ScanState build(String occasionId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ScanState, ScanState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ScanState, ScanState>,
              ScanState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
