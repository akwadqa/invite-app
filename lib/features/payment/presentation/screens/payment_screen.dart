import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/payment/presentation/utils/payment_web_args.dart';
import 'package:invit/features/payment/presentation/utils/recharge_format.dart';
import 'package:invit/features/payment/presentation/widgets/checkout_redirect_screen/checkout_redirect_screen_view.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_screen_header.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// The secure checkout web view. The "opening checkout" page stays on top
/// until the checkout has loaded, so the user never sees a blank page.
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.args});

  final PaymentWebArgs args;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final WebViewController _controller;
  bool _hasLoaded = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(onPageFinished: _onPageFinished),
      )
      ..loadRequest(Uri.parse(widget.args.url));
  }

  void _reload() {
    _controller.loadRequest(Uri.parse(widget.args.url));
  }

  void _back() {
    if (context.canPop()) context.pop();
  }

  Future<void> _onPageFinished(String url) async {
    if (!mounted) return;
    if (!_hasLoaded) setState(() => _hasLoaded = true);

    try {
      final bodyText = await _controller.runJavaScriptReturningResult(
        'document.body.innerText',
      );
      if (!mounted) return;
      // TODO(design): the payment result is still read from the page text;
      // send the user to the success / failed screens once they exist.
      if (Platform.isAndroid && (bodyText as String).contains('message')) {
        _handleResult(bodyText);
      }
    } catch (e) {
      debugPrint('Failed to read the payment response: $e');
    }
  }

  void _handleResult(String rawBody) {
    try {
      final unquoted = rawBody.startsWith('"') ? json.decode(rawBody) : rawBody;
      final parsed = json.decode(unquoted);

      if (parsed['message'] == 'Txn Success') {
        context.go(AppRoutes.mainScreen);
      } else {
        context.pop();
        AppToast.errorToast('Payment failed');
      }
    } catch (e) {
      debugPrint('Failed to handle the payment result: $e');
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: Stack(
        children: [
          Column(
            children: [
              AppScreenHeader(
                title: 'checkout_title'.tr(),
                subtitle: 'checkout_web_subtitle'.tr(),
              ),
              Expanded(child: WebViewWidget(controller: _controller)),
            ],
          ),
          if (!_hasLoaded)
            Positioned.fill(
              child: CheckoutRedirectScreenView(
                amount:
                    '${RechargeFormat.thousands(widget.args.plan.price)} ${'qar'.tr()}',
                onBack: _back,
                onRetry: _reload,
              ),
            ),
        ],
      ),
    );
  }
}
