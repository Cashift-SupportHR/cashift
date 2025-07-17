import 'dart:io';

import '../config/configuration_provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<FirebaseApp> initializeFirebase({bool isLive = true}) async {
  final config = ConfigurationProvider(isLive: isLive)
      .platformConfig
      .currentConfig;

    return await Firebase.initializeApp(name:Platform.isIOS ? 'doubleshift':null ,options: config.toFirebaseOptions());
}
