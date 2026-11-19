import 'package:intl/intl.dart';

abstract class RechargeFormat {
  static final NumberFormat _thousands = NumberFormat('#,###');

  /// `1000` -> `1,000`.
  static String thousands(num value) => _thousands.format(value);
}
