// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Resolves where to go after the splash. The screen navigates once both this
/// and its animation are done.

@ProviderFor(SplashController)
final splashControllerProvider = SplashControllerProvider._();

/// Resolves where to go after the splash. The screen navigates once both this
/// and its animation are done.
final class SplashControllerProvider
    extends $AsyncNotifierProvider<SplashController, SplashDestination> {
  /// Resolves where to go after the splash. The screen navigates once both this
  /// and its animation are done.
  SplashControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashControllerHash();

  @$internal
  @override
  SplashController create() => SplashController();
}

String _$splashControllerHash() => r'4d1c06d238826905637d2e6b0322629bb064cdfe';

/// Resolves where to go after the splash. The screen navigates once both this
/// and its animation are done.

abstract class _$SplashController extends $AsyncNotifier<SplashDestination> {
  FutureOr<SplashDestination> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<SplashDestination>, SplashDestination>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SplashDestination>, SplashDestination>,
              AsyncValue<SplashDestination>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
