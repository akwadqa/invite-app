// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Home feed: the user's events (paginated), balance, bundles and occasion
/// types. Other screens read the balance, bundles and types from it.

@ProviderFor(HomeController)
final homeControllerProvider = HomeControllerProvider._();

/// Home feed: the user's events (paginated), balance, bundles and occasion
/// types. Other screens read the balance, bundles and types from it.
final class HomeControllerProvider
    extends $AsyncNotifierProvider<HomeController, HomeModel> {
  /// Home feed: the user's events (paginated), balance, bundles and occasion
  /// types. Other screens read the balance, bundles and types from it.
  HomeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeControllerHash();

  @$internal
  @override
  HomeController create() => HomeController();
}

String _$homeControllerHash() => r'5614318de528531f33ed0e812cc00f1fe48a2b0a';

/// Home feed: the user's events (paginated), balance, bundles and occasion
/// types. Other screens read the balance, bundles and types from it.

abstract class _$HomeController extends $AsyncNotifier<HomeModel> {
  FutureOr<HomeModel> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<HomeModel>, HomeModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HomeModel>, HomeModel>,
              AsyncValue<HomeModel>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(homeEventSections)
final homeEventSectionsProvider = HomeEventSectionsProvider._();

final class HomeEventSectionsProvider
    extends
        $FunctionalProvider<
          HomeEventSections,
          HomeEventSections,
          HomeEventSections
        >
    with $Provider<HomeEventSections> {
  HomeEventSectionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeEventSectionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeEventSectionsHash();

  @$internal
  @override
  $ProviderElement<HomeEventSections> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HomeEventSections create(Ref ref) {
    return homeEventSections(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeEventSections value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeEventSections>(value),
    );
  }
}

String _$homeEventSectionsHash() => r'6d1505e3d62c124b17074515bcd161c9f643dcc3';
