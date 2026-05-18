import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftapp/data/repositories/device/deviceinfo_repository.dart';

import '../../../data/repositories/auth_session/auth_session_manager.dart';
import '../../../data/repositories/local/local_repository.dart';
import '../../../data/repositories/logger/logger_repository.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../domain/entities/shared/device.dart';

@module
abstract class InjectionModule {

//injecting third party libraries
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  @preResolve
  Future<Device> get deviceInfo =>  DeviceInfoRepository.getDevice();
/*
final remoteModule = Module()
  ..factory((scope) {
    return HeaderInterceptor(
        scope.get<UserRepository>(), scope.get<LocalRepository>(),
        isRequiredAuth: true,
        device: scope.get(StringQualifier(DIConstants.DEVICE_INFO_KEY)));
  })



  ..factory((scope) {
    return HeaderInterceptor(
        scope.get<UserRepository>(), scope.get<LocalRepository>(),
        isRequiredAuth: false,
        device: scope.get(StringQualifier(DIConstants.DEVICE_INFO_KEY)));
  }, qualifier: StringQualifier(LoginInterceptorQualifier))
  ..factory((scope) {
    return ClientCreator(interceptor: scope.get<HeaderInterceptor>());
  })*/
}