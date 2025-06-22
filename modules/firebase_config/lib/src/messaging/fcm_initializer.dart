import '../config/configuration_provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> initializeFirebase({bool isLive = true}) async {
  final config = ConfigurationProvider(isLive: isLive)
      .platformConfig
      .currentConfig;

  await Firebase.initializeApp(options: config.toFirebaseOptions());
}
