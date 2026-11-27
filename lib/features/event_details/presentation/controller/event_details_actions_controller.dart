import 'package:invit/features/event/data/repository/event_repository.dart';
import 'package:invit/features/event_details/data/repositories/event_details_repository.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_actions_state.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/guest/data/repository/guest_repository.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:invit/src/logger/failure/exceptions/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_details_actions_controller.g.dart';

/// One-off actions on an event: send a draft, resend failed invitations,
/// resend one guest's invitation and remove a guest. Each one reloads the event when it succeeds.
@riverpod
class EventDetailsActionsController extends _$EventDetailsActionsController {
  @override
  EventDetailsActionsState build(String occasionId) =>
      const EventDetailsActionsState();

  Future<void> sendInvitations() async {
    if (state.sendInvitations.isLoading) return;
    final repository = ref.read(eventRepositoryProvider);
    state = state.copyWith(sendInvitations: const AsyncLoading());
    try {
      final response = await repository.confirmEvent(occasionId);
      if (!ref.mounted) return;
      if (!response.hasSucceeded) {
        throw AppException(message: response.message);
      }
      state = state.copyWith(sendInvitations: const AsyncData(true));
      _reloadEvent();
      ref.read(homeControllerProvider.notifier).refresh();
    } catch (error, stackTrace) {
      if (!ref.mounted) return;
      state = state.copyWith(sendInvitations: AsyncError(error, stackTrace));
    }
  }

  Future<void> resendFailed() async {
    if (state.resendFailed.isLoading) return;
    final repository = ref.read(eventRepositoryProvider);
    state = state.copyWith(resendFailed: const AsyncLoading());
    try {
      final response = await repository.resendFailedInvites(occasionId);
      if (!ref.mounted) return;
      final data = response.data;
      if (data == null) throw AppException(message: response.message);
      state = state.copyWith(resendFailed: AsyncData(data));
      _reloadEvent();
      ref.read(homeControllerProvider.notifier).refresh();
    } catch (error, stackTrace) {
      if (!ref.mounted) return;
      state = state.copyWith(resendFailed: AsyncError(error, stackTrace));
    }
  }

  /// A low balance settles as an error holding a `NotEnoughMessagesException`.
  Future<void> resendInvitation(String inviteeId) async {
    if (state.resendInvitation.isLoading) return;
    final repository = ref.read(eventDetailsRepositoryProvider);
    state = state.copyWith(resendInvitation: const AsyncLoading());
    try {
      final result = await repository.resendInvitation(inviteeId);
      if (!ref.mounted) return;
      state = state.copyWith(resendInvitation: AsyncData(result));
      _reloadEvent();
      ref.read(homeControllerProvider.notifier).refresh();
    } catch (error, stackTrace) {
      if (!ref.mounted) return;
      state = state.copyWith(resendInvitation: AsyncError(error, stackTrace));
    }
  }

  Future<void> removeGuest(String inviteeId) async {
    if (state.removeGuest.isLoading) return;
    final repository = ref.read(guestRepositoryProvider);
    state = state.copyWith(removeGuest: const AsyncLoading());
    try {
      final response = await repository.deleteGuest([inviteeId]);
      if (!ref.mounted) return;
      if (!response.hasSucceeded) {
        throw AppException(message: response.message);
      }
      state = state.copyWith(removeGuest: AsyncData(inviteeId));
      _reloadEvent();
    } catch (error, stackTrace) {
      if (!ref.mounted) return;
      state = state.copyWith(removeGuest: AsyncError(error, stackTrace));
    }
  }

  void _reloadEvent() {
    if (!ref.mounted) return;
    ref
        .read(eventDetailsControllerProvider(ocassionId: occasionId).notifier)
        .refresh();
  }
}
