import 'dart:convert';
import 'dart:io';

import 'package:firebase_config/firebase_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shiftapp/core/services/routes.dart';

import '../../data/models/notification_offers/notification_offer_params.dart';
import '../../domain/entities/shared/notification_types.dart';
import '../../utils/notification.dart';

/// Create a [AndroidNotificationChannel] for heads up notifications
AndroidNotificationChannel? channel;

FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

class FirebaseNotifications {
  static firebaseInitNotifications() async {
    // Set the background messaging handler early on, as a named top-level function
    FirebaseMessaging.onBackgroundMessage(
      FirebaseNotifications.firebaseMessagingBackgroundHandler,
    );

    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        MESSAGE_CHANNEL_KEY, // id
        'High Importance Notifications', // title
        description: 'This channel is used for important notifications.',
        // description
        importance: Importance.high,
        enableVibration: true,
        enableLights: true,
        playSound: true,
        showBadge: true,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      var initializationSettingsAndroid = const AndroidInitializationSettings(
        'drawable/ic_cashift',
      );

      final DarwinInitializationSettings initializationSettingsIOS =
          const DarwinInitializationSettings(
            requestSoundPermission: false,
            requestBadgePermission: false,
            requestAlertPermission: false,
            // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
          );
      final InitializationSettings initializationSettings =
          InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
          );

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      if (Platform.isAndroid) {
        await flutterLocalNotificationsPlugin!
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >()
            ?.createNotificationChannel(channel!);
      } else if (Platform.isIOS) {
        await flutterLocalNotificationsPlugin!
            .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin
            >()
            ?.requestPermissions(alert: true, badge: true, sound: true);
      }

      await flutterLocalNotificationsPlugin!.initialize(
        initializationSettings,
        // onSelectNotification: onSelectNotification,
        onDidReceiveNotificationResponse: onSelectNotification,
        onDidReceiveBackgroundNotificationResponse: onSelectNotification,
      );
      print('before setForegroundNotificationPresentationOptions  ${Firebase.apps.first.name}');

      /// Update the iOS foreground notification presentationUser options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
            alert: true,
            badge: true,
            sound: true,
          );
    }
  }

  static Future onSelectNotification(payload) async {
    try {
      Map valueMap = json.decode(payload);

      print('onSelectNotification ${valueMap}');
      final type =
          valueMap.containsKey('notificationType')
              ? valueMap['notificationType']
              : '';

      if (type == NotificationTypes.CONFIRMATION) {
        Navigator.pushNamed(Get.context!, Routes.activitylog);
      }
      if (type == NotificationTypes.OFFERS) {
        final offersParamsMap = valueMap['objects'];
        Map map = json.decode(offersParamsMap);
        print('ONOFFERS ${map}');
        final params = NotificationOfferParams.fromJson(
          map.map((key, value) => MapEntry(key.toString(), value)),
        );
        Navigator.pushNamed(
          Get.context!,
          Routes.notificationOffers,
          arguments: params,
        );
      }
      if (type == NotificationTypes.Violations) {
        Navigator.pushNamed(Get.context!, Routes.violations);
      }
      if (type.toString().startsWith('/')) {
        Navigator.pushNamed(Get.context!, type.toString());
      }
    } catch (e) {
      print('${e}');
    }
  }

  static Future<dynamic> onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async
  {
    try {
      String valueMap = json.encode(payload);

      flutterLocalNotificationsPlugin!.show(
        id,
        'From Did : ' + title.toString(),
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel!.id,
            channel!.name,
            channelDescription: channel!.description,
            subText: title,
            usesChronometer: true,
            channelShowBadge: true,
            largeIcon: const DrawableResourceAndroidBitmap('cashift_logo'),
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        payload: valueMap,
      );
    } catch (e, s) {
      print('onDidReceiveLocalNotification catch' + s.toString());
    }
  }

  static Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    FirebaseBootstrapper.initFirebase(languageCode: '');
    print('Handling a background message ${message.messageId}');
  }

  static Future<void> initFcm(BuildContext context, String local) async {
    if (kIsWeb) {
    } else if (Platform.isAndroid) {
      FirebaseMessaging.instance.subscribeToTopic('allandroid');
      FirebaseMessaging.instance.setAutoInitEnabled(true);
      FirebaseMessaging.instance.subscribeToTopic('all');
      if (local == 'en') {
        FirebaseMessaging.instance.subscribeToTopic("english");
        FirebaseMessaging.instance.unsubscribeFromTopic("arabic");

        FirebaseMessaging.instance.subscribeToTopic("englishandroid");
        FirebaseMessaging.instance.unsubscribeFromTopic("arabicandroid");
      } else {
        FirebaseMessaging.instance.subscribeToTopic("arabic");
        FirebaseMessaging.instance.unsubscribeFromTopic("english");

        FirebaseMessaging.instance.subscribeToTopic("arabicios");
        FirebaseMessaging.instance.unsubscribeFromTopic("englishandroid");
      }
    } else if (Platform.isIOS) {
      // iOS-specific code
      FirebaseMessaging.instance.setAutoInitEnabled(true);

      if (local == 'en') {
        FirebaseMessaging.instance.subscribeToTopic("english");
        FirebaseMessaging.instance.unsubscribeFromTopic("arabic");

        FirebaseMessaging.instance.subscribeToTopic("englishios");
        FirebaseMessaging.instance.unsubscribeFromTopic("arabicios");
      } else {
        FirebaseMessaging.instance.subscribeToTopic("arabic");
        FirebaseMessaging.instance.unsubscribeFromTopic("english");

        FirebaseMessaging.instance.subscribeToTopic("arabicios");
        FirebaseMessaging.instance.unsubscribeFromTopic("englishios");
      }
      FirebaseMessaging.instance.subscribeToTopic('allios');
      FirebaseMessaging.instance.subscribeToTopic('all');
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      if (notification != null && Platform.isAndroid) {
        String valueMap = message.data != null ? json.encode(message.data) : '';

        print('RemoteNotification ${notification.body} , ${message.data}');
        flutterLocalNotificationsPlugin!.show(
          notification.hashCode,
          notification.title.toString(),
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel!.id,
              channel!.name,
              channelDescription: channel!.description,
              subText: notification.title,
              usesChronometer: true,
              channelShowBadge: true,
              largeIcon: const DrawableResourceAndroidBitmap('cashift_logo'),
              importance: Importance.max,
              priority: Priority.high,
              //    ongoing: true,
              styleInformation: BigTextStyleInformation(
                notification.body.toString(),
              ),
            ),
          ),
          payload: valueMap,
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published! ${message.data}');
      //containsKey('type')?message.data['type']:''
      try {
        String valueMap = json.encode(message.data);
        onSelectNotification(valueMap);
      } catch (e) {}
    });
  }
}
