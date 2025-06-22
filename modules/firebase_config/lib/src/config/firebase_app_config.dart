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
