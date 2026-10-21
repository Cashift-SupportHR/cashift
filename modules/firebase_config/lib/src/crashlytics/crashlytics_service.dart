import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Service responsible for managing Firebase Crashlytics logging, custom keys,
/// user identifiers, and error handling across Flutter framework and platform dispatchers.
class CrashlyticsService {
  final FirebaseCrashlytics? _crashlytics;

  CrashlyticsService({FirebaseCrashlytics? crashlytics})
      : _crashlytics = crashlytics;

  FirebaseCrashlytics get _instance =>
      _crashlytics ?? FirebaseCrashlytics.instance;

  /// Initializes Crashlytics data collection and sets up automatic error handlers.
  ///
  /// By default, data collection is enabled in release mode and disabled in debug mode,
  /// unless [enableInDev] is set to `true`.
  Future<void> init({bool enableInDev = false}) async {
    try {
      final bool isEnabled = enableInDev || !kDebugMode;
      await _instance.setCrashlyticsCollectionEnabled(isEnabled);

      // Pass all uncaught "fatal" errors from the framework to Crashlytics
      final originalFlutterOnError = FlutterError.onError;
      FlutterError.onError = (FlutterErrorDetails details) {
        try {
          _instance.recordFlutterFatalError(details);
        } catch (e) {
          debugPrint('CrashlyticsService: Failed to record Flutter fatal error: $e');
        }
        if (originalFlutterOnError != null) {
          originalFlutterOnError(details);
        }
      };

      // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
      PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
        try {
          _instance.recordError(error, stack, fatal: true);
        } catch (e) {
          debugPrint('CrashlyticsService: Failed to record async error: $e');
        }
        return true;
      };
    } catch (e) {
      debugPrint('CrashlyticsService: Failed to initialize Crashlytics: $e');
    }
  }

  /// Sets the collection enabled state for Crashlytics manually.
  Future<void> setCollectionEnabled(bool enabled) async {
    try {
      await _instance.setCrashlyticsCollectionEnabled(enabled);
    } catch (e) {
      debugPrint('CrashlyticsService: Failed to set collection enabled ($enabled): $e');
    }
  }

  /// Records a non-fatal or fatal error with exception and stack trace.
  Future<void> recordError(
    dynamic exception,
    StackTrace? stack, {
    dynamic reason,
    Iterable<Object> information = const [],
    bool fatal = false,
  }) async {
    try {
      await _instance.recordError(
        exception,
        stack,
        reason: reason,
        information: information,
        fatal: fatal,
      );
    } catch (e) {
      debugPrint('CrashlyticsService: Failed to record error: $e');
    }
  }

  /// Records Flutter specific error details.
  Future<void> recordFlutterError(
    FlutterErrorDetails details, {
    bool fatal = false,
  }) async {
    try {
      if (fatal) {
        await _instance.recordFlutterFatalError(details);
      } else {
        await _instance.recordFlutterError(details);
      }
    } catch (e) {
      debugPrint('CrashlyticsService: Failed to record Flutter error: $e');
    }
  }

  /// Sets a user identifier associated with crash reports.
  Future<void> setUserIdentifier(String identifier) async {
    try {
      await _instance.setUserIdentifier(identifier);
    } catch (e) {
      debugPrint('CrashlyticsService: Failed to set user identifier: $e');
    }
  }

  /// Sets custom key-value pairs for additional crash diagnostic data.
  Future<void> setCustomKey(String key, Object value) async {
    try {
      await _instance.setCustomKey(key, value);
    } catch (e) {
      debugPrint('CrashlyticsService: Failed to set custom key ($key): $e');
    }
  }

  /// Logs a custom message to be included in crash logs.
  Future<void> log(String message) async {
    try {
      await _instance.log(message);
    } catch (e) {
      debugPrint('CrashlyticsService: Failed to log message: $e');
    }
  }

  /// Forces a crash for testing Crashlytics integration.
  ///
  /// CAUTION: Do NOT call this method in production code!
  void testCrash() {
    try {
      _instance.crash();
    } catch (e) {
      debugPrint('CrashlyticsService: Failed to trigger test crash: $e');
    }
  }
}
