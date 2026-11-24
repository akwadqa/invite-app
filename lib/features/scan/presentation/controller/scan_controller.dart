import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/scan/data/repository/scan_respository.dart';
import 'package:invit/features/scan/presentation/controller/scan_state.dart';
import 'package:invit/src/logger/failure/exceptions/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scan_controller.g.dart';

/// Checks guests in at the door of one event by scanning their QR codes.
@riverpod
class ScanController extends _$ScanController {
  /// Camera frames repeat the same code many times a second; the same code is
  /// ignored again for this long after it was handled.
  static const Duration _sameCodeCooldown = Duration(seconds: 3);

  String? _lastCode;
  DateTime? _lastCodeAt;

  @override
  ScanState build(String occasionId) => const ScanState();

  /// Called for every detected QR code. Returns without doing anything while
  /// another check-in is running, while its result is still on screen or when
  /// the code was just handled.
  Future<void> onCodeDetected(String code) async {
    final trimmed = code.trim();
    if (trimmed.isEmpty) return;
    if (state.checkIn.isLoading || state.checkIn.value != null) return;
    final now = DateTime.now();
    final lastAt = _lastCodeAt;
    if (trimmed == _lastCode &&
        lastAt != null &&
        now.difference(lastAt) < _sameCodeCooldown) {
      return;
    }
    _lastCode = trimmed;
    _lastCodeAt = now;
    await _checkIn(trimmed);
  }

  /// Closes the last result so the next code can be scanned.
  void scanNext() => state = state.copyWith(checkIn: const AsyncData(null));

  Future<void> _checkIn(String qrCode) async {
    final repository = ref.read(scanRepositoryProvider);
    state = state.copyWith(checkIn: const AsyncLoading());
    try {
      // The endpoint's `occasion_id` parameter is the repository's
      // `inviteeId` argument.
      final response = await repository.scanQr(
        qrCode: qrCode,
        checkinBy: '',
        inviteeId: occasionId,
      );
      if (!ref.mounted) return;
      final data = response.data;
      if (response.hasFailed || data == null) {
        throw AppException(message: response.message);
      }
      state = state.copyWith(checkIn: AsyncData(data));
      _reloadEvent();
    } catch (error, stackTrace) {
      if (!ref.mounted) return;
      state = state.copyWith(checkIn: AsyncError(error, stackTrace));
    }
  }

  /// Refreshes the "arrived" counter shown on this screen and the details.
  void _reloadEvent() {
    ref
        .read(eventDetailsControllerProvider(ocassionId: occasionId).notifier)
        .refresh();
  }
}
