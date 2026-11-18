import 'dart:io';

/// What one WhatsApp message bubble shows.
class CreateEventPreviewMessage {
  const CreateEventPreviewMessage({
    this.title,
    this.message,
    this.imagePath,
    this.imageFile,
    this.buttons = const [],
    this.footer,
  });

  /// Bold first line of the message.
  final String? title;
  final String? message;

  /// Server image path, used when [imageFile] is `null`.
  final String? imagePath;
  final File? imageFile;

  /// Quick reply buttons under the message.
  final List<String> buttons;

  /// Gray line under the text, left of the time.
  final String? footer;
}

/// The chat for one preview tab: the invitation, or a guest's reply and the
/// message sent back to them.
class CreateEventPreviewChat {
  const CreateEventPreviewChat({
    required this.incoming,
    this.replyLabel,
    this.quotedTitle,
  });

  final CreateEventPreviewMessage incoming;

  /// The guest's reply (the tapped button); `null` for the invitation.
  final String? replyLabel;

  /// Title of the invitation quoted above the reply.
  final String? quotedTitle;
}
