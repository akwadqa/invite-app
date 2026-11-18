import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/src/core/shared_widgets/app_dialogs.dart';
import 'package:invit/src/core/utils/functions/helper_methods.dart';

/// Use inside `ref.listen` on an auth action (`AsyncValue`, idle when
/// `AsyncData(null)`): shows the full-screen loading dialog while it runs,
/// then closes it and the keyboard and calls [onSettled] with the result.
void handleAuthAction<T>(
  BuildContext context,
  AsyncValue<T>? previous,
  AsyncValue<T>? next, {
  required void Function(AsyncValue<T> result) onSettled,
}) {
  if (next == null) return;
  final wasLoading = previous?.isLoading ?? false;

  if (next.isLoading) {
    if (wasLoading) return;
    dismissKeyboard();
    AppDialogs.loading(context);
    return;
  }

  if (!wasLoading) return;
  AppDialogs.closeLoading(context);
  dismissKeyboard();
  onSettled(next);
}
