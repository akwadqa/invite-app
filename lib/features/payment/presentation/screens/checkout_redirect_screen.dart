import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/payment/domain/model/recharge_plan.dart';
import 'package:invit/features/payment/presentation/controller/checkout_controller.dart';
import 'package:invit/features/payment/presentation/utils/payment_web_args.dart';
import 'package:invit/features/payment/presentation/utils/recharge_format.dart';
import 'package:invit/features/payment/presentation/widgets/checkout_redirect_screen/checkout_redirect_screen_view.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';

/// Shown for a few seconds while the secure checkout address is requested,
/// then opens the checkout web view (which keeps this same page on top until
/// the checkout has loaded).
class CheckoutRedirectScreen extends ConsumerStatefulWidget {
  const CheckoutRedirectScreen({super.key, required this.plan});

  final RechargePlan plan;

  @override
  ConsumerState<CheckoutRedirectScreen> createState() =>
      _CheckoutRedirectScreenState();
}

class _CheckoutRedirectScreenState
    extends ConsumerState<CheckoutRedirectScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _open());
  }

  void _open() {
    if (!mounted) return;
    ref.read(checkoutControllerProvider.notifier).openCheckout(widget.plan.id);
  }

  void _back() {
    if (context.canPop()) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      checkoutControllerProvider.select((state) => state.value?.paymentUrl),
      (previous, next) {
        if (previous == null || !previous.isLoading || next == null) return;
        if (next.hasError) {
          // TODO(design): go to the payment-failed screen once it exists.
          AppToast.errorToast('checkout_redirect_error'.tr());
          _back();
          return;
        }
        final url = next.value;
        if (url == null) return;
        // Replace this page: the web view starts with the same page on top, and
        // going back from it returns to the order summary.
        context.pushReplacement(
          AppRoutes.webPaymentScreen,
          extra: PaymentWebArgs(url: url, plan: widget.plan),
        );
      },
    );

    final isLoading = ref.watch(
      checkoutControllerProvider.select(
        (state) => state.value?.paymentUrl.isLoading ?? true,
      ),
    );

    return Scaffold(
      body: CheckoutRedirectScreenView(
        amount: '${RechargeFormat.thousands(widget.plan.price)} ${'qar'.tr()}',
        onBack: _back,
        onRetry: isLoading ? null : _open,
      ),
    );
  }
}
