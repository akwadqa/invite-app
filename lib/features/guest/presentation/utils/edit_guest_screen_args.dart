import 'package:invit/features/event/domain/model/event_model/event_model.dart';

/// Route extra of the edit guest screen.
class EditGuestScreenArgs {
  const EditGuestScreenArgs({required this.occasionId, required this.guest});

  final String occasionId;
  final GuestModel guest;
}
