import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_guest_state.freezed.dart';

@freezed
abstract class FindGuestState with _$FindGuestState {
  const factory FindGuestState({
    /// Text typed in the search field; empty lists every guest.
    @Default('') String query,
  }) = _FindGuestState;
}
