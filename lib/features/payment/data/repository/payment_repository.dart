import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/payment/data/data%20source/payment_remote_data_source.dart';
import 'package:invit/features/payment/domain/model/balance/balance_model.dart';
import 'package:invit/src/infrastructure/api/response/api_response.dart';
import 'package:invit/src/infrastructure/network/exception/dio_exceptions.dart';
import 'package:invit/src/infrastructure/network/services/dio_client.dart';
import 'package:invit/src/logger/failure/exceptions/app_exception.dart' as logger;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_repository.g.dart';

@Riverpod(keepAlive: true)
PaymentRepository paymentRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return PaymentRepository(PaymentRemoteDataSource(networkService));
}

class PaymentRepository {
  final PaymentRemoteDataSource _remoteDataSource;

  PaymentRepository(this._remoteDataSource);

  Future<ApiResponse<String>> getPaymentUrl(
    String subscriptionType,
    String local,
  ) async {
    final response = await _remoteDataSource.getPaymentLink(
      subscriptionType,
      local,
    );

    if (response.status == 200) {
      return response;
    }

    throw AppException(response.message);
  }

  Future<ApiResponse<BalanceModel>> getBalance({required int page}) async {
    try {
      final result = await _remoteDataSource.getBalance(page: page);

      if (result.hasFailed) {
        throw logger.AppException(
          message: result.message ?? 'Failed to fetch data',
        );
      }

      return result;
    } catch (e) {
      throw logger.AppException(message: e.toString());
    }
  }
}
