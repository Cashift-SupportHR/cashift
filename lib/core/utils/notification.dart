
const CONFIRM_CHANNEL_KEY = "confirmation_shift";
const MESSAGE_CHANNEL_KEY = "cashift_message";
const CONFIRM_GROUP_KEY = "confirmation_shift_group";
const MESSAGE_GROUP_KEY = "message_shift_group";
const KEY_CONFIRM_BUTTON ='confirm_button';
const KEY_REJECT_BUTTON = 'reject_button' ;



/*

requestNotificationPermission() {
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      // Insert here your friendly dialog box before call the request method
      // This is very important to not harm the user experience
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
}

initAwesNotif(KoinApplication koin) {
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      'resource://drawable/logo',
      [
        NotificationChannel(
          channelKey: CONFIRM_CHANNEL_KEY,
          channelName: 'confirmation notifications',
          channelDescription: 'Notification channel for confirmations ',
          ledColor: Colors.white,
          channelShowBadge: true,
          groupKey: CONFIRM_GROUP_KEY,
          groupSort: aw.GroupSort.Asc,
          groupAlertBehavior: aw.GroupAlertBehavior.Children,
          importance: NotificationImportance.High,
        ),
        NotificationChannel(
          channelKey: MESSAGE_CHANNEL_KEY,
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic messages',
          ledColor: Colors.white,
          channelShowBadge: true,
          groupKey: MESSAGE_GROUP_KEY,
          groupSort: aw.GroupSort.Asc,
          groupAlertBehavior: aw.GroupAlertBehavior.Children,
          importance: NotificationImportance.High,
        )
      ]);

  AwesomeNotifications().actionStream.listen((receivedNotification) async {
    print('on CLICK NOTIFICATION ${receivedNotification.channelKey} , ${receivedNotification.buttonKeyPressed}');

    if(receivedNotification.channelKey==CONFIRM_CHANNEL_KEY) {

      final data = Map<String, dynamic>.from(receivedNotification.payload!);
      print('on CLICK NOTIFICATION confirmation ${receivedNotification.payload}');

      final notificationItem = NotificationItem.fromJson(data);
      print('on CLICK NOTIFICATION confirmation ${notificationItem.notificationType} , button ${receivedNotification.buttonKeyPressed}');

      if (notificationItem.notificationType == NotificationTypes.CONFIRMATION) {

        if(receivedNotification.buttonKeyPressed==KEY_CONFIRM_BUTTON) {
          responseToNotification(notificationItem, ConfirmActivityStatus.Approve, koin.koin);
        }
        else if(receivedNotification.buttonKeyPressed==KEY_REJECT_BUTTON){
          responseToNotification(notificationItem, ConfirmActivityStatus.Reject, koin.koin);
        }else{
          Navigator.pushNamed(Get.context!, ActivityLogPage.routeName);
        }

      }

    }

  });
}

Future<void> responseToNotification(NotificationItem notificationItem ,int status,Koin koin) async {
  ActivityLogRepository repository  = koin.get<ActivityLogRepository>();

  try{
    final resposne = await  repository.confirmActivity(ConfirmActivityParams(id: notificationItem.id,statusId:status ));
    showNotificationMessage('Confirmation Response ', resposne);
  }catch(ex){
    showNotificationMessage('Confirmation Error ', ErrorPlaceHolderWidget.handleError(Get.context!, ex));
  }

}

void showNotificationWithData(RemoteMessage message) {
  print('showAWNotification => ${message.data}');
  final notificationItem  = NotificationItem.fromJson(message.data);
  final map  = Map<String,String>.from(message.data);

  AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: Random().nextInt(100),
        channelKey: CONFIRM_CHANNEL_KEY,
        title: notificationItem.title,
        body: notificationItem.message,
        summary: notificationItem.message ,
        groupKey: CONFIRM_GROUP_KEY,
        displayOnForeground: true,
        payload: map,
        showWhen: true,
        autoDismissible: true,
        displayOnBackground: true,
      ),
      actionButtons: [
        NotificationActionButton(
          key: KEY_CONFIRM_BUTTON,
          label: 'Confirm',
          color: Colors.green,
          buttonType: ActionButtonType.KeepOnTop,
        ),
        NotificationActionButton(
          key: KEY_REJECT_BUTTON,
          label: 'Reject',
          color : Colors.blueGrey,
          buttonType: ActionButtonType.KeepOnTop,
        )
      ]);
}

void showNotificationObject(NotificationItem notificationItem){
  final map  = Map<String,String>.from(notificationItem.toJson());

  AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: Random().nextInt(100),
        channelKey: CONFIRM_CHANNEL_KEY,
        title: notificationItem.title,
        body: notificationItem.message,
        summary: notificationItem.message ,
        payload: map,
        groupKey: CONFIRM_GROUP_KEY,
        displayOnForeground: true,
        showWhen: true,
        autoDismissible: true,
        displayOnBackground: true,
      ),
      actionButtons: [
        NotificationActionButton(
          key: KEY_CONFIRM_BUTTON,
          label: 'Confirm',
          color: Colors.green,
          buttonType: ActionButtonType.KeepOnTop,
        ),
        NotificationActionButton(
          key: KEY_REJECT_BUTTON,
          label: 'Reject',
          color : Colors.blueGrey,
          buttonType: ActionButtonType.KeepOnTop,
        )
      ]);

}
void showNotificationMessage (String title , String message ){
  AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: Random().nextInt(100),
        channelKey: MESSAGE_CHANNEL_KEY,
        title: title,
        body: message,
        groupKey: MESSAGE_GROUP_KEY,
        displayOnForeground: true,
        showWhen: true,
        autoDismissible: true,
        displayOnBackground: true,
      ),);
}


Future<void> kFirebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

kInitMessagingHandler(KoinApplication koin) async {
  initAwesNotif(koin);
  if (!kIsWeb) {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}

void notificationClickEvents(BuildContext context , Map<String,dynamic> data){
  try{
    final notificationItem = NotificationItem.fromJson(data);
    if (notificationItem.notificationType == NotificationTypes.CONFIRMATION) {
      Navigator.pushNamed(Get.context!, ActivityLogPage.routeName);
    }
  }catch(e){}
}

Future<void> kInitMessageNotifier(BuildContext context, String local) async {
  FirebaseMessaging.instance
      .getInitialMessage()
      .then((value) {
        if(value!=null) {
          print('ON MESSAGES FCM ALL${value.notification}');
          if (value.data.isNotEmpty) {
            print('ON MESSAGES FCM Init ${value.data}');
            notificationClickEvents(context, value.data);
          } else {

          }
        }
      });

  if (kIsWeb) {
  } else if (Platform.isAndroid) {
    FirebaseMessaging.instance.subscribeToTopic('allandroid');
    FirebaseMessaging.instance.setAutoInitEnabled(true);
    FirebaseMessaging.instance
        .subscribeToTopic('all')
        .then((value) => print('SUBSCRUB DONE SUBSCRUB'), onError: (e) {
      print('SUBSCRUB ON ERROR SUBSCRIP ${e.toString()}');
    });
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
    FirebaseMessaging.instance.subscribeToTopic('allios');
    FirebaseMessaging.instance.setAutoInitEnabled(true);
    FirebaseMessaging.instance
        .subscribeToTopic('all')
        .then((value) => print('SUBSCRUB DONE SUBSCRUB'), onError: (e) {
      print('SUBSCRUB ON ERROR SUBSCRIP ${e.toString()}');
    });
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
  }
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    print('ON MESSAGES FCM ${message.notification?.body.toString()} , data ${message.data.toString()} => ${message.messageId}');

    if (message.data.isNotEmpty) {
      showNotificationWithData(message);
    }else if (notification !=null ){
      showNotificationMessage(notification.title!, notification.body!);
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('A new onMessageOpenedApp event was published! ${message.data}');
    //containsKey('type')?message.data['type']:''
    String valueMap = json.encode(message.data);

    onSelectNotification(valueMap);
  });
}

Future onSelectNotification(payload) async{
print('onSelectNotification ${payload}');
 Map valueMap = json.decode(payload);

  print('onSelectNotification ${valueMap}');


    final type = valueMap.containsKey('type') ? valueMap['type']:'';
    final referenceId = valueMap.containsKey('referenceId') ? valueMap['referenceId']:'';
    //containsKey('type')?message.data['type']:''

    if(type==NotificationsTypes.UpdateAppVersion)
      AppUtils.launchAppLink();
    else if (type==NotificationsTypes.Monthly){
      Navigator.pushNamed(Get.context!, BookingOfferScreen.routeName,arguments: BookingOfferModel(offerId:referenceId ));
    }

}

*/
