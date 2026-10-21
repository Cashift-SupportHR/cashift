import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_config/firebase_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseCrashlytics extends Mock implements FirebaseCrashlytics {}

class FakeFlutterErrorDetails extends Fake implements FlutterErrorDetails {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) => 'FakeFlutterErrorDetails';
}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeFlutterErrorDetails());
  });

  late MockFirebaseCrashlytics mockCrashlytics;
  late CrashlyticsService crashlyticsService;

  setUp(() {
    mockCrashlytics = MockFirebaseCrashlytics();
    crashlyticsService = CrashlyticsService(crashlytics: mockCrashlytics);
  });

  group('CrashlyticsService Tests', () {
    test('init configures collection enabled and error handlers', () async {
      when(() => mockCrashlytics.setCrashlyticsCollectionEnabled(any()))
          .thenAnswer((_) async {});

      await crashlyticsService.init(enableInDev: true);

      verify(() => mockCrashlytics.setCrashlyticsCollectionEnabled(true)).called(1);
      expect(FlutterError.onError, isNotNull);
    });

    test('setCollectionEnabled delegates to FirebaseCrashlytics', () async {
      when(() => mockCrashlytics.setCrashlyticsCollectionEnabled(true))
          .thenAnswer((_) async {});

      await crashlyticsService.setCollectionEnabled(true);

      verify(() => mockCrashlytics.setCrashlyticsCollectionEnabled(true)).called(1);
    });

    test('recordError delegates to FirebaseCrashlytics with correct parameters', () async {
      final exception = Exception('Test exception');
      final stackTrace = StackTrace.current;

      when(() => mockCrashlytics.recordError(
            any(),
            any(),
            reason: any(named: 'reason'),
            information: any(named: 'information'),
            fatal: any(named: 'fatal'),
          )).thenAnswer((_) async {});

      await crashlyticsService.recordError(
        exception,
        stackTrace,
        reason: 'Testing recordError',
        fatal: true,
      );

      verify(() => mockCrashlytics.recordError(
            exception,
            stackTrace,
            reason: 'Testing recordError',
            fatal: true,
          )).called(1);
    });

    test('recordFlutterError non-fatal delegates to recordFlutterError', () async {
      final details = FlutterErrorDetails(exception: Exception('Flutter Error'));

      when(() => mockCrashlytics.recordFlutterError(any()))
          .thenAnswer((_) async {});

      await crashlyticsService.recordFlutterError(details, fatal: false);

      verify(() => mockCrashlytics.recordFlutterError(details)).called(1);
    });

    test('recordFlutterError fatal delegates to recordFlutterFatalError', () async {
      final details = FlutterErrorDetails(exception: Exception('Flutter Fatal Error'));

      when(() => mockCrashlytics.recordFlutterFatalError(any()))
          .thenAnswer((_) async {});

      await crashlyticsService.recordFlutterError(details, fatal: true);

      verify(() => mockCrashlytics.recordFlutterFatalError(details)).called(1);
    });

    test('setUserIdentifier delegates to FirebaseCrashlytics', () async {
      when(() => mockCrashlytics.setUserIdentifier('user_12345'))
          .thenAnswer((_) async {});

      await crashlyticsService.setUserIdentifier('user_12345');

      verify(() => mockCrashlytics.setUserIdentifier('user_12345')).called(1);
    });

    test('setCustomKey delegates to FirebaseCrashlytics', () async {
      when(() => mockCrashlytics.setCustomKey('user_role', 'admin'))
          .thenAnswer((_) async {});

      await crashlyticsService.setCustomKey('user_role', 'admin');

      verify(() => mockCrashlytics.setCustomKey('user_role', 'admin')).called(1);
    });

    test('log delegates message to FirebaseCrashlytics', () async {
      when(() => mockCrashlytics.log('User navigated to profile screen'))
          .thenAnswer((_) async {});

      await crashlyticsService.log('User navigated to profile screen');

      verify(() => mockCrashlytics.log('User navigated to profile screen')).called(1);
    });

    test('testCrash calls crash on FirebaseCrashlytics', () {
      when(() => mockCrashlytics.crash()).thenAnswer((_) {});

      crashlyticsService.testCrash();

      verify(() => mockCrashlytics.crash()).called(1);
    });

    test('gracefully handles exceptions without rethrowing', () async {
      when(() => mockCrashlytics.setUserIdentifier(any()))
          .thenThrow(Exception('Platform error'));

      expect(
        () async => await crashlyticsService.setUserIdentifier('user_error'),
        returnsNormally,
      );
    });
  });
}
