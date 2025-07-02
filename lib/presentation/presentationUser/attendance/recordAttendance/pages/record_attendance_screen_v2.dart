import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:shiftapp/main_index.dart';

import 'package:shiftapp/presentation/shared/components/buttons/row_buttons.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../../../config.dart';
import '../../../../../core/services/permission_detector.dart';
import '../../../../../data/models/attendance/attendance_config_dto.dart';
import '../../../../../domain/entities/attendancerecoginatin/attendance_model.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../shared/components/app_cupertino_button.dart';
import '../../../../shared/components/base_stateless_widget.dart';
import '../../../../shared/components/dialogs_manager.dart';
import '../../../../shared/components/map/current_location_realtime_map.dart';
import '../../../../shared/components/stepper/CheckBoxStepper/horizontal_progress_stepper.dart';
import '../../../common/common_state.dart';
import '../../facerecognation/faces_matching.dart';
import '../../registerfacerecognition/attendance_params.dart';
import '../../../resources/colors.dart';
import '../../../appliedoffers/pages/qrcode_screen.dart';
import '../widgets/record_attendance_item_v2.dart';

///  Created by harbey on 8/15/2023.
class RecordAttendanceScreenV2 extends BaseStatelessWidget {
  final String? registeredFace;
  final String? descriptionQrCode;
  final String? titleButton;
  final bool isOffline;
  final RegisterAttendanceRequest registerAttendanceRequest;
  final StreamStateInitial<LocationData?> locationStream ;

  final Function(AttendanceParams params) onPerformAttendance;


  RecordAttendanceScreenV2({
    Key? key,
    this.registeredFace,
    this.descriptionQrCode,
    this.titleButton,
    this.isOffline = false,
    required this.onPerformAttendance,
    required this.registerAttendanceRequest,
    required this.locationStream ,
  }) : super(key: key);

