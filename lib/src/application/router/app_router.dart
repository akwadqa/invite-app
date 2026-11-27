import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/auth/signUp/presentation/screens/signup_screen.dart';
import 'package:invit/features/auth/verification/presentation/screens/verification_account_screen.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/event/presentation/screens/update_event/update_event_details_screen.dart';
import 'package:invit/features/event/presentation/screens/update_event/update_guest_list_screen.dart';
import 'package:invit/features/event_details/presentation/screens/event_details_screen.dart';
import 'package:invit/features/event_details/presentation/screens/resend_failed_screen.dart';
import 'package:invit/features/event_details/presentation/screens/send_reminder_screen.dart';
import 'package:invit/features/event_details/presentation/utils/reminder_audience.dart';
import 'package:invit/features/guest/presentation/screens/edit_guest_screen.dart';
import 'package:invit/features/guest/presentation/utils/edit_guest_screen_args.dart';
import 'package:invit/features/guest/presentation/screens/guests_screen.dart';
import 'package:invit/features/guest/presentation/utils/guests_screen_args.dart';
import 'package:invit/features/event/presentation/screens/create_event/contact_list_screen.dart';
import 'package:invit/features/event/presentation/screens/create_event/select_location_screen.dart';
import 'package:invit/features/event/presentation/screens/create_event_flow/create_event_contacts_screen.dart';
import 'package:invit/features/event/presentation/screens/create_event_flow/create_event_details_screen.dart';
import 'package:invit/features/event/presentation/screens/create_event_flow/create_event_guests_screen.dart';
import 'package:invit/features/event/presentation/screens/create_event_flow/create_event_crop_screen.dart';
import 'package:invit/features/event/presentation/screens/create_event_flow/create_event_image_screen.dart';
import 'package:invit/features/event/presentation/screens/create_event_flow/create_event_import_review_screen.dart';
import 'package:invit/features/event/presentation/screens/create_event_flow/create_event_preview_screen.dart';
import 'package:invit/features/event/presentation/screens/create_event_flow/create_event_quick_add_screen.dart';
import 'package:invit/features/event/presentation/screens/create_event_flow/create_event_review_screen.dart';
import 'package:invit/features/event/presentation/screens/create_event_flow/create_event_type_screen.dart';
import 'package:invit/features/home/presentation/screens/home_screen.dart';
import 'package:invit/features/settings/presentation/screens/profile_screen.dart';
import 'package:invit/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:invit/features/onBoarding/on_boarding.dart';
import 'package:invit/features/auth/signIn/presentation/screens/sign_in_screen.dart';
import 'package:invit/features/splash/presentation/screens/splash_screen.dart';
import 'package:invit/features/payment/presentation/screens/balance_screen.dart';
import 'package:invit/features/payment/presentation/screens/payment_screen.dart';
import 'package:invit/features/scan/presentation/screens/find_guest_screen.dart';
import 'package:invit/features/scan/presentation/screens/scan_screen.dart';
import 'package:invit/features/payment/presentation/utils/payment_order.dart';
import 'package:invit/features/payment/presentation/utils/recharge_request.dart';
import 'package:invit/features/payment/presentation/screens/payment_failed_screen.dart';
import 'package:invit/features/payment/presentation/screens/payment_success_screen.dart';
import 'package:invit/features/payment/presentation/utils/payment_web_args.dart';
import 'package:invit/features/payment/presentation/screens/choose_plan_screen.dart';
import 'package:invit/features/payment/presentation/screens/checkout_redirect_screen.dart';
import 'package:invit/features/payment/presentation/screens/payment_steps_screen.dart';
import 'package:invit/src/application/router/app_routes.dart';

import 'custom_navigation_observer.dart';
import 'fallback_screen.dart';

final GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter goRouter;

  AppRouter(Ref ref) : goRouter = _createRouter(ref);

  /// Screens of the create event flow. The page is named after its path so a
  /// step can return to an earlier one with `popUntil`.
  static GoRoute _createEventRoute(String path, Widget child) =>
      _createEventRouteFrom(path, (_) => child);

  static GoRoute _createEventRouteFrom(
    String path,
    Widget Function(GoRouterState state) builder,
  ) {
    return GoRoute(
      path: path,
      name: path,
      parentNavigatorKey: rootKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          key: state.pageKey,
          name: path,
          child: builder(state),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    );
  }

  static GoRouter _createRouter(Ref ref) {
    String initialRoute = AppRoutes.splashScreen;
    return GoRouter(
      navigatorKey: rootKey,
      initialLocation: initialRoute,
      observers: [CustomNavigationObserver()],
      errorBuilder: (context, state) => const FallbackScreen(),
      //   redirect: (context, state) async {
      //     // Consumer(
      //     //   builder: (context, ref, child) {
      //     //     // return ;
      //     //   },
      //     // );
      //   //  final storage = ref.read(localStorageServiceProvider);
      //   //   final isFirstTime = await storage.isFirstTimeOpen();
      //   //   final isAuth = await ref.read(isAuthenticatedProvider.future);
      //   //   final currentLocation = state.matchedLocation;

      //   //   Dev.logLine('Current location: $currentLocation');
      //   //   Dev.logLine('isFirstTime: $isFirstTime, isAuth: $isAuth');

      //   //   // ===== First-time onboarding =====
      //   //   if (isFirstTime ) {
      //   //     Dev.logLine(AppRoutes.onBoarding);
      //   //     return AppRoutes.onBoarding;
      //   //   }

      //   //   // ===== Not authenticated =====
      //   //   if (!isAuth ) {
      //   //     Dev.logLine(AppRoutes.signInScreen);

      //   //     return AppRoutes.signInScreen;
      //   //   }

      //   //   // ===== Authenticated users trying to access non-home pages =====
      //   //   // if (isAuth) {
      //   //     return AppRoutes.homeScreen;
      //     // }

      //     // No redirection needed
      //     // return null;
      // },
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.splashScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: const SplashScreen(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.onBoarding,
          name: AppRoutes.onBoarding,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: OnBoarding(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.signInScreen,
          name: AppRoutes.signInScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: const SignInScreen(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.signUpScreen,
          name: AppRoutes.signUpScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: const SignupScreen(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.verificationScreen,
          name: AppRoutes.verificationScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: const VerificationAccountScreen(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.homeScreen,
          name: AppRoutes.homeScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: HomeScreen(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.mainScreen,
          name: AppRoutes.mainScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: const HomeScreen(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
          routes: [
            GoRoute(
              path: AppRoutes.notificationScreen,
              name: AppRoutes.notificationScreen,
              parentNavigatorKey: rootKey,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: NotificationsScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: AppRoutes.eventDetails,
          name: AppRoutes.eventDetails,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: EventDetailsScreen(ocassionId: state.extra as String),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.selectLocationScreen,
          name: AppRoutes.selectLocationScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: SelectLocationPage(id: state.extra as String?),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        _createEventRouteFrom(
          AppRoutes.editGuestScreen,
          (state) => state.extra is EditGuestScreenArgs
              ? EditGuestScreen(args: state.extra as EditGuestScreenArgs)
              : const SizedBox.shrink(),
        ),
        _createEventRouteFrom(
          AppRoutes.sendReminderScreen,
          (state) => SendReminderScreen(
            args: SendReminderScreenArgs.from(state.extra),
          ),
        ),
        _createEventRouteFrom(
          AppRoutes.resendFailedScreen,
          (state) => ResendFailedScreen(occasionId: '${state.extra}'),
        ),
        GoRoute(
          path: AppRoutes.guestsScreen,
          name: AppRoutes.guestsScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: GuestsScreen(args: GuestsScreenArgs.from(state.extra)),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        //      GoRoute(
        //   path: AppRoutes.qrScreen,
        //   name: AppRoutes.qrScreen,
        //   pageBuilder: (context, state) => CustomTransitionPage(
        //     key: state.pageKey,
        //     child: QrScreen(id: state.extra as String?),
        //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //       return FadeTransition(opacity: animation, child: child);
        //     },
        //   ),
        // ),
        GoRoute(
          path: AppRoutes.scanQr,
          name: AppRoutes.scanQr,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: ScanScreen.from(state.extra),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          ),
        ),
        GoRoute(
          path: AppRoutes.findGuestScreen,
          name: AppRoutes.findGuestScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: FindGuestScreen.from(state.extra),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          ),
        ),
        // GoRoute(
        //   path: AppRoutes.scanCameraQR,
        //   name: AppRoutes.scanCameraQR,
        //   pageBuilder: (context, state) => CustomTransitionPage(
        //     key: state.pageKey,
        //     child: ScanQrCodeScreen(),
        //     transitionsBuilder:
        //         (context, animation, secondaryAnimation, child) {
        //       return FadeTransition(opacity: animation, child: child);
        //     },
        //   ),
        // ),
        GoRoute(
          path: AppRoutes.contactListScreen,
          name: AppRoutes.contactListScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: ContactListScreen(occasionId: state.extra as String?),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.paymentScreen,
          name: AppRoutes.paymentScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: const BalanceScreen(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.rechargeScreen,
          name: AppRoutes.rechargeScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: ChoosePlanScreen(
                request: state.extra is RechargeRequest
                    ? state.extra as RechargeRequest
                    : const RechargeRequest(),
              ),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.paymentStepsScreen,
          name: AppRoutes.paymentStepsScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            final order = state.extra;
            return CustomTransitionPage(
              child: order is PaymentOrder
                  ? PaymentStepsScreen(order: order)
                  : const SizedBox.shrink(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.checkoutRedirectScreen,
          name: AppRoutes.checkoutRedirectScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            final order = state.extra;
            return CustomTransitionPage(
              child: order is PaymentOrder
                  ? CheckoutRedirectScreen(order: order)
                  : const SizedBox.shrink(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.paymentSuccessScreen,
          name: AppRoutes.paymentSuccessScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            final order = state.extra;
            return CustomTransitionPage(
              child: order is PaymentOrder
                  ? PaymentSuccessScreen(order: order)
                  : const SizedBox.shrink(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.paymentFailedScreen,
          name: AppRoutes.paymentFailedScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            final order = state.extra;
            return CustomTransitionPage(
              child: order is PaymentOrder
                  ? PaymentFailedScreen(order: order)
                  : const SizedBox.shrink(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.updateEventScreen,
          name: AppRoutes.updateEventScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: UpdateEventDetailsScreen(
                eventModel: state.extra as EventModel,
              ),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.updateGuestListScreen,
          name: AppRoutes.updateGuestListScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: UpdateGuestListScreen(occasionId: state.extra as String),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        _createEventRouteFrom(
          AppRoutes.createEventTypeScreen,
          (state) => CreateEventTypeScreen(
            invitedAgain: state.extra is List<GuestModel>
                ? state.extra as List<GuestModel>
                : const [],
          ),
        ),
        _createEventRoute(
          AppRoutes.createEventPreviewScreen,
          const CreateEventPreviewScreen(),
        ),
        _createEventRoute(
          AppRoutes.createEventDetailsScreen,
          const CreateEventDetailsScreen(),
        ),
        _createEventRoute(
          AppRoutes.createEventGuestsScreen,
          const CreateEventGuestsScreen(),
        ),
        _createEventRoute(
          AppRoutes.createEventQuickAddScreen,
          const CreateEventQuickAddScreen(),
        ),
        _createEventRoute(
          AppRoutes.createEventContactsScreen,
          const CreateEventContactsScreen(),
        ),
        _createEventRoute(
          AppRoutes.createEventImportReviewScreen,
          const CreateEventImportReviewScreen(),
        ),
        _createEventRoute(
          AppRoutes.createEventCropScreen,
          const CreateEventCropScreen(),
        ),
        _createEventRoute(
          AppRoutes.createEventImageScreen,
          const CreateEventImageScreen(),
        ),
        _createEventRoute(
          AppRoutes.createEventReviewScreen,
          const CreateEventReviewScreen(),
        ),
        GoRoute(
          path: AppRoutes.settingsScreen,
          name: AppRoutes.settingsScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const ProfileScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.webPaymentScreen,
          name: AppRoutes.webPaymentScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: state.extra is PaymentWebArgs
                  ? PaymentScreen(args: state.extra as PaymentWebArgs)
                  : const SizedBox.shrink(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            );
          },
        ),
      ],
    );
  }
}
