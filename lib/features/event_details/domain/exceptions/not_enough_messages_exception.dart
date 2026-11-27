import 'package:invit/features/event_details/domain/model/not_enough_messages_model.dart';

/// The balance does not cover a send (402). [details] says what is missing.
class NotEnoughMessagesException implements Exception {
  const NotEnoughMessagesException({required this.details, this.message});

  /// Reads the numbers from the response [body]: under `data`, under
  /// `message` (Frappe) or at its root.
  factory NotEnoughMessagesException.fromResponse(
    Object? body, {
    String? message,
  }) {
    final json = body is Map<String, dynamic>
        ? body
        : const <String, dynamic>{};
    final nested = json['data'] ?? json['message'];
    return NotEnoughMessagesException(
      details: NotEnoughMessagesModel.fromJson(
        nested is Map<String, dynamic> ? nested : json,
      ),
      message: message,
    );
  }

  final NotEnoughMessagesModel details;
  final String? message;

  @override
  String toString() => message ?? '';
}