  StreamStateInitial<bool> validateToRegister = StreamStateInitial<bool>();
  StreamStateInitial<bool?> matchingProcess = StreamStateInitial<bool?>();
  double? simi;
  File? face;
  LocationData? position;
  QrCode ?qrCode;

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: HorizontalProgressStepper(
              color: kPrimary,
              controller: controller,
              widgets: buildSteps(),
            ),
          ),
          isOffline
              ? performOfflineAttendanceWidget(context)
              : performAttendanceWidget(context)
        ],
      ),
    );
  }

  List<Widget> buildSteps() {
    final List<Widget> steps = [];


    // NEW CODE
    if (registerAttendanceRequest.allowedToDetectFace()) {
      steps.add(facePrintStep(publicContext));
    }
    if (registerAttendanceRequest.allowedToDetectQr()) {
      steps.add(qrCodeFingerPrintStep());
    }
    if (registerAttendanceRequest.allowedToDetectLocation()) {
      steps.add(currentLocation());
    }
    print('currentLocation steps ${steps.length}');
    return steps;
  }

  Widget facePrintStep(BuildContext context) {
    return StreamBuilder<bool?>(
        stream: matchingProcess.stream,
        initialData: false,
        builder: (context, snapshot) {
          return RecordAttendanceItemV2(
            icon: AppIcons.scan_face,
            title: strings.face_print,
            description: simi != null
                ? 'Face Detected Similarity  ${simi!.toStringAsFixed(2)} % Successfully'
                : strings.record_attendance_scan_description_face_print,
            onPressed: snapshot.data == true
                ? null
                : () {
                    performFaceDetection(context, onUpdate: () {
                      if (registerAttendanceRequest.allowedToDetectQr() || registerAttendanceRequest.allowedToDetectLocation()) {
                        controller.animateToPage(1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      } else {
                        matchingProcess.setData(true);
                        validateToRegister.setData(true);
                      }
                    });
                  },
          );
        });
  }

  Widget qrCodeFingerPrintStep() {
    return StreamBuilder<bool>(
        stream: validateToRegister.stream,
        initialData: false,
        builder: (context, snapshot) {
          return RecordAttendanceItemV2(
            icon: AppIcons.scan_qr_code_phone,
            title: strings.qr_code_fingerprint,
            description: descriptionQrCode ?? strings.check_qr_code_opportunity,
            onPressed: snapshot.data == true
                ? null
                : () {
                    _detectAttendanceAndQr(publicContext, onReady: (qr) {
                      this.qrCode = qr;
                      if (registerAttendanceRequest.allowedToDetectLocation()) {
                        validateToRegister.setData(true);

                        controller.animateToPage(2,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      } else {
                        validateToRegister.setData(true);
                      }
                    });
                  },
          );
        });
  }

  Widget performAttendanceWidget(BuildContext context) {
    return StreamBuilder<bool>(
        stream: validateToRegister.stream,
        builder: (context, snapshot) {
          return AppCupertinoButton(
            text: titleButton ?? strings.attendance_registration,
            radius: BorderRadius.circular(6),
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            onPressed: snapshot.data == true
                ? () {
                    if (createParams() != null)
                      onPerformAttendance(createParams()!);
                  }
                : null,
          );
        });
  }

  Widget performOfflineAttendanceWidget(BuildContext context) {
    return StreamBuilder<bool>(
        stream: validateToRegister.stream,
        builder: (context, snapshot) {
          return RowButtons(
            textSaveButton: strings.attendance_registration,
            textCancelButton: strings.checkout,
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            onSave: snapshot.data == true
                ? () {
                    if (createParams() != null)
                      onPerformAttendance?.call(createParams()!);
                  }
                : null,
            onCancel: snapshot.data == true
                ? () {
                    if (createParams() != null)
                      onPerformAttendance?.call(createParams(presentId: 2)!);
                  }
                : null,
          );
        });
  }

  Future<double?> detectFaceSimilitry(File pickedFile) async {
    print('detectFaceSimilitry');
    try {
      showProgress();
      final pickedUintList = pickedFile.readAsBytesSync();
      final simi =
          await FaceMatchingUtils.matchFaces(pickedUintList, registeredFace??'');

      dismissProgress();
      print('matchingProcess ${simi}');
      return simi;
    } catch (e) {
      dismissProgress();
      handleErrorDialog(strings.face_not_matched, publicContext);
      return null;
    }
  }

  Future<void> performFaceDetection(BuildContext context,
      {required Function onUpdate}) async {
    try {
      simi = null;
      final pickedFile = await navigateToCamera(publicContext);
      if (pickedFile != null) {
        simi = await detectFaceSimilitry(pickedFile);
        if (simi != null && simi! > 60) {
          face = pickedFile;
          onUpdate();
        }
      }
    } catch (e) {
      handleErrorDialog(strings.undefine_error, context);
    }
  }

  Future<File?> navigateToCamera(BuildContext context) async {
    try {
      final granted =
          await PermissionDetector.detectCameraAndStoragePermission(context);
      if (granted == false) return null;
      File? imageFile;
      WakelockPlus.enable();

      final imagePath = await Navigator.pushNamed(
          context, Routes.faceDetectorPage,
          arguments: registerAttendanceRequest.attendanceConfigDto());
      WakelockPlus.disable();
      if (imagePath is String && !imagePath.isNullOrEmpty()) {
        imageFile = File(imagePath);
        return imageFile;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  AttendanceParams? createParams({int presentId = 1}) {
    if (qrCode==null && registerAttendanceRequest.allowedToDetectQr()) {
      showErrorDialog(strings.scan_your_code, publicContext);
      return null;
    }
    return AttendanceParams(qr: qrCode, face: face, presentId: presentId);
  }

  Future scanQr(BuildContext context) async {
    // if (Config.isDebuggable) {
    //   File? file;
    //   return Future.value(QrCode('shift',file,allowFile: registerAttendanceRequest.allowToTrack()),);
    // }
    return await Navigator.pushNamed(context, Routes.qrScanner,arguments: QrCode('',null,allowFile: registerAttendanceRequest.allowToTrack()),) as QrCode;

  }

  QrCode? detectQr(qrcode) {
    if (qrcode != null && qrcode is QrCode) {
      return qrcode;
    } else {
      return null;
    }
  }

  void _detectAttendanceAndQr(BuildContext context,
      {required Function(QrCode qrCode) onReady}) async {
    final scanResult = await scanQr(context);
    final qrCode = detectQr(scanResult);

    if (qrCode != null) {
      onReady(qrCode);
    } else {
      DialogsManager.showMessageDialog(context, strings.error_qr,
          onClickOk: () {});
    }
  }

  Widget currentLocation() {
    return CurrentLocationRealtimeMap(
      padding: const EdgeInsets.only(top: 6),
      isActive: true,
      heightLocation: 500,
      locationStream: locationStream,
      onGetLocation: (location) {
        position = location;
          validateToRegister.setData(true);
          print('onGetLocation onGetLocation');
      },
    );
  }
}
