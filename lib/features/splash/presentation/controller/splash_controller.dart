import 'package:invit/src/infrastructure/storage/local_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_controller.g.dart';

enum SplashDestination { signIn, main }

/// Resolves where to go after the splash. The screen navigates once both this
/// and its animation are done.
@riverpod
class SplashController extends _$SplashController {
  @override
  Future<SplashDestination> build() async {
    try {
      final isAuthenticated = await ref.watch(isAuthenticatedProvider.future);
      return isAuthenticated
          ? SplashDestination.main
          : SplashDestination.signIn;
    } catch (_) {
      // A session that cannot be read is treated as signed out.
      return SplashDestination.signIn;
    }
  }
}
