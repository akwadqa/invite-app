import 'package:dio/dio.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event_details/domain/exceptions/not_enough_messages_exception.dart';
import 'package:invit/features/event_details/domain/model/resend_invitation_result_model.dart';
import 'package:invit/features/event_details/domain/model/send_reminder_result_model.dart';
import 'package:invit/src/infrastructure/api/endpoint/api_endpoints.dart';
import 'package:invit/src/infrastructure/api/response/api_response.dart';
import 'package:invit/src/infrastructure/network/exception/dio_exceptions.dart';
import 'package:invit/src/infrastructure/network/services/network_service.dart';

class EventDetailsDatasource {
  final NetworkService _networkService;

  EventDetailsDatasource(this._networkService);

  Future<ApiResponse<EventModel>> getEventDetails({
    required String occasionId,
  }) async {
    try {
      final response = await _networkService.get(
        ApiEndPoints.getEventDetails,
        queryParameters: {"occasion_id": occasionId},
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => EventModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  /// Throws [NotEnoughMessagesException] when the balance is too low.
  Future<ApiResponse<SendReminderResultModel>> sendReminder({
    required String occasionId,
    required String audience,
  }) => _send(
    () => _networkService.post(
      ApiEndPoints.sendReminder,
      data: FormData.fromMap({'occasion_id': occasionId, 'audience': audience}),
    ),
    SendReminderResultModel.fromJson,
  );

  /// Throws [NotEnoughMessagesException] when the balance is too low.
  Future<ApiResponse<ResendInvitationResultModel>> resendInvitation({
    required String inviteeId,
  }) => _send(
    () => _networkService.post(
      ApiEndPoints.resendInvitation,
      data: FormData.fromMap({'invitee_id': inviteeId}),
    ),
    ResendInvitationResultModel.fromJson,
  );

  /// Runs [request] and parses its `data` with [fromJson]. A 402 is thrown
  /// as [NotEnoughMessagesException]; other errors become an error response.
  Future<ApiResponse<T>> _send<T>(
    Future<dynamic> Function() request,
    T Function(Map<String, dynamic> json) fromJson,
  ) async {
    try {
      final response = await request();
      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => fromJson(json as Map<String, dynamic>),
      );
    } on PaymentRequiredException catch (e) {
      throw NotEnoughMessagesException.fromResponse(
        e.data,
        message: e.toString(),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
