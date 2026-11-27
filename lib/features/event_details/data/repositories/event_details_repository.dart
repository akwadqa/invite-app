import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event_details/data/datasources/event_details_datasource.dart';
import 'package:invit/features/event_details/domain/exceptions/not_enough_messages_exception.dart';
import 'package:invit/features/event_details/domain/model/resend_invitation_result_model.dart';
import 'package:invit/features/event_details/domain/model/send_reminder_result_model.dart';
import 'package:invit/src/infrastructure/api/response/api_response.dart';
import 'package:invit/src/infrastructure/network/exception/dio_exceptions.dart';
import 'package:invit/src/infrastructure/network/services/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_details_repository.g.dart';

@Riverpod(keepAlive: true)
EventDetailsRepository eventDetailsRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return EventDetailsRepository(EventDetailsDatasource(networkService));
}

class EventDetailsRepository {
  final EventDetailsDatasource _remoteDataSource;

  EventDetailsRepository(this._remoteDataSource);

  Future<ApiResponse<EventModel>> getEventDetails(String occasionId) async {
    try {
      final result = await _remoteDataSource.getEventDetails(
        occasionId: occasionId,
      );
      if (result.hasFailed) {
        throw AppException(result.message ?? 'Failed to fetch getEventDetails');
      }
      return result;
    } catch (e) {
      throw AppException('Failed to Get getEventDetails: $e');
    }
  }

  /// Reminds the guests of [audience] (`no_reply` or `confirmed`). Throws
  /// [NotEnoughMessagesException] when the balance is too low.
  Future<SendReminderResultModel> sendReminder(
    String occasionId, {
    required String audience,
  }) async => _dataOf(
    await _remoteDataSource.sendReminder(
      occasionId: occasionId,
      audience: audience,
    ),
  );

  /// Throws [NotEnoughMessagesException] when the balance is too low.
  Future<ResendInvitationResultModel> resendInvitation(
    String inviteeId,
  ) async =>
      _dataOf(await _remoteDataSource.resendInvitation(inviteeId: inviteeId));

  T _dataOf<T>(ApiResponse<T> response) {
    final data = response.data;
    if (!response.hasSucceeded || data == null) {
      throw AppException(response.message);
    }
    return data;
  }
}
