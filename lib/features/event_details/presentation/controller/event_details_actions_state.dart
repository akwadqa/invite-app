import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invit/features/event/domain/model/retry_bulk_response/retry_bulk_response.dart';

part 'event_details_actions_state.freezed.dart';

@freezed
abstract class EventDetailsActionsState with _$EventDetailsActionsState {
  const factory EventDetailsActionsState({
    /// Sends a draft event's invitations.
    @Default(AsyncData(null)) AsyncValue<bool?> sendInvitations,

    /// Resends the invitations that were not delivered.
    @Default(AsyncData(null)) AsyncValue<RetryBulkResponse?> resendFailed,

    /// Removes one guest from the event.
    @Default(AsyncData(null)) AsyncValue<String?> removeGuest,
  }) = _EventDetailsActionsState;
}
