// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_flow_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Drives Sign in → (Create account) → Verify code.
///
/// Auto-disposed: the sign-in screen stays in the stack (the next screens are
/// pushed), so the flow keeps its state until the app navigates away with `go`.

@ProviderFor(AuthFlowController)
final authFlowControllerProvider = AuthFlowControllerProvider._();

/// Drives Sign in → (Create account) → Verify code.
///
/// Auto-disposed: the sign-in screen stays in the stack (the next screens are
/// pushed), so the flow keeps its state until the app navigates away with `go`.
final class AuthFlowControllerProvider
    extends $AsyncNotifierProvider<AuthFlowController, AuthFlowState> {
  /// Drives Sign in → (Create account) → Verify code.
  ///
  /// Auto-disposed: the sign-in screen stays in the stack (the next screens are
  /// pushed), so the flow keeps its state until the app navigates away with `go`.
  AuthFlowControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authFlowControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authFlowControllerHash();

  @$internal
  @override
  AuthFlowController create() => AuthFlowController();
}

String _$authFlowControllerHash() =>
    r'692406434b494e5be6c338dd9d7737f38a9042ec';

/// Drives Sign in → (Create account) → Verify code.
///
/// Auto-disposed: the sign-in screen stays in the stack (the next screens are
/// pushed), so the flow keeps its state until the app navigates away with `go`.

abstract class _$AuthFlowController extends $AsyncNotifier<AuthFlowState> {
  FutureOr<AuthFlowState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AuthFlowState>, AuthFlowState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AuthFlowState>, AuthFlowState>,
              AsyncValue<AuthFlowState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
