import 'package:easy_localization/easy_localization.dart';

/// "1 seat" / "3 seats".
String seatsLabel(int seats) => seats == 1
    ? 'create_guests_one_seat'.tr()
    : 'create_guests_seats'.tr(args: ['$seats']);
