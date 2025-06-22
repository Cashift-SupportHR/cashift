#!/bin/bash

MODULE_PATH="modules/firebase_config"
SRC_PATH="$MODULE_PATH/lib/src"

echo "📦 Creating Firebase Config module at $MODULE_PATH"

# Create directory structure
mkdir -p "$SRC_PATH/config"
mkdir -p "$SRC_PATH/messaging"
mkdir -p "$SRC_PATH/bootstrap"

# pubspec.yaml
cat > "$MODULE_PATH/pubspec.yaml" <<EOL
name: firebase_config
description: "Shared Firebase & Messaging config module"
version: 0.0.1
publish_to: none

environment:
  sdk: ">=3.0.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.24.2
  firebase_messaging: ^14.7.5
  flutter_local_notifications: ^16.3.1
  core:
    path: ../core
EOL

#!/bin/bash


echo "📦 Creating Firebase constants and configuration classes..."

# AppConstants
cat > "$SRC_PATH/bootstrap/firebase_bootstrapper.dart" <<EOF
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_config/firebase_config.dart';

class FirebaseBootstrapper {
  static Future<void> init({required String languageCode}) async {
    // 1. Initialize Firebase with env-specific config
    await initializeFirebase();

    // 2. Local notification setup + onMessage/onMessageOpened
    await FcmNotificationService.initialize();

    // 3. Register topics (e.g. language/platform)
    await FcmTopicManager.registerTopics(languageCode);

    // 4. Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await initializeFirebase();
    // You can delegate message to FcmNotificationService if needed
  }
}
EOF

# AppConstants
cat > "$SRC_PATH/config/app_constants.dart" <<EOF
class AppConstants {
  // Firebase API Keys
  static const String firebaseAndroidLiveAPIKey = "";
  static const String firebaseIOSLiveAPIKey = "";

  static const String firebaseAndroidTestAPIKey = "";
  static const String firebaseIOSTestAPIKey = "";

  // Firebase App IDs
  static const String androidLiveAppId = "";
  static const String iosLiveAppId = "";

  static const String androidTestAppId = "";
  static const String iosTestAppId = "";

  // Firebase Project ID
  static const String liveProjectId = "";
  static const String testProjectId = "";

  // FCM Sender ID
  static const String liveFcmSenderId = "";
  static const String testFcmSenderId = "";

  static const String supportPhoneNumber = "";
}
EOF

# FirebaseAppConfig
cat > "$SRC_PATH/config/firebase_app_config.dart" <<EOF
import 'package:firebase_core/firebase_core.dart';

class FirebaseAppConfig {
  final String apiKey;
  final String appId;
  final String projectId;
  final String fcmSenderId;

  const FirebaseAppConfig({
    required this.apiKey,
    required this.appId,
    required this.projectId,
    required this.fcmSenderId,
  });

  FirebaseOptions toFirebaseOptions() {
    return FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      projectId: projectId,
      messagingSenderId: fcmSenderId,
    );
  }
}
EOF

# PlatformConfig
cat > "$SRC_PATH/config/platform_config.dart" <<EOF
import 'dart:io';
import 'firebase_app_config.dart';

class PlatformConfig {
  final FirebaseAppConfig iosConfig;
  final FirebaseAppConfig androidConfig;

  const PlatformConfig({
    required this.iosConfig,
    required this.androidConfig,
  });

  FirebaseAppConfig get currentConfig {
    if (Platform.isIOS) return iosConfig;
    if (Platform.isAndroid) return androidConfig;
    throw UnsupportedError("Unsupported platform");
  }
}
EOF

# ConfigurationProvider
cat > "$SRC_PATH/config/configuration_provider.dart" <<EOF
import 'app_constants.dart';
import 'platform_config.dart';
import 'firebase_app_config.dart';

class ConfigurationProvider {
  final bool isLive;

  ConfigurationProvider({required this.isLive});

  PlatformConfig get platformConfig => isLive ? liveConfig : testConfig;

