import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/payment/presentation/controller/balance_controller.dart';
import 'package:invit/features/payment/presentation/widgets/balance_screen/balance_screen_hero.dart';
import 'package:invit/features/payment/presentation/widgets/balance_screen/balance_screen_history.dart';
import 'package:invit/features/payment/presentation/widgets/balance_screen/balance_screen_history_header.dart';
import 'package:invit/features/payment/presentation/widgets/balance_screen/balance_screen_info_tiles.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_pagination_widget.dart';
import 'package:invit/src/core/shared_widgets/app_screen_header.dart';
import 'package:invit/src/core/utils/functions/coming_soon.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// Messages left, what each message type costs and the usage / purchase
/// history, with a shortcut to recharge.
class BalanceScreen extends ConsumerWidget {
  const BalanceScreen({super.key});

  static const EdgeInsets _listPadding = EdgeInsets.only(top: 6, bottom: 24);
  static const EdgeInsets _sidePadding = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets _historyPadding = EdgeInsets.symmetric(
    horizontal: 20,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(
      balanceControllerProvider.select(
        (value) => (
          balance: value.value?.balance,
          guestsToRemind: value.value?.guestsToRemind ?? 0,
        ),
      ),
    );
    final balance = status.balance;
    final warningGuests = balance != null && status.guestsToRemind > balance
        ? status.guestsToRemind
        : null;

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: Column(
        children: [
          AppScreenHeader(
            title: 'balance_title'.tr(),
            subtitle: 'balance_subtitle'.tr(),
          ),
          Expanded(
            child: AppPaginationWidget(
              enablePullDown: true,
              onRefresh: ref.read(balanceControllerProvider.notifier).refresh,
              onLoading: (_) =>
                  ref.read(balanceControllerProvider.notifier).loadNextPage(),
              child: ListView(
                padding: _listPadding,
                children: [
                  Padding(
                    padding: _sidePadding,
                    child: BalanceScreenHero(
                      balance: balance,
                      warningGuests: warningGuests,
                      onRecharge: () => context.push(AppRoutes.rechargeScreen),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: _sidePadding,
                    child: BalanceScreenInfoTiles(),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: _historyPadding,
                    child: BalanceScreenHistoryHeader(
                      // TODO(backend): there is no receipts screen or
                      // endpoint yet.
                      onReceipts: showComingSoon,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: _historyPadding,
                    child: BalanceScreenHistory(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
