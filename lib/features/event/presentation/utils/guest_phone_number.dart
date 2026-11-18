import 'package:invit/features/auth/presentation/utils/auth_flow_constants.dart';

/// A guest's WhatsApp number split into dial code and national number.
class GuestPhoneNumber {
  const GuestPhoneNumber({required this.dialCode, required this.number});

  final String dialCode;
  final String number;

  static const int _maxDialCodeLength = 3;
  static const String _internationalPrefix = '00';
  static const String _trunkPrefix = '0';
  static final RegExp _nonDigits = RegExp(r'\D');

  /// The value sent to the backend as `whatsapp_number` (e.g. `97455128890`).
  String get whatsappNumber => '$dialCode$number';

  /// `+974 5512 8890`.
  String get display {
    const group = AuthFlowConstants.phoneDisplayGroupLength;
    final grouped = number.length > group
        ? '${number.substring(0, group)} ${number.substring(group)}'
        : number;
    return '+$dialCode $grouped';
  }

  @override
  bool operator ==(Object other) =>
      other is GuestPhoneNumber &&
      other.dialCode == dialCode &&
      other.number == number;

  @override
  int get hashCode => Object.hash(dialCode, number);

  /// A Qatari national number typed in the quick add form.
  static GuestPhoneNumber? fromQatarNumber(String digits) {
    if (digits.length != AuthFlowConstants.qatarPhoneLength) return null;
    return GuestPhoneNumber(
      dialCode: AuthFlowConstants.qatarDialCode,
      number: digits,
    );
  }

  /// A number read from the phone's contacts, in any common format
  /// (`+974 5512 8890`, `0097455128890`, `55128890`, `055128890`).
  static GuestPhoneNumber? fromContact(String raw) {
    final trimmed = raw.trim();
    final isInternational =
        trimmed.startsWith('+') || trimmed.startsWith(_internationalPrefix);
    var digits = trimmed.replaceAll(_nonDigits, '');
    if (trimmed.startsWith(_internationalPrefix)) {
      digits = digits.substring(_internationalPrefix.length);
    }
    if (digits.isEmpty) return null;

    const qatarCode = AuthFlowConstants.qatarDialCode;
    const qatarLength = AuthFlowConstants.qatarPhoneLength;
    if (!isInternational) {
      if (digits.startsWith(_trunkPrefix)) digits = digits.substring(1);
      if (digits.length == qatarLength) {
        return GuestPhoneNumber(dialCode: qatarCode, number: digits);
      }
      if (digits.startsWith(qatarCode) &&
          digits.length == qatarCode.length + qatarLength) {
        return GuestPhoneNumber(
          dialCode: qatarCode,
          number: digits.substring(qatarCode.length),
        );
      }
    }
    if (digits.length <= _maxDialCodeLength) return null;
    if (digits.startsWith(qatarCode)) {
      return GuestPhoneNumber(
        dialCode: qatarCode,
        number: digits.substring(qatarCode.length),
      );
    }
    return GuestPhoneNumber(
      dialCode: digits.substring(0, _maxDialCodeLength),
      number: digits.substring(_maxDialCodeLength),
    );
  }
}
