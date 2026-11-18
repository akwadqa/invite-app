import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/src/application/router/routing/app_router_provider.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:toastification/toastification.dart';
import '../../src/core/localization/current_language.dart';
import '../../src/core/utils/theme/app_theme.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  final TransitionBuilder _botToastBuilder = BotToastInit();

  @override
  void initState() {
    Future(() {
      ref.read(currentLanguageProvider.notifier).getLanguage(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = ref.watch(appRouterProvider);
    // Rebuilds the app when the language changes.
    ref.watch(currentLanguageProvider);
    return Sizer(
      maxMobileWidth: 400,
      builder: (context, oreintation, screenYupe) => ToastificationWrapper(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter.goRouter,
          // `go` removes the replaced page at once and only the new page
          // fades in, so paint the splash color under the navigator: leaving
          // the splash then fades from its last (background-only) frame, not black.
          builder: (context, child) => _botToastBuilder(
            context,
            ColoredBox(color: AppColors.mist, child: child),
          ),
          theme: ref.watch(appThemeProvider),
          onGenerateTitle: (context) => context.tr('appTitle'),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    );
  }
}
