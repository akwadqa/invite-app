import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_language.g.dart';

@Riverpod(keepAlive: true)
class CurrentLanguage extends _$CurrentLanguage {
  @override
  String build() {
    final deviceLang = ui.PlatformDispatcher.instance.locale.languageCode;
    return deviceLang;
  }

  void syncLanguage(String langCode) {
    if (state != langCode) {
      state = langCode;
    }
  }

  /// Loads the new translations first, then publishes the language, so
  /// nothing rebuilds against the old strings.
  Future<void> changeLanguage(BuildContext context, String languageCode) async {
    await context.setLocale(Locale(languageCode));
    if (!ref.mounted) return;
    state = languageCode;
  }
}
