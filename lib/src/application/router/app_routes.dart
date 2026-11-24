abstract class AppRoutes {
  //? init screen
  static const String initScreen = '/';
  static const String onBoarding = '/onBoarding';
  static const String signInScreen = '/sign_in';
  static const String signUpScreen = '/sign_up';
  static const String verificationScreen = '/verification';
  static const String splashScreen = '/splash';
  static const String homeScreen = '/home';
  static const String contactListScreen = '/contact_list';
  static const String selectLocationScreen = '/select_location';
  static const String guestsScreen = '/guest_screen';
  static const String sendReminderScreen = '/send_reminder';
  static const String editGuestScreen = '/edit_guest';
  static const String mainScreen = '/main';
  static const String notificationScreen = '/notification';
  static const String eventDetails = '/event_details';
  static const String paymentScreen = '/payment_screen';
  static const String rechargeScreen = '/recharge_screen';
  static const String paymentStepsScreen = '/payment_steps_screen';
  static const String checkoutRedirectScreen = '/checkout_redirect_screen';
  static const String paymentSuccessScreen = '/payment_success_screen';
  static const String paymentFailedScreen = '/payment_failed_screen';
  static const String updateEventScreen = '/update_event';
  static const String updateGuestListScreen = '/update_guest_list';
  static const String webPaymentScreen = '/web_payment';
  static const String settingsScreen = '/settings';

  //? Create event flow (6 steps)
  static const String createEventTypeScreen = '/create_event_type';
  static const String createEventPreviewScreen = '/create_event_preview';
  static const String createEventDetailsScreen = '/create_event_details';
  static const String createEventGuestsScreen = '/create_event_guests';
  static const String createEventQuickAddScreen = '/create_event_quick_add';
  static const String createEventContactsScreen = '/create_event_contacts';
  static const String createEventImportReviewScreen =
      '/create_event_import_review';
  static const String createEventImageScreen = '/create_event_image';
  static const String createEventCropScreen = '/create_event_crop';
  static const String createEventReviewScreen = '/create_event_review';

  // static String qrScreen = '/qr-page';

  static String scanQr = '/scan-qr-page';
  static String findGuestScreen = '/find-guest';
  static String scanCameraQR = '/scan-camera-qr-page';
}
