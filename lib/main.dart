import 'dart:convert';
import 'dart:io';
import 'package:device_preview_plus/device_preview_plus.dart' as device_preview;
import 'package:firebase_config/firebase_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:shiftapp/data/datasources/remote/base_client.dart';
import 'package:shiftapp/data/repositories/local/local_repository.dart';
import 'package:shiftapp/domain/entities/shared/notification_types.dart';
import 'package:shiftapp/presentation/adminFeatures/di/injector.dart';
import 'package:shiftapp/presentation/presentationUser/activity_log/pages/activitylog_tabs_page.dart';
import 'package:shiftapp/presentation/presentationUser/profile/view/bloc/profile_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/shared/check_face_recognation/cubit/check_face_recognation_cubit.dart';
import 'package:shiftapp/presentation/shared/components/adminToggle/cubit/admin_toggle_cubit.dart';
import 'package:shiftapp/presentation/shared/components/restart_app_widget.dart';
import 'package:sizer/sizer.dart';
import 'core/services/firebase_notification.dart';
import 'core/services/material_app_config.dart';
import 'core/services/routes.dart';
import 'data/datasources/remote/logger/app_loogers.dart';
import 'data/models/notification_offers/notification_offer_params.dart';
import 'data/repositories/profile/profile_repository.dart';
import 'data/repositories/resume/resume_repository.dart';
import 'data/repositories/user/user_repository.dart';
import 'package:camera/camera.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


   await FirebaseBootstrapper.initFirebase(languageCode: '');
   await FirebaseNotifications.firebaseInitNotifications();
  ChuckerFlutter.showOnRelease = true;
  AppLoggers.setupLogger();
  await configureDependencies();
  // Get the available cameras
  // await availableCameras();

  getIt.registerSingleton(HeaderInterceptor(
    getIt.get<UserRepository>(),
    getIt.get<LocalRepository>(),
    device: getIt.get(),
    loggerRepository: getIt.get(),
    isRequiredAuth: true,
  ));
  getIt.registerSingleton(ClientCreator(
      interceptor: HeaderInterceptor(
    getIt.get<UserRepository>(),
    getIt.get<LocalRepository>(),
    device: getIt.get(),
    loggerRepository: getIt.get(),
    isRequiredAuth: true,
  )).create());



  getIt.registerSingleton(AdminToggleCubit(
    getIt.get<ProfileRepository>(), getIt.get<UserRepository>(),getIt.get<ProfileRepository>()
  ));
  getIt.registerSingleton(CheckFaceRecogenationCubit(
    getIt.get<ProfileRepository>(), getIt.get<UserRepository>(),
    getIt.get<ResumeRepository>(),
  ));

  HttpOverrides.global = MyHttpOverrides();

  runApp(const RestartWidget(child: MyApp()));

  // runApp(device_preview.DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => const RestartWidget(child: MyApp()), // Wrap your app
  // ));
  runApp(const RestartWidget(child: MyApp()));
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localRepo = getIt.get<LocalRepository>();
    try {
      FirebaseNotifications.initFcm(context, localRepo.getLocal());
    } catch (e) {}
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kAppBarColor, //or set color with: Color(0xFF0000FF)
      statusBarIconBrightness: Brightness.dark,
    ));
    return BlocProvider(
      create: (c) {
        return ProfileCubit(getIt.get(), getIt.get(), getIt.get());
      },
      child: Sizer(
        builder: (BuildContext context, Orientation orientation,
             deviceType) {
          return GetMaterialApp(
            navigatorObservers: [ChuckerFlutter.navigatorObserver],
            theme: MaterialAppConfig().theme,
            navigatorKey: navigatorKey,
            locale: Locale(localRepo.getLocal()),
            localizationsDelegates: MaterialAppConfig().localizationsDelegates,
            supportedLocales: const [
              Locale('en', ''), // English, no country code
              Locale('ar', ''), // Arabic, no country code
            ],
            routes: Routes.routes,
            initialRoute: Routes.splash,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

Future onSelectNotification(payload,BuildContext context) async {
  try {
    Map valueMap = json.decode(payload);

    print('onSelectNotification ${valueMap}');
    final type = valueMap.containsKey('notificationType')
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
          map.map((key, value) => MapEntry(key.toString(), value)));
      Navigator.pushNamed(context, Routes.notificationOffers,
          arguments: params);
    }
    if (type == NotificationTypes.Violations) {
      Navigator.pushNamed(context, Routes.violations);
    }
    if (type.toString().startsWith('/')) {
      Navigator.pushNamed(context, type.toString());
    }
  } catch (e) {
    print('${e}');
  }
}
