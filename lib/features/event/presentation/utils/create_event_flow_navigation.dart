import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';

/// How the "next" action of a create event step moves on.
abstract class CreateEventFlowNavigation {
  /// Goes to [route]. When the step was opened from the review screen to
  /// change something, it returns to the review instead of walking through
  /// the steps after it again.
  static void next(BuildContext context, WidgetRef ref, String route) {
    final isEditing = ref
        .read(createEventFlowControllerProvider)
        .isEditingFromReview;
    if (!isEditing) {
      context.push(route);
      return;
    }
    if (context.canPop()) context.pop();
  }
}
