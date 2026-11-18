import 'package:flutter/services.dart';
import 'package:invit/features/auth/presentation/utils/auth_flow_constants.dart';

/// Keeps digits only (Arabic-Indic digits are converted), caps the length to a
/// Qatari number and shows it grouped, e.g. `5512 8890`.
class QatarPhoneInputFormatter extends TextInputFormatter {
  static const String _groupSeparator = ' ';
  static const int _arabicZero = 0x0660;
  static const int _easternArabicZero = 0x06F0;
  static const int _latinZero = 0x30;
  static const int _digitCount = 10;

  /// Digits only, as stored in state and sent to the backend.
  static String digitsOf(String text) => text.replaceAll(_groupSeparator, '');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = StringBuffer();
    for (final rune in newValue.text.runes) {
      final latin = _toLatinDigit(rune);
      if (latin != null) digits.writeCharCode(latin);
    }
    var number = digits.toString();
    if (number.length > AuthFlowConstants.qatarPhoneLength) {
      number = number.substring(0, AuthFlowConstants.qatarPhoneLength);
    }

    const group = AuthFlowConstants.phoneDisplayGroupLength;
    final text = number.length > group
        ? '${number.substring(0, group)}$_groupSeparator${number.substring(group)}'
        : number;

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  int? _toLatinDigit(int rune) {
    for (final zero in const [_latinZero, _arabicZero, _easternArabicZero]) {
      if (rune >= zero && rune < zero + _digitCount) {
        return _latinZero + rune - zero;
      }
    }
    return null;
  }
}
