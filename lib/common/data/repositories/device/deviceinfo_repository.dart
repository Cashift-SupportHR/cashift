import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:platform_device_id_plus/platform_device_id.dart';
import 'package:shiftapp/common/domain/entities/shared/device.dart';

@Injectable()
class DeviceInfoRepository{
  static Future<Device> getDevice() async {
    final info = await getDeviceInfo();
    final id = await getDeviceId() ;
    return Device(id,info);
  }
  static Future<String> getDeviceInfo() async {

    String? deviceId = await PlatformDeviceId.getDeviceId;

    if(Platform.isIOS){
      final  device = await PlatformDeviceId.deviceInfoPlugin.iosInfo;
      return ('IOS-${device.model}-${device.systemVersion}-$deviceId');
    }else{
      final  device = await PlatformDeviceId.deviceInfoPlugin.androidInfo;
      return 'ANDROID-${device.model}-${device.brand}-${device.version.sdkInt}-$deviceId';
    }
  }

  static Future<String> getDeviceId() async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    if(Platform.isIOS){
      return ('IOS-$deviceId');
    }else{
      return 'ANDROID-$deviceId';
    }
  }

}