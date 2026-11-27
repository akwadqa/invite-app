import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/home/presentation/controller/home_controller.dart';
import 'package:invit/features/payment/presentation/utils/recharge_request.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_low_balance_sheet.dart';

/// Shows the "Not enough messages" sheet with [message] and [balance] against
/// `request.needed`. When the user picks recharge, opens the recharge flow
/// and refreshes the balance once it closes. Returns whether they recharged
/// (went through the flow).
Future<bool> offerRecharge(
  BuildContext context,
  WidgetRef ref, {
  required String message,
  required int balance,
  required RechargeRequest request,
}) async {
  final recharge = await AppLowBalanceSheet.show(
    context,
    message: message,
    needed: request.needed,
    balance: balance,
  );
  if (!recharge || !context.mounted) return false;
  await context.push(AppRoutes.rechargeScreen, extra: request);
  if (!context.mounted) return true;
  ref.read(homeControllerProvider.notifier).refresh();
  return true;
}
