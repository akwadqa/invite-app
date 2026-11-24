import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invit/features/auth/presentation/utils/auth_flow_constants.dart';
import 'package:invit/features/auth/presentation/utils/qatar_phone_input_formatter.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/utils/guest_phone_number.dart';
import 'package:invit/features/event/presentation/utils/seats_choice.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_actions_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_guest_controller.freezed.dart';
part 'edit_guest_controller.g.dart';

@freezed
abstract class EditGuestState with _$EditGuestState {
  const factory EditGuestState({
    /// Country code of the guest's number, without the `+`.
    @Default(AuthFlowConstants.qatarDialCode) String dialCode,
    @Default('') String name,

    /// The number without its country code, digits only.
    @Default('') String phone,

    /// The chip selected (the last one means "5+", typed in [customSeats]).
    @Default(CreateEventFlowConstants.defaultSeats) int seats,
    @Default('') String customSeats,
  }) = _EditGuestState;
}

/// Why the edited guest cannot be saved yet (a translation key).
enum EditGuestError {
  missingName('quick_add_name_required'),
  invalidPhone('quick_add_phone_invalid'),
  invalidSeats('quick_add_seats_invalid');

  const EditGuestError(this.messageKey);
  final String messageKey;
}

/// The values being edited for one guest.
@riverpod
class EditGuestController extends _$EditGuestController {
  static const int _minForeignLength = 6;
  static const int _maxForeignLength = 12;

  @override
  EditGuestState build(String occasionId, GuestModel guest) {
    final phone = GuestPhoneNumber.fromContact(
      '+${guest.whatsappNumber ?? ''}',
    );
    final seats = guest.partySize ?? CreateEventFlowConstants.defaultSeats;
    return EditGuestState(
      dialCode: phone?.dialCode ?? AuthFlowConstants.qatarDialCode,
      name: guest.fullName?.trim() ?? '',
      phone: phone?.number ?? '',
      seats: SeatsChoice.optionFor(seats),
      customSeats: seats >= SeatsChoice.moreOption ? '$seats' : '',
    );
  }

  bool get isQatar => state.dialCode == AuthFlowConstants.qatarDialCode;

  /// The number the guest had when the screen opened, as shown to the user.
  String? get previousNumber {
    final phone = GuestPhoneNumber.fromContact(
      '+${guest.whatsappNumber ?? ''}',
    );
    return phone?.display;
  }

  /// `true` once the typed number differs from the guest's saved one.
  bool get isPhoneChanged {
    final saved = GuestPhoneNumber.fromContact(
      '+${guest.whatsappNumber ?? ''}',
    );
    return saved == null || saved.number != state.phone;
  }

  void updateName(String name) => state = state.copyWith(name: name);

  void updatePhone(String text) =>
      state = state.copyWith(phone: QatarPhoneInputFormatter.digitsOf(text));

  void selectSeats(int seats) => state = state.copyWith(seats: seats);

  void updateCustomSeats(String text) =>
      state = state.copyWith(customSeats: text);

  /// Seats of the guest, or `null` when the typed number is not valid.
  int? get chosenSeats => SeatsChoice.isMoreOption(state.seats)
      ? SeatsChoice.parseCustom(state.customSeats)
      : state.seats;

  /// Checks the values and saves them; returns what is wrong, or `null` when
  /// they are valid.
  Future<EditGuestError?> save() async {
    final error = _validate();
    if (error != null) return error;
    // TODO(backend): no endpoint edits one guest and resends their
    // invitation. Call it here with the name, number and seats when it
    // exists; until then the screen tells the user it is coming soon.
    return null;
  }

  /// Removes the guest; the screen shows the loading and the result.
  Future<void> remove() async {
    final inviteeId = guest.inviteeId;
    if (inviteeId == null) return;
    await ref
        .read(eventDetailsActionsControllerProvider(occasionId).notifier)
        .removeGuest(inviteeId);
  }

  EditGuestError? _validate() {
    if (state.name.trim().isEmpty) return EditGuestError.missingName;
    final digits = state.phone.length;
    final isValidPhone = isQatar
        ? digits == AuthFlowConstants.qatarPhoneLength
        : digits >= _minForeignLength && digits <= _maxForeignLength;
    if (!isValidPhone) return EditGuestError.invalidPhone;
    if (chosenSeats == null) return EditGuestError.invalidSeats;
    return null;
  }
}
