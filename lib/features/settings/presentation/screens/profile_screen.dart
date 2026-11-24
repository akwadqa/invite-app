import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/settings/presentation/controller/settings_controller.dart';
import 'package:invit/features/settings/presentation/utils/profile_screen_constants.dart';
import 'package:invit/features/settings/presentation/widgets/profile_screen/profile_screen_card.dart';
import 'package:invit/features/settings/presentation/widgets/profile_screen/profile_screen_footer.dart';
import 'package:invit/features/settings/presentation/widgets/profile_screen/profile_screen_glyph.dart';
import 'package:invit/features/settings/presentation/widgets/profile_screen/profile_screen_language_sheet.dart';
import 'package:invit/features/settings/presentation/widgets/profile_screen/profile_screen_section.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_dialogs.dart';
import 'package:invit/src/core/shared_widgets/app_screen_header.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';
import 'package:invit/src/core/utils/functions/async_action_listener.dart';
import 'package:invit/src/core/utils/functions/coming_soon.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// Account hub: user card, balance / receipts, support links, log out and
/// delete account.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  static const EdgeInsets _padding = EdgeInsets.fromLTRB(16, 8, 16, 34);
  static const Duration _languageFade = Duration(milliseconds: 350);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      settingsControllerProvider.select((s) => s.value?.logoutState),
      (prev, next) => handleAsyncAction(
        context,
        prev,
        next,
        onSettled: (result) => _onSettled(context, result),
      ),
    );
    ref.listen(
      settingsControllerProvider.select((s) => s.value?.deleteAccountState),
      (prev, next) => handleAsyncAction(
        context,
        prev,
        next,
        onSettled: (result) => _onSettled(context, result),
      ),
    );

    final profile = ref.watch(
      settingsControllerProvider.select(
        (s) => (
          name: s.value?.fullName ?? '',
          phone: s.value?.phone ?? '',
          balance: s.value?.balance,
        ),
      ),
    );
    final balance = profile.balance;

    // Cross-fades the page when the language changes.
    return AnimatedSwitcher(
      duration: _languageFade,
      child: KeyedSubtree(
        key: ValueKey(context.locale.languageCode),
        child: Scaffold(
          backgroundColor: AppColors.pageBackground,
          body: Column(
            children: [
              AppScreenHeader(
                title: 'profile_title'.tr(),
                subtitle: 'profile_subtitle'.tr(),
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: _padding,
                      sliver: SliverList.list(
                        children: [
                          ProfileScreenCard(
                            name: profile.name,
                            phone: profile.phone,
                            languageLabel: ProfileScreenLanguage.of(
                              context.locale,
                            ).nameKey.tr(),
                            onChangeLanguage: () =>
                                ProfileScreenLanguageSheet.show(context),
                          ),
                          const SizedBox(height: 16),
                          ProfileScreenSection(
                            title: 'profile_section_payments'.tr(),
                            rows: [
                              ProfileScreenRowData(
                                glyph: ProfileScreenGlyph.whatsapp,
                                label: 'profile_balance'.tr(),
                                value: balance == null
                                    ? null
                                    : 'profile_balance_messages'.tr(
                                        args: ['$balance'],
                                      ),
                                onTap: () =>
                                    context.push(AppRoutes.paymentScreen),
                              ),
                              ProfileScreenRowData(
                                glyph: ProfileScreenGlyph.receipt,
                                label: 'profile_receipts'.tr(),
                                // TODO(backend): there is no receipts screen or
                                // endpoint yet.
                                onTap: showComingSoon,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ProfileScreenSection(
                            title: 'profile_section_support'.tr(),
                            rows: [
                              ProfileScreenRowData(
                                glyph: ProfileScreenGlyph.help,
                                label: 'profile_help'.tr(),
                                // TODO(backend): no support contact or link yet.
                                onTap: showComingSoon,
                              ),
                              ProfileScreenRowData(
                                glyph: ProfileScreenGlyph.terms,
                                label: 'profile_terms'.tr(),
                                // TODO(backend): no terms / privacy page or link
                                // yet.
                                onTap: showComingSoon,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ProfileScreenSection(
                            title: 'profile_section_account'.tr(),
                            rows: [
                              ProfileScreenRowData(
                                glyph: ProfileScreenGlyph.logout,
                                label: 'profile_logout'.tr(),
                                onTap: () => _confirmLogout(context, ref),
                              ),
                              ProfileScreenRowData(
                                glyph: ProfileScreenGlyph.trash,
                                label: 'profile_delete_account'.tr(),
                                danger: true,
                                onTap: () => _confirmDelete(context, ref),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 34),
                          child: ProfileScreenFooter(
                            version: ProfileScreenConstants.appVersion,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSettled(BuildContext context, AsyncValue<void> result) {
    if (result.hasError) {
      AppToast.errorToast(result.error.toString());
      return;
    }
    context.go(AppRoutes.signInScreen);
  }

  Future<void> _confirmLogout(BuildContext context, WidgetRef ref) async {
    final confirmed = await AppDialogs.confirm(
      context,
      title: 'logout_title'.tr(),
      message: 'logout_description'.tr(),
      cancelText: 'common_cancel'.tr(),
      confirmText: 'logout_confirm'.tr(),
    );
    if (!confirmed || !context.mounted) return;
    await ref.read(settingsControllerProvider.notifier).logout();
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await AppDialogs.confirm(
      context,
      title: 'delete_user_title'.tr(),
      message: 'delete_user_description'.tr(),
      cancelText: 'common_cancel'.tr(),
      confirmText: 'delete_user_confirm'.tr(),
      destructive: true,
    );
    if (!confirmed || !context.mounted) return;
    await ref.read(settingsControllerProvider.notifier).deleteAccount();
  }
}
