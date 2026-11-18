import 'package:invit/features/guest/presentation/utils/guest_reply_status.dart';

/// Route extra of the guests screen when it opens on a reply filter.
class GuestsScreenArgs {
  const GuestsScreenArgs({required this.occasionId, this.filter});

  final String occasionId;
  final GuestReplyStatus? filter;

  /// Accepts these args or a bare occasion id.
  factory GuestsScreenArgs.from(Object? extra) => extra is GuestsScreenArgs
      ? extra
      : GuestsScreenArgs(occasionId: extra as String);
}
