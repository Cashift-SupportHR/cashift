import 'package:firebase_config/firebase_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

class AppLoggers {
  static void setupLogger() {
    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      debugPrint(
        'LLOOGGER ${record.level.name}: ${record.level.value}: ${record.time}: ${record.message}',
        wrapWidth: 3000,
      );

      // Forward log messages to Crashlytics breadcrumbs
      FirebaseBootstrapper.crashlytics.log('[${record.level.name}] ${record.message}');

      if (record.level >= Level.SEVERE && record.error != null) {
        FirebaseBootstrapper.crashlytics.recordError(
          record.error,
          record.stackTrace,
          reason: record.message,
        );
      }
    });
  }
}
