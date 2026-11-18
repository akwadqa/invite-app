abstract class AuthFlowConstants {
  /// Dial code sent to the backend without the leading `+` (e.g. `97455128890`).
  static const String qatarDialCode = '974';
  static const String qatarIsoCode = 'QA';
  static const int qatarPhoneLength = 8;

  /// The national number is displayed in groups of this size (`5512 8890`).
  static const int phoneDisplayGroupLength = 4;

  /// The backend issues 4-digit codes.
  static const int otpLength = 4;

  /// Used when the backend does not return `allow_login_after`.
  static const int defaultResendSeconds = 60;

  static const Duration countdownTick = Duration(seconds: 1);
}
