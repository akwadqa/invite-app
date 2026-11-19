import 'package:invit/features/payment/data/repository/payment_repository.dart';
import 'package:invit/features/payment/presentation/controller/checkout_state.dart';
import 'package:invit/features/payment/presentation/utils/payment_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'checkout_controller.g.dart';

/// Gets the secure checkout address for a plan. The "opening checkout" screen
/// is the loading UI of this action, so no loading dialog is shown on top.
@riverpod
class CheckoutController extends _$CheckoutController {
  int _latestOpenRequest = 0;

  CheckoutState get _current => state.requireValue;
  void _emit(CheckoutState newState) => state = AsyncData(newState);

  @override
  FutureOr<CheckoutState> build() => const CheckoutState();

  /// Requests the checkout address of [planId] (the bundle name) and keeps
  /// the state loading for at least [PaymentConstants.redirectDuration].
  /// Returns the address, or `null` when it failed or became outdated.
  Future<String?> openCheckout(String planId) async {
    final requestId = ++_latestOpenRequest;
    bool isOutdated() => !ref.mounted || requestId != _latestOpenRequest;
    final repository = ref.read(paymentRepositoryProvider);
    final minimumWait = Future<void>.delayed(PaymentConstants.redirectDuration);

    _emit(_current.copyWith(paymentUrl: const AsyncLoading()));
    try {
      final response = await repository.getPaymentUrl(
        planId,
        PaymentConstants.paymentLanguage,
      );
      await minimumWait;
      if (isOutdated()) return null;
      final url = response.data;
      if (response.hasFailed || url == null || url.isEmpty) {
        _emit(
          _current.copyWith(
            paymentUrl: AsyncError(response.message ?? '', StackTrace.current),
          ),
        );
        return null;
      }
      _emit(_current.copyWith(paymentUrl: AsyncData(url)));
      return url;
    } catch (error, stackTrace) {
      await minimumWait;
      if (isOutdated()) return null;
      _emit(_current.copyWith(paymentUrl: AsyncError(error, stackTrace)));
      return null;
    }
  }
}
