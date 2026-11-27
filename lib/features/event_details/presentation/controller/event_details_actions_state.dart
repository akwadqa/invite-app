import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invit/features/event/domain/model/retry_bulk_response/retry_bulk_response.dart';
import 'package:invit/features/event_details/domain/model/resend_invitation_result_model.dart';

part 'event_details_actions_state.freezed.dart';

@freezed
abstract class EventDetailsActionsState with _$EventDetailsActionsState {
  const factory EventDetailsActionsState({
    /// Sends a draft event's invitations.
    @Default(AsyncData(null)) AsyncValue<bool?> sendInvitations,

    /// Resends the invitations that were not delivered.
    @Default(AsyncData(null)) AsyncValue<RetryBulkResponse?> resendFailed,

    /// Resends one guest's invitation.
    @Default(AsyncData(null))
    AsyncValue<ResendInvitationResultModel?> resendInvitation,

    /// Removes one guest from the event.
    @Default(AsyncData(null)) AsyncValue<String?> removeGuest,
  }) = _EventDetailsActionsState;
}
