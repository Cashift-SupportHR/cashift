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
