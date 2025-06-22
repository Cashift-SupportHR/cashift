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
