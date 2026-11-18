import 'package:invit/features/auth/presentation/controller/auth_flow_state.dart';
import 'package:invit/features/auth/presentation/controller/auth_resend_countdown.dart';
import 'package:invit/features/auth/presentation/utils/auth_flow_constants.dart';
import 'package:invit/features/auth/signIn/data/repositories/sign_in_repository.dart';
import 'package:invit/features/auth/signIn/domain/model/signin_response_model.dart';
import 'package:invit/features/auth/signUp/data/repositories/signUp_repository.dart';
import 'package:invit/features/auth/signUp/domain/model/signUp_params.dart';
import 'package:invit/features/auth/signUp/domain/model/signup_response.dart';
import 'package:invit/features/auth/verification/data/repositories/verify_otp_repository.dart';
import 'package:invit/features/auth/verification/domain/model/verify_otp_response_model.dart';
import 'package:invit/src/application/data/user_information/user_information.dart';
import 'package:invit/src/core/notifications/services/notification_service.dart';
import 'package:invit/src/infrastructure/storage/local_storage_service.dart';
import 'package:invit/src/logger/failure/exceptions/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_flow_controller.g.dart';

/// Drives Sign in → (Create account) → Verify code.
///
/// Auto-disposed: the sign-in screen stays in the stack (the next screens are
/// pushed), so the flow keeps its state until the app navigates away with `go`.
@riverpod
class AuthFlowController extends _$AuthFlowController {
  /// Shared by [sendCode] and [resendCode]: both replace the active code and
  /// its countdown. Editing the phone number also bumps it.
  int _latestCodeRequest = 0;

  @override
  FutureOr<AuthFlowState> build() {
    // Keeps the auto-disposed countdown alive for the whole flow without
    // rebuilding this notifier on every tick.
    ref.listen(authResendCountdownProvider, (_, _) {});
    return const AuthFlowState();
  }

  AuthFlowState get _current => state.requireValue;
  void _emit(AuthFlowState newState) => state = AsyncData(newState);

  // ---------------------------------------------------------------------------
  // Inputs
  // ---------------------------------------------------------------------------

  /// [phoneNumber] is the national number, without the dial code.
  void updatePhoneNumber(String phoneNumber) {
    if (phoneNumber == _current.phoneNumber) return;
    _latestCodeRequest++;
    _countdown.stop();
    _emit(
      _current.copyWith(
        phoneNumber: phoneNumber,
        otp: '',
        sendCode: const AsyncData(null),
        resendCode: const AsyncData(null),
        verifyOtp: const AsyncData(null),
      ),
    );
  }

  void updateFullName(String fullName) {
    _emit(
      _current.copyWith(
        fullName: fullName,
        createAccount: _current.createAccount.hasError
            ? const AsyncData(null)
            : _current.createAccount,
      ),
    );
  }

