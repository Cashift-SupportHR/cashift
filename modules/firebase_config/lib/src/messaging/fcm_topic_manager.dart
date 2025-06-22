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

    FirebaseMessaging.instance.subscribeToTopic('');
    FirebaseMessaging.instance.unsubscribeFromTopic('');
  }
}
