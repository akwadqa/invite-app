import 'package:invit/features/scan/data/model/scan_qr_response/scan_qr_response.dart';
import 'package:invit/src/infrastructure/api/endpoint/api_endpoints.dart';
import 'package:invit/src/infrastructure/api/response/api_response.dart';
import 'package:invit/src/infrastructure/network/services/network_service.dart';
import 'package:invit/src/logger/log_services/dev_logger.dart';

class ScanRemoteDateSource {
  final NetworkService _networkService;

  ScanRemoteDateSource(this._networkService);

  Future<ApiResponse<ScanQrResponse>> scanQr({
    required String qrCode,
    required String checkinBy,
    required String inviteeId,
  }) async {
    try {
      final params = {'qr_code': qrCode, 'occasion_id': inviteeId};
      final response = await _networkService.post(
        ApiEndPoints.scanQr,
        queryParameters: params,
      );
      if (response.data == null || response.statusCode != 200) {
        throw Exception('Request failed');
      }

      return ApiResponse.fromJson(
        response.data,
        (json) => ScanQrResponse.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      Dev.logLine('Error in submitData: e');
      rethrow;
    }
  }
}
