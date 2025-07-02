import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shiftapp/core/extensions/extensions.dart';

import '../../presentation/shared/components/dialogs_manager.dart';

class PermissionDetector {
  static Future<bool> detectCameraAndStoragePermission(
      BuildContext context) async {
    final isGranted = await _checkMediaPermissions(context);

    if (!isGranted) {
      DialogsManager.showConfirmationAnimatedDialog(
        context,
        message: context.getStrings().face_recognition_service_permission_message,
        buttonName: context.getStrings().open_app_settings,
        onConfirm: () {
          Navigator.pop(context);
          openAppSettings(); // from permission_handler
        },
      );
      return false;
    }

    return true;
  }

  static Future<bool> _checkMediaPermissions(BuildContext context) async {
    if (Platform.isAndroid) {
      final statuses = await [Permission.camera, Permission.photos].request();

      final isGranted = statuses[Permission.camera] == PermissionStatus.granted &&
          statuses[Permission.photos] == PermissionStatus.granted;

      final isPermanentlyDenied = statuses[Permission.camera] == PermissionStatus.permanentlyDenied ||
          statuses[Permission.photos] == PermissionStatus.permanentlyDenied;

      if (isGranted) return true;
      if (isPermanentlyDenied) return false;

      return false; // for temporarily denied
    } else {
      final status = await Permission.camera.request();

      if (status.isGranted) return true;
      if (status.isPermanentlyDenied) return false;

      return false; // temporarily denied or restricted
    }
  }

}
