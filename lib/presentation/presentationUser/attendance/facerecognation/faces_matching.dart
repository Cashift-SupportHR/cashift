import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_face_api/flutter_face_api.dart';
import 'package:m7_livelyness_detection/index.dart';
import 'package:shiftapp/extensions/extensions.dart';

import '../../../../core/services/permission_detector.dart';
import '../../../../data/models/attendance/attendance_config_dto.dart';
import '../../../shared/components/dialogs_manager.dart';
import 'face_matching_result.dart';

class FaceMatchingUtils {
  static MatchFacesImage convertImageFileToMatchable(Uint8List imageUint,
      ImageType type) {
    final matchImg = MatchFacesImage(imageUint, type);
    return matchImg;
  }

  static Uint8List base64ToUint8List(String base64String) {
    return base64Decode(base64String);
  }

  static Future<double> matchFaces(Uint8List liveImageUint,
      String refImageBase64) async {
    var faceSdk = FaceSDK.instance;

    final liveImage =
    convertImageFileToMatchable(liveImageUint, ImageType.LIVE);
    final refImage = convertImageFileToMatchable(
        base64ToUint8List(refImageBase64), ImageType.PRINTED);

    var request = MatchFacesRequest([liveImage, refImage]);
    var response = await faceSdk.matchFaces(request);
    var split = await faceSdk.splitComparedFaces(response.results, 0.75);
    var match = split.matchedFaces;
    try {
      if (match.isNotEmpty) {
        final similarity = (match[0].similarity * 100);
        return (similarity * 100);
      } else {
        return Future.error('unable to matching');
      }
    } catch (e) {
      print('matchFaces catch ${e}');
      return Future.error(e);
    }
  }

  static Future<File> startLivelyness(BuildContext context,
      {List<M7LivelynessStepItem>? list}) async {
    if (Platform.isAndroid) {
      final granted =await  PermissionDetector.detectCameraAndStoragePermission(context);
       if(granted==false) return Future.error('Permission not allowed');;
    }
    String _capturedImagePath = "";
    final _veificationSteps = list ??
        [
          M7LivelynessStepItem(
            step: M7LivelynessStep.smile,
            title: context
                .getStrings()
                .smil,
            isCompleted: false,
          ),
        ];

    final response = await M7LivelynessDetection.instance.detectLivelyness(
      context,
      config: M7DetectionConfig(
        steps: _veificationSteps,
        startWithInfoScreen: false,
        maxSecToDetect: 20,
        allowAfterMaxSec: false,
        captureButtonColor: Colors.red,
      ),
    );

    if (response.isNullOrEmpty()) {
      return Future.error('error');
    }
    _capturedImagePath = response ?? '';
    print('_capturedImagePath $_capturedImagePath');
    final file = File(_capturedImagePath.toString());
    return file;
  }

  static Future<FaceMatchingResult> startMatching(BuildContext context,
      {AttendanceConfigDto ?config, required String refImageBase64}) async {
    if (Platform.isAndroid) {
      final granted =await  PermissionDetector . detectCameraAndStoragePermission(context);
       if(granted==false) return Future.error('Permission not allowed');;
    }
    String _capturedImagePath = "";

    final _veificationSteps = config != null && stepsList(context, config).isNotEmpty? stepsList(context, config) :
    [
      M7LivelynessStepItem(
        step: M7LivelynessStep.smile,
        title: context
            .getStrings()
            .smil,
        isCompleted: false,
      ),
    ];

    final response = await M7LivelynessDetection.instance.detectLivelyness(
      context,
      config: M7DetectionConfig(
        steps: _veificationSteps,
        startWithInfoScreen: false,
        maxSecToDetect: 20,
        allowAfterMaxSec: false,
        captureButtonColor: Colors.red,
      ),
    );

    if (response!.isNullOrEmpty()) {
      return Future.error('error');
    }
    _capturedImagePath = response ?? '';

    final file = File(_capturedImagePath.toString());
    final matching = await detectFaceSimilitry(context, file, refImageBase64);
    if (matching != null && matching > 60) {
      return FaceMatchingResult(true,_capturedImagePath);
    }
    return FaceMatchingResult(false,_capturedImagePath);
  }

  static Future<double?> detectFaceSimilitry(BuildContext context,
      File pickedFile, String refImageBase64) async {
    print('detectFaceSimilitry');
    final progress = DialogsManager.createProgressWithMessage(context);
    try {
      final pickedUintList = pickedFile.readAsBytesSync();
      progress.show();

      final simi =
      await FaceMatchingUtils.matchFaces(pickedUintList, refImageBase64);

      progress.dismiss();

      print('matchingProcess ${simi}');
      return simi;
    } catch (e) {
      progress.dismiss();
      DialogsManager.showErrorDialog(
        context,
        context
            .getStrings()
            .face_not_matched,
      );
      return null;
    }
  }

  static List<M7LivelynessStepItem> stepsList(BuildContext context,
      AttendanceConfigDto attendanceConfigDto) {
    final strings = context.getStrings();
    return
      [
        if (attendanceConfigDto.eyeCheck == true)
          M7LivelynessStepItem(
            step: M7LivelynessStep.blink,
            title: strings.blink_your_eyes,
            isCompleted: false,
          ),
        if (attendanceConfigDto.moveFace == true)
          M7LivelynessStepItem(
            step: M7LivelynessStep.turnLeft,
            title: strings.turn_right,
            isCompleted: false,
          ),
        if (attendanceConfigDto.smile == true)
          M7LivelynessStepItem(
            step: M7LivelynessStep.smile,
            title: strings.smil,
            isCompleted: false,
          ),
      ];
  }
}