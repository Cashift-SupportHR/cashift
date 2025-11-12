import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_config/firebase_config.dart';

class FirebaseBootstrapper {
  static Future<FirebaseApp> initFirebase({required String languageCode}) async {
    // 1. Initialize Firebase with env-specific config
    return await initializeFirebase();

    // 2. Local notification setup + onMessage/onMessageOpened
    //await FcmNotificationService.initialize();

    // 3. Register topics (e.g. language/platform)
    //await FcmTopicManager.registerTopics(languageCode);

    // 4. Handle background messages
 //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await initializeFirebase();
    // You can delegate message to FcmNotificationService if needed
  }
}