  void updateOtp(String otp) {
    _emit(
      _current.copyWith(
        otp: otp,
        verifyOtp: _current.verifyOtp.hasError
            ? const AsyncData(null)
            : _current.verifyOtp,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Sign in: "Send code"
  // ---------------------------------------------------------------------------

  /// Sends the code to the entered phone. The screen routes on
  /// `validation.userExist`: verify when true, create account when false.
  Future<SigninResponseModel?> sendCode() async {
    if (!_current.canSendCode) return null;
    final repository = ref.read(signInRepositoryProvider);
    final requestId = ++_latestCodeRequest;
    bool isOutdated() => !ref.mounted || requestId != _latestCodeRequest;

    _countdown.stop();
    _emit(
      _current.copyWith(
        otp: '',
        sendCode: const AsyncLoading(),
        resendCode: const AsyncData(null),
        createAccount: const AsyncData(null),
        verifyOtp: const AsyncData(null),
      ),
    );

    try {
      final response = await repository.signIn(_current.fullPhoneNumber);
      if (isOutdated()) return null;
      final data = response.data;
      if (data == null) throw AppException(message: response.message);

      _emit(_current.copyWith(sendCode: AsyncData(data)));
      if (data.validation.userExist) {
        _startResendCountdown(data.allowLoginAfter);
      }
      return data;
    } catch (e, st) {
      if (isOutdated()) return null;
      _emit(_current.copyWith(sendCode: AsyncError(e, st)));
      return null;
    }
  }

  // ---------------------------------------------------------------------------
  // Create account: "Continue"
  // ---------------------------------------------------------------------------

  Future<SignupResponseModel?> createAccount() async {
    if (!_current.canCreateAccount) return null;
    final repository = ref.read(signupRepositoryProvider);
    final params = SignupParams(
      fullNamae: _current.fullName.trim(),
      mobileNumber: _current.fullPhoneNumber,
    );

    _emit(_current.copyWith(createAccount: const AsyncLoading()));

    try {
      final response = await repository.signUp(params);
      if (!ref.mounted) return null;
      final data = response.data;
      if (data == null) throw AppException(message: response.message);

      _emit(_current.copyWith(otp: '', createAccount: AsyncData(data)));
      _startResendCountdown(_current.sendCode.value?.allowLoginAfter);
      return data;
    } catch (e, st) {
      if (!ref.mounted) return null;
      _emit(_current.copyWith(createAccount: AsyncError(e, st)));
      return null;
    }
  }

  // ---------------------------------------------------------------------------
  // Verify: "Resend code"
  // ---------------------------------------------------------------------------

  Future<SigninResponseModel?> resendCode() async {
    if (!_current.canResendCode || _isCodeActive) return null;
    final repository = ref.read(signInRepositoryProvider);
    final requestId = ++_latestCodeRequest;
    bool isOutdated() => !ref.mounted || requestId != _latestCodeRequest;

    _emit(
      _current.copyWith(
        otp: '',
        resendCode: const AsyncLoading(),
        verifyOtp: const AsyncData(null),
      ),
    );

    try {
      final response = await repository.signIn(_current.fullPhoneNumber);
      if (isOutdated()) return null;
      final data = response.data;
      if (data == null) throw AppException(message: response.message);

      _emit(_current.copyWith(resendCode: AsyncData(data)));
      _startResendCountdown(data.allowLoginAfter);
      return data;
    } catch (e, st) {
      if (isOutdated()) return null;
      _emit(_current.copyWith(resendCode: AsyncError(e, st)));
      return null;
    }
  }

  // ---------------------------------------------------------------------------
  // Verify: "Verify"
  // ---------------------------------------------------------------------------

  /// Verifies the code, then persists the session and registers the device.
  Future<VerifyOtpResponseModel?> verifyOtp() async {
    if (!_current.canVerify || !_isCodeActive) return null;
    final repository = ref.read(verifyOtpRepositoryProvider);
    final storage = ref.read(localStorageServiceProvider);
    final notifications = ref.read(notificationsServiceProvider);
    final phone = _current.fullPhoneNumber;
    final otp = _current.otp;

    _emit(_current.copyWith(verifyOtp: const AsyncLoading()));

    try {
      final response = await repository.verifyOtp(phone, otp);
      if (!ref.mounted) return null;
      final data = response.data;
      if (data == null) throw AppException(message: response.message);

      await storage.saveToken(data.token);
      await storage.saveUserInfo(
        UserInformation(
          userId: data.userId,
          token: '',
          fullName: data.fullName,
          mobileNumber: data.mobileNo,
        ),
      );
      await notifications.sendDeviceToken(data.userId);
      if (!ref.mounted) return null;

      _countdown.stop();
      _emit(_current.copyWith(verifyOtp: AsyncData(data)));
      return data;
    } catch (e, st) {
      if (!ref.mounted) return null;
      _emit(_current.copyWith(verifyOtp: AsyncError(e, st)));
      return null;
    }
  }

  // ---------------------------------------------------------------------------
  // Resend countdown
  // ---------------------------------------------------------------------------

  AuthResendCountdown get _countdown =>
      ref.read(authResendCountdownProvider.notifier);

  /// The sent code can be verified only while the countdown runs.
  bool get _isCodeActive => ref.read(authResendCountdownProvider) > 0;

  /// A missing or non-positive backend value falls back to the default
  /// duration, otherwise the code would be unusable right away.
  void _startResendCountdown(int? allowResendAfterSeconds) {
    final fromApi = allowResendAfterSeconds ?? 0;
    _countdown.start(
      fromApi > 0 ? fromApi : AuthFlowConstants.defaultResendSeconds,
    );
  }
}