  final PlatformConfig liveConfig = const PlatformConfig(
    iosConfig: FirebaseAppConfig(
      apiKey: AppConstants.firebaseIOSLiveAPIKey,
      appId: AppConstants.iosLiveAppId,
      projectId: AppConstants.liveProjectId,
      fcmSenderId: AppConstants.liveFcmSenderId,
    ),
    androidConfig: FirebaseAppConfig(
      apiKey: AppConstants.firebaseAndroidLiveAPIKey,
      appId: AppConstants.androidLiveAppId,
      projectId: AppConstants.liveProjectId,
      fcmSenderId: AppConstants.liveFcmSenderId,
    ),
  );

  final PlatformConfig testConfig = PlatformConfig(
    iosConfig: FirebaseAppConfig(
      apiKey: AppConstants.firebaseIOSTestAPIKey,
      appId: AppConstants.iosTestAppId,
      projectId: AppConstants.testProjectId,
      fcmSenderId: AppConstants.testFcmSenderId,
    ),
    androidConfig: FirebaseAppConfig(
      apiKey: AppConstants.firebaseAndroidTestAPIKey,
      appId: AppConstants.androidTestAppId,
      projectId: AppConstants.testProjectId,
      fcmSenderId: AppConstants.testFcmSenderId,
    ),
  );
}EOF


# firebase_app_config.dart
cat > "$SRC_PATH/config/firebase_app_config.dart" <<EOF
import 'package:firebase_core/firebase_core.dart';

class FirebaseAppConfig {
  final String apiKey;
  final String appId;
  final String projectId;
  final String fcmSenderId;

  const FirebaseAppConfig({
    required this.apiKey,
    required this.appId,
    required this.projectId,
    required this.fcmSenderId,
  });

  FirebaseOptions toFirebaseOptions() {
    return FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      projectId: projectId,
      messagingSenderId: fcmSenderId,
    );
  }
}
EOF

# platform_config.dart
cat > "$SRC_PATH/config/platform_config.dart" <<EOF
import 'dart:io';
import 'firebase_app_config.dart';

class PlatformConfig {
  final FirebaseAppConfig iosConfig;
  final FirebaseAppConfig androidConfig;

  const PlatformConfig({
    required this.iosConfig,
    required this.androidConfig,
  });

  FirebaseAppConfig get currentConfig {
    if (Platform.isIOS) return iosConfig;
    if (Platform.isAndroid) return androidConfig;
    throw UnsupportedError("Unsupported platform");
  }
}
EOF

# configuration_provider.dart
cat > "$SRC_PATH/config/configuration_provider.dart" <<EOF
import 'platform_config.dart';
import 'firebase_app_config.dart';
import 'app_constants.dart';

class ConfigurationProvider {
  final bool isLive;

  ConfigurationProvider({required this.isLive});

  PlatformConfig get platformConfig => isLive ? liveConfig : testConfig;

  final PlatformConfig liveConfig = PlatformConfig(
    iosConfig: FirebaseAppConfig(
      apiKey: AppConstants.firebaseIOSLiveAPIKey,
      appId: AppConstants.iosLiveAppId,
      projectId: AppConstants.liveProjectId,
      fcmSenderId: AppConstants.liveFcmSenderId,
    ),
    androidConfig: FirebaseAppConfig(
      apiKey: AppConstants.firebaseAndroidLiveAPIKey,
      appId: AppConstants.androidLiveAppId,
      projectId: AppConstants.liveProjectId,
      fcmSenderId: AppConstants.liveFcmSenderId,
    ),
  );

  final PlatformConfig testConfig = PlatformConfig(
    iosConfig: FirebaseAppConfig(
      apiKey: AppConstants.firebaseIOSTestAPIKey,
      appId: AppConstants.iosTestAppId,
      projectId: AppConstants.testProjectId,
      fcmSenderId: AppConstants.testFcmSenderId,
    ),
    androidConfig: FirebaseAppConfig(
      apiKey: AppConstants.firebaseAndroidTestAPIKey,
      appId: AppConstants.androidTestAppId,
      projectId: AppConstants.testProjectId,
      fcmSenderId: AppConstants.testFcmSenderId,
    ),
  );
}
EOF

