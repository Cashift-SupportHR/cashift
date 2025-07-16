import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shiftapp/extensions/extensions.dart';

import '../../presentation/shared/components/dialogs_manager.dart';

class PermissionDetector {
  static Future<bool> detectCameraAndStoragePermission(
    BuildContext context,
  ) async {
    final isGranted = await _checkMediaPermissions(context);

    if (!isGranted) {
      DialogsManager.showConfirmationAnimatedDialog(
        context,
        message:
            context.getStrings().face_recognition_service_permission_message,
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

      final status = await Permission.camera.request();
      if (status.isGranted) return true;
      if (status.isPermanentlyDenied) return false;
      return false; // temporarily denied or restricted

  }
}
