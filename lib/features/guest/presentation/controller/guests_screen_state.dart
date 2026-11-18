import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invit/features/guest/presentation/utils/guest_reply_status.dart';

part 'guests_screen_state.freezed.dart';

@freezed
abstract class GuestsScreenState with _$GuestsScreenState {
  const factory GuestsScreenState({
    @Default('') String query,

    /// `null` shows every guest.
    GuestReplyStatus? filter,
  }) = _GuestsScreenState;
}
