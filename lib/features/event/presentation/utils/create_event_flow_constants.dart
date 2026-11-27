/// Values shared by the six "create event" screens.
abstract class CreateEventFlowConstants {
  static const int totalSteps = 6;
  static const int typeStep = 1;
  static const int previewStep = 2;
  static const int detailsStep = 3;
  static const int guestsStep = 4;
  static const int imageStep = 5;
  static const int reviewStep = 6;

  /// Sent as `language` when creating the event (the old flow's default).
  static const String defaultLanguage = 'Arabic';

  /// Seat choices in the quick add form; the last one means "or more".
  static const List<int> seatOptions = [1, 2, 3, 4, 5];

  /// Choosing the last option ("5+") asks for the number: from that option
  /// up to [maxCustomSeats] (3 digits).
  static const int minCustomSeats = 5;
  static const int maxCustomSeats = 999;
  static const int customSeatsDigits = 3;
  static const int defaultSeats = 1;

  /// Messages WhatsApp lets the account send in a day (shown to the user).
  static const int whatsAppDailyLimit = 1000;

  /// The event must start at least this many minutes from now.
  static const int minLeadMinutes = 10;

  /// One WhatsApp message is consumed per guest.
  static const int messagesPerGuest = 1;

  static const String mapLinkBase =
      'https://www.google.com/maps/search/?api=1&query=';
}

/// Tabs of the message preview, matched to the template reply buttons.
enum TemplatePreviewTab {
  invitation(null, 'create_preview_invitation'),
  confirmed('confirm', 'create_preview_if_confirmed'),
  declined('decline', 'create_preview_if_declined');

  const TemplatePreviewTab(this.buttonLabel, this.titleKey);

  /// `button_label` of the template button whose linked message this tab
  /// shows; `null` for the invitation itself.
  final String? buttonLabel;
  final String titleKey;
}

/// Why the details step cannot continue yet.
enum CreateEventDetailsError {
  missingTitle('create_details_name_required'),
  missingDateTime('create_details_date_required'),
  pastDateTime('create_details_past_date'),
  missingLocation('location_required');

  const CreateEventDetailsError(this.messageKey);
  final String messageKey;
}

/// Result of adding one guest from the quick add form.
enum AddGuestResult {
  added(null),
  missingName('quick_add_name_required'),
  invalidPhone('quick_add_phone_invalid'),
  duplicate('quick_add_duplicate');

  const AddGuestResult(this.messageKey);
  final String? messageKey;
}
