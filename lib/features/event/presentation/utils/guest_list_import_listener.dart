import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/utils/guest_list_file.dart';
import 'package:invit/features/event/presentation/utils/guest_list_import.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';
import 'package:invit/src/core/utils/functions/async_action_listener.dart';

/// Call in `build`: shows the loading dialog while a list started from
/// [origin] is read, then [onImported] or the error toast. Screens below in
/// the stack ignore uploads they did not start.
void listenGuestListImport(
  BuildContext context,
  WidgetRef ref, {
  required GuestListImportOrigin origin,
  required VoidCallback onImported,
}) {
  ref.listen(
    createEventFlowControllerProvider.select((state) => state.guestListImport),
    (previous, next) {
      final startedBy = ref
          .read(createEventFlowControllerProvider)
          .guestListImportOrigin;
      if (startedBy != origin) return;
      handleAsyncAction(
        context,
        previous,
        next,
        onSettled: (result) {
          final error = result.error;
          if (error == null) {
            onImported();
            return;
          }
          AppToast.errorToast(
            error is GuestListFileException
                ? error.messageKey.tr()
                : error.toString(),
          );
        },
      );
    },
  );
}
