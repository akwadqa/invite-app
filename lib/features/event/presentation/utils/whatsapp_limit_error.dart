/// Recognises the backend error returned when an event's invitations cannot
/// be sent because the messages (WhatsApp's daily limit / the balance for the
/// event) are not available.
abstract class WhatsAppLimitError {
  // TODO(backend): the error has no code, so it is recognised by its message.
  // Replace this with the exact code or message the backend returns.
  static const List<String> _keywords = [
    'balance',
    'insufficient',
    'enough',
    'quota',
    'limit',
  ];

  static bool matches(Object? error) {
    final message = '$error'.toLowerCase();
    return _keywords.any(message.contains);
  }
}
