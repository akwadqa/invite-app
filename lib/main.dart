import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:invit/src/application/di/app_initilaizer.dart';

import 'features/app/app.dart';

Future<void> main() async {
  await AppInitializer.init();
  final container = await initializeProviders();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return UncontrolledProviderScope(
          container: container,
          child: EasyLocalization(
            supportedLocales: const [Locale('en'), Locale('ar')],
            path: 'assets/translations',
            child: const App(),
          ),
        );
      },
    ),
  );
}
