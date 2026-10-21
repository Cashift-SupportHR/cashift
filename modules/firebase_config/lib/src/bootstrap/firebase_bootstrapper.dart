import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_config/firebase_config.dart';
import 'package:flutter/foundation.dart';

class FirebaseBootstrapper {
  static CrashlyticsService? _crashlytics;

  static CrashlyticsService get crashlytics =>
      _crashlytics ??= CrashlyticsService();

  @visibleForTesting
  static set crashlytics(CrashlyticsService service) {
    _crashlytics = service;
  }

  static Future<FirebaseApp> initFirebase({
    required String languageCode,
    bool enableCrashlyticsInDev = false,
  }) async {
    // 1. Initialize Firebase with env-specific config
    final app = await initializeFirebase();

    // 2. Initialize Crashlytics
    await crashlytics.init(enableInDev: enableCrashlyticsInDev);

    return app;
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await initializeFirebase();
  }
}
