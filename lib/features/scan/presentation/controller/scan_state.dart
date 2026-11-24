import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invit/features/scan/data/model/scan_qr_response/scan_qr_response.dart';

part 'scan_state.freezed.dart';

@freezed
abstract class ScanState with _$ScanState {
  const factory ScanState({
    /// Checks one guest in from a scanned QR code. `AsyncData(null)` is idle.
    @Default(AsyncData(null)) AsyncValue<ScanQrResponse?> checkIn,
  }) = _ScanState;
}
