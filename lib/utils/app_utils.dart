import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shiftapp/config.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';
import '../common/domain/entities/shared/date_formatter.dart';
import '../presentation/shared/components/datepicker/package_info.dart';

class AppUtils {
  static Future<String> launchAppLink() async {
    if (Platform.isAndroid) {
      final PackageInfo info = await PackageInfo.fromPlatform();
      final appPackageName = info.packageName;

      try {
        await launch("market://details?id=" + appPackageName);
        return 'launch';
      } on PlatformException {
        await launch(
            "https://play.google.com/store/apps/details?id=" + appPackageName);
        return 'launch';
      } finally {
        await launch(
            "https://play.google.com/store/apps/details?id=" + appPackageName);
      }
    } else {
      print("is ios");
      await StoreRedirect.redirect(iOSAppId: Config.AppStoreId);
      return 'launch';
    }
  }

  static Future<void> openMap(double latitude, double longitude) async {
    String iosUrl = 'https://maps.apple.com/?q=$latitude,$longitude';
    if (GetPlatform.isAndroid) {
      String googleUrl =
          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
      if (await canLaunch(googleUrl)) {
        await launch(googleUrl);
      } else {
        throw 'Could not launch $googleUrl';
      }
    } else {
      if (await canLaunch(iosUrl)) {
        await launch(iosUrl);
      } else {
        throw 'Could not open the map.';
      }
    }
  }

  static String replaceArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }
    print("$input");
    return input;
  }

  static launchMap({String lat = "47.6", String long = "24.3"}) async {
    if (Platform.isIOS) {
      String googleUrl =
          'comgooglemaps-x-callback://?saddr=&daddr=$lat,$long&directionsmode=driving';
      String browserUrl =
          'https://www.google.co.in/maps/dir/?saddr=&daddr=$lat,$long&directionsmode=driving';
      if (await canLaunch("comgooglemaps://")) {
        print('launching com googleUrl');
        await launch(googleUrl);
      } else if (await canLaunch(browserUrl)) {
        print('launching apple url');
        await launch(browserUrl);
      } else {
        throw 'Could not launch url';
      }
    } else {
      var mapSchema = 'geo:$lat,$long ?q=$lat,$long';
      if (await canLaunch(mapSchema)) {
        await launch(mapSchema);
      } else {
        throw 'Could not launch $mapSchema';
      }
    }
  }

  static launchPhone({required String phone}) async {
    if (await canLaunch("tel://$phone")) {
      await launch("tel://$phone");
    } else {
      throw 'Could not call $phone';
    }
  }

  static bool isNetworkError(e) {
    if (e is DioError) {
      if (e.error is SocketException ||
          e.error is WebSocketException ||
          e.error is HandshakeException ||
          e.type == DioExceptionType.connectionTimeout) {
        return true;
      }
    } else if (e is WebSocketException ||
        e is HandshakeException ||
        e is SocketException) {
      return true;
    }
    return false;
  }

  // addopportunityemployee snack bar to show error
  static void showSnackBarError(String error, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(error),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 1),
    ));
  }

  // by Harbey
  static showTimeDayPicker(BuildContext context,
      {required Function(TimeOfDay) onConfirm, TimeOfDay? initialTime}) {
    showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
    ).then((value) {
      if (value != null) {
        onConfirm(value);
      }
    });
  }

  static showImagePicker(BuildContext context,
      {required Function(File) onPicker}) async {
    final picker = ImagePicker();
    XFile? file;
    final data = await showSelectMediaCameraDialog(context, isPdf: false);
    if (data == ImageSource.camera) {
      file = await picker.pickImage(source: ImageSource.camera);
    } else if (data == ImageSource.gallery) {
      file = await picker.pickImage(source: ImageSource.gallery);
    }
    if (file != null) {
      onPicker(File(file.path));
    }
  }

  static showMediaPicker(
    BuildContext context, {
    required Function(File) onPicker,
    bool isPdf = true,
    bool isImage = true,
    bool isCamera = true,
  }) async {

    final picker = ImagePicker();
    XFile? file;
    final data = await showSelectMediaCameraDialog(context,
        isPdf: isPdf, isImage: isImage, isCamera: isCamera);
    if (data == 'pdf') {
      file = await pickPDF();
    } else if (data == ImageSource.camera) {
      file = await picker.pickImage(source: ImageSource.camera);
    } else if (data == ImageSource.gallery) {
      file = await picker.pickImage(source: ImageSource.gallery);
    }
    if (file != null) {
      onPicker(File(file.path));
    }
  }



 static Future<XFile?> pickPDF() async {
    // طلب إذن التخزين
    var status = await Permission.storage.request();
    XFile? file;
    if (status.isGranted) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {

        file = result.xFiles.single;

      }
    } else {
       print("تم رفض الإذن للوصول إلى الملفات");
    }
    return file;
  }

  static showSelectMediaCameraDialog(
    BuildContext context, {
    bool isPdf = true,
    bool isImage = true,
    bool isCamera = true,
  }) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (isCamera)
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: Text(context.getStrings().camera),
                  onTap: () {
                    Navigator.pop(context, ImageSource.camera);
                  },
                ),
              if (isImage)
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: Text(context.getStrings().gallery),
                  onTap: () {
                    Navigator.pop(context, ImageSource.gallery);
                  },
                ),
              if (isPdf)
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: Text(context.getStrings().pdf),
                  onTap: () {
                    Navigator.pop(context, 'pdf');
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  static showMultiImagesPicker(BuildContext context,
      {required Function(List<File>) onPicker}) {
    final picker = ImagePicker();
    picker.pickMultiImage().then((value) {
      onPicker(value.map((e) => File(e.path)).toList());
    });
  }

  static showMultiMediaPicker(BuildContext context,
      {required Function(List<File>) onPicker}) {
    final picker = ImagePicker();
    picker.pickMultipleMedia().then((value) {
      onPicker(value.map((e) => File(e.path)).toList());
    });
  }

  static showDateTimePicker(BuildContext context,
      {required Function(DateTime) onConfirm, DateTime? initialDate, DateTime? firstDate}) {
    showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2015, 8),
      lastDate: DateTime(2101),
    ).then((value) {
      if (value != null) {
        onConfirm(value);
      }
    });
  }
}

String getCurrentDate() {
  /* final hDate = HijriCalendar.now();
    return hDate.toFormat('${hDate.dayWeName} , dd MMMM  yyyy هـ');*/
  final now = DateTime.now();
  return DateFormatter.formatDate(now, DateFormatter.DATE_UI);
}
