import 'dart:async';

import 'package:invit/features/auth/presentation/utils/auth_flow_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_resend_countdown.g.dart';

/// Seconds left before "Resend code" is enabled. The sent code can be verified
/// only while this is above zero.
///
/// Kept apart from `AuthFlowState` so the per-second tick does not re-emit
/// (and re-log) the whole flow state. `AuthFlowController` keeps it alive
/// and is the only one that starts or stops it.
@riverpod
class AuthResendCountdown extends _$AuthResendCountdown {
  Timer? _timer;

  @override
  int build() {
    ref.onDispose(() => _timer?.cancel());
    return 0;
  }

  void start(int seconds) {
    _timer?.cancel();
    state = seconds < 0 ? 0 : seconds;
    if (state == 0) return;

    _timer = Timer.periodic(AuthFlowConstants.countdownTick, (timer) {
      if (!ref.mounted) {
        timer.cancel();
        return;
      }
      final secondsLeft = state - 1;
      if (secondsLeft <= 0) timer.cancel();
      state = secondsLeft < 0 ? 0 : secondsLeft;
    });
  }

  void stop() {
    _timer?.cancel();
    state = 0;
  }
}
