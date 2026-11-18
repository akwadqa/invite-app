import 'package:flutter/widgets.dart' show StringCharacters;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invit/features/auth/presentation/utils/auth_flow_constants.dart';
import 'package:invit/features/auth/signIn/domain/model/signin_response_model.dart';
import 'package:invit/features/auth/signUp/domain/model/signup_response.dart';
import 'package:invit/features/auth/verification/domain/model/verify_otp_response_model.dart';

part 'auth_flow_state.freezed.dart';

/// Shared state for the Sign in → (Create account) → Verify code flow.
@freezed
abstract class AuthFlowState with _$AuthFlowState {
  const AuthFlowState._();

  const factory AuthFlowState({
    /// National number only, without the dial code.
    @Default('') String phoneNumber,
    @Default('') String fullName,
    @Default('') String otp,

    /// Sign in screen "Send code". Idle when `AsyncData(null)`.
    @Default(AsyncData(null)) AsyncValue<SigninResponseModel?> sendCode,

    /// Create account screen "Continue". Idle when `AsyncData(null)`.
    @Default(AsyncData(null)) AsyncValue<SignupResponseModel?> createAccount,

    /// Verify screen "Resend code". Idle when `AsyncData(null)`.
    @Default(AsyncData(null)) AsyncValue<SigninResponseModel?> resendCode,

    /// Verify screen "Verify". Idle when `AsyncData(null)`.
    @Default(AsyncData(null)) AsyncValue<VerifyOtpResponseModel?> verifyOtp,
  }) = _AuthFlowState;

  /// Phone as the backend expects it: dial code + number, no `+`.
  String get fullPhoneNumber =>
      '${AuthFlowConstants.qatarDialCode}$phoneNumber';

  /// Phone as shown to the user, e.g. `+974 5512 8890`.
  String get displayPhoneNumber {
    const group = AuthFlowConstants.phoneDisplayGroupLength;
    final grouped = phoneNumber.length > group
        ? '${phoneNumber.substring(0, group)} ${phoneNumber.substring(group)}'
        : phoneNumber;
    return '+${AuthFlowConstants.qatarDialCode} $grouped';
  }

  bool get isPhoneValid =>
      phoneNumber.length == AuthFlowConstants.qatarPhoneLength;

  bool get isFullNameValid => fullName.trim().isNotEmpty;

  bool get isOtpComplete => otp.length == AuthFlowConstants.otpLength;

  /// The countdown (`authResendCountdownProvider`) also has to be at zero.
  bool get canResendCode => !resendCode.isLoading;

  bool get canSendCode => isPhoneValid && !sendCode.isLoading;

  bool get canCreateAccount => isFullNameValid && !createAccount.isLoading;

  /// The countdown (`authResendCountdownProvider`) also has to be running.
  bool get canVerify => isOtpComplete && !verifyOtp.isLoading;

  /// Initials for the create-account avatar (e.g. "Hamad Al-Kuwari" → "HA").
  String get nameInitials => fullName
      .trim()
      .split(RegExp(r'\s+'))
      .where((part) => part.isNotEmpty)
      .take(2)
      .map((part) => part.characters.first.toUpperCase())
      .join();
}