# fcm_initializer.dart
cat > "$SRC_PATH/messaging/fcm_initializer.dart" <<EOF
import '../config/configuration_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:core/core.dart';

Future<void> initializeFirebase() async {
  final config = ConfigurationProvider(isLive: AppConfig.env == AppEnvironment.production)
      .platformConfig
      .currentConfig;

  await Firebase.initializeApp(options: config.toFirebaseOptions());
}
EOF

# fcm_notification_service.dart
cat > "$SRC_PATH/messaging/fcm_notification_service.dart" <<EOF
import 'dart:convert';
import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FcmNotificationService {
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'default_channel',
    'Default Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  static Future<void> initialize() async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: handleNotificationTap,
    );

    if (Platform.isAndroid) {
      await _localNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(_channel);
    }

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen(_onMessageReceived);
    FirebaseMessaging.onMessageOpenedApp.listen(_onNotificationTap);
  }

  static void _onMessageReceived(RemoteMessage message) {
    final notification = message.notification;
    final data = message.data;
    if (notification != null) {
      _localNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _channel.id,
            _channel.name,
            channelDescription: _channel.description,
            importance: Importance.max,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
            playSound: true,
          ),
        ),
        payload: json.encode(data),
      );
    }
  }

  static void _onNotificationTap(RemoteMessage message) {
    handleNotificationTap(NotificationResponse(payload: json.encode(message.data)));
  }

  static void handleNotificationTap(NotificationResponse response) {
    if (response.payload == null) return;
    final data = json.decode(response.payload!);
    // TODO: handle navigation based on 'type', 'referenceId', etc.
  }
}
EOF

# fcm_topic_manager.dart
cat > "$SRC_PATH/messaging/fcm_topic_manager.dart" <<EOF
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

class FcmTopicManager {
  static Future<void> registerTopics(String languageCode) async {
    await FirebaseMessaging.instance.subscribeToTopic('all');

    if (Platform.isAndroid) {
      await FirebaseMessaging.instance.subscribeToTopic('allandroid');
      _handleLanguage(languageCode, 'android');
    } else if (Platform.isIOS) {
      await FirebaseMessaging.instance.subscribeToTopic('allios');
      _handleLanguage(languageCode, 'ios');
    }
  }

  static void _handleLanguage(String lang, String platform) {
    final isEnglish = lang == 'en';
    final current = isEnglish ? 'english' : 'arabic';
    final opposite = isEnglish ? 'arabic' : 'english';

    FirebaseMessaging.instance.subscribeToTopic(current);
    FirebaseMessaging.instance.unsubscribeFromTopic(opposite);

    FirebaseMessaging.instance.subscribeToTopic('$current$platform');
    FirebaseMessaging.instance.unsubscribeFromTopic('$opposite$platform');
  }
}
EOF

# fcm_topic_manager.dart
cat > "$SRC_PATH/bootstrap/firebase_bootstrapper.dart" <<EOF
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_config/firebase_config.dart';

class FirebaseBootstrapper {
  static Future<void> init({required String languageCode}) async {
    // 1. Initialize Firebase with env-specific config
    await initializeFirebase();

    // 2. Local notification setup + onMessage/onMessageOpened
    await FcmNotificationService.initialize();

    // 3. Register topics (e.g. language/platform)
    await FcmTopicManager.registerTopics(languageCode);

    // 4. Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await initializeFirebase();
    // You can delegate message to FcmNotificationService if needed
  }
}
EOF

# firebase_config.dart export file
cat > "$MODULE_PATH/lib/firebase_config.dart" <<EOF
export 'src/config/firebase_app_config.dart';
export 'src/config/platform_config.dart';
export 'src/config/configuration_provider.dart';
export 'src/messaging/fcm_initializer.dart';
export 'src/messaging/fcm_notification_service.dart';
export 'src/messaging/fcm_topic_manager.dart';
export 'src/bootstrap/firebase_bootstrapper.dart';

EOF


echo "✅ Firebase Config module created successfully with notification support."
#chmod +x scripts/create_firebase.sh
# ./scripts/create_firebase.sh
