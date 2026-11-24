import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';

/// The seat chips (1 … 5+) and the number typed when the last one is chosen.
abstract class SeatsChoice {
  /// The last chip ("5+"): it asks for the exact number in a field.
  static int get moreOption => CreateEventFlowConstants.seatOptions.last;

  static bool isMoreOption(int option) => option == moreOption;

  /// The chip that stands for [seats]: seats from the last chip up all use it.
  static int optionFor(int seats) {
    if (seats >= moreOption) return moreOption;
    return seats < CreateEventFlowConstants.defaultSeats
        ? CreateEventFlowConstants.defaultSeats
        : seats;
  }

  /// Seats typed in the field, or `null` when empty or out of range.
  static int? parseCustom(String text) {
    final seats = int.tryParse(text.trim());
    if (seats == null ||
        seats < CreateEventFlowConstants.minCustomSeats ||
        seats > CreateEventFlowConstants.maxCustomSeats) {
      return null;
    }
    return seats;
  }
}
