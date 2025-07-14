import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shiftapp/extensions/extensions.dart';

import '../../common/components/dialogs_manager.dart';

class PermissionDetector {
  static Future<bool> detectCameraAndStoragePermission(
      BuildContext context) async {

    final isGranted =await  _checkMediaPermissions(context);
      if (isGranted == false) {
        DialogsManager.showConfirmationAnimatedDialog(
          context,
          message:
              context.getStrings().face_recognition_service_permission_message,
          buttonName: context.getStrings().open_app_settings,
          onConfirm: () {
            Navigator.pop(context);
            Geolocator.openAppSettings();
          },
        );
    } else {
      return Future.value(true);
    }
    return Future.value(false);
  }

  static Future<bool?> _checkMediaPermissions(BuildContext context) async {
    if (Platform.isAndroid) {
      Map<Permission, PermissionStatus> statues =
          await [Permission.camera, Permission.photos].request();
      PermissionStatus? statusCamera = statues[Permission.camera];

      PermissionStatus? statusPhotos = statues[Permission.photos];
      bool isGranted = statusCamera == PermissionStatus.granted &&
          statusPhotos == PermissionStatus.granted;
      if (isGranted) {
        return true;
      }
      bool isPermanentlyDenied =
          statusCamera == PermissionStatus.permanentlyDenied ||
              statusPhotos == PermissionStatus.permanentlyDenied;
      if (isPermanentlyDenied) {
        return false;
      }
    } else {
      final statues = await Permission.camera.request();
      print('check ios permissions ${statues.isGranted } , ${statues.isPermanentlyDenied} , ${statues.isDenied}');
      bool isGranted = statues.isGranted;
      if (isGranted) {
        return true;
      }
      bool isPermanentlyDenied = statues.isPermanentlyDenied;
      if (isPermanentlyDenied) {
        return false;
      }
    }
  }
}
