import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event_details/data/repositories/event_details_repository.dart';
import 'package:invit/src/logger/failure/exceptions/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_details_controller.g.dart';

/// One event with its guest list and reply report.
@riverpod
class EventDetailsController extends _$EventDetailsController {
  int _latestDetailsRequest = 0;

  @override
  Future<EventModel> build({required String ocassionId}) {
    _latestDetailsRequest++;
    return _fetch();
  }

  /// Reloads the event, keeping the current data on screen meanwhile.
  Future<void> refresh() async {
    final requestId = ++_latestDetailsRequest;
    bool isOutdated() => !ref.mounted || requestId != _latestDetailsRequest;
    try {
      final event = await _fetch();
      if (isOutdated()) return;
      state = AsyncData(event);
    } catch (error, stackTrace) {
      if (isOutdated()) return;
      if (!state.hasValue) state = AsyncError(error, stackTrace);
    }
  }

  /// Reloads after an error, showing the loading skeleton.
  Future<void> retry() async {
    state = const AsyncLoading();
    await refresh();
  }

  Future<EventModel> _fetch() async {
    final repository = ref.read(eventDetailsRepositoryProvider);
    final response = await repository.getEventDetails(ocassionId);
    final event = response.data;
    if (event == null) throw AppException(message: response.message);
    return event;
  }
}
