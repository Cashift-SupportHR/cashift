import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:shiftapp/config.dart';
import 'package:shiftapp/data/models/attendance/attendance_shift_dto.dart';
import 'package:shiftapp/domain/entities/attendance/attendance_query.dart';
 import 'package:shiftapp/core/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/pages/qrcode_screen.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/shiftAttendance/bloc/attendance_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/shiftAttendance/pages/attendance_screen.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import 'package:shiftapp/presentation/shared/components/dialogs_manager.dart';
import 'package:animation_wrappers/animation_wrappers.dart';

import 'package:just_audio/just_audio.dart';

import '../../../../../core/services/routes.dart';
import '../../../../../domain/entities/attendancerecoginatin/register_attendance_request_shift.dart';
import '../../../../../domain/entities/shift/applied_offer.dart';

class AttendancePage
    extends BaseBlocWidget<Initialized<AttendanceShiftDto>, AttendanceCubit> {

  @override
  bool initializeByKoin() {
    return false;
  }

  bool registered = false;

  @override
  void onBackPress() {
    Navigator.pop(context, registered);
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAttendance();
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<AttendanceShiftDto> state) {
    return FadedSlideAnimation(
      child: AttendanceScreen(
        attendanceShift: state.data,
        onSubmit: (presentId) async {
          // performAttendance(
          //     state.data.projectId!, state.data.canSkipQr == true, presentId: presentId);
          final isRefresh = await Navigator.pushNamed(
              context, Routes.cashiftAttendancePage,
              arguments: RegisterAttendanceRequestShift(
                  shift: state.data, presentId: presentId));
          if (isRefresh == true) {
            bloc.fetchAttendance();
          }
        },
      ),
      beginOffset: Offset(0, 0.3),
      endOffset: Offset(0, 0),
      slideCurve: Curves.linearToEaseOut,
    );
  }

  Future<QrCode> scanQr(BuildContext context, String code) async {
    if (Config.isDebuggable) {
      File? file;
      return Future.value(QrCode(code,file));
    }
    return await Navigator.pushNamed(context, Routes.qrScanner) as QrCode;
  }


  Future<void> performAttendance(String projectId, bool canSkipQr,
      {required int presentId}) async {
    final qr = await scanQr(context, projectId);

    if (qr.code == projectId || canSkipQr == true) {
      onReadyToAttendance(projectId, presentId: presentId);
    } else {
      DialogsManager.showMessageDialog(context, context.getStrings().error_qr,
          onClickOk: () {});
    }
  }

  void onReadyToAttendance(String projectId, {required int presentId}) {
    fetchLocation(onGetLocation: (location) {
      bloc.registerAttendance(AttendanceQuery(
          latitude: location.latitude,
          longitude: location.longitude,
          projectId: projectId,
          presentId: presentId));
    });
  }

  @override
  String? title(BuildContext context) => strings.attendance_title;

  @override
  void onRequestSuccess(String? message) {
    playSound();
    registered = true;
    super.onRequestSuccess(message);
    bloc.fetchAttendance();
  }

  playSound() async {
    print('MUST PLAY');
    final player = AudioPlayer();
    // Create a player
    player.setAsset('raw/thank_2.mp3');
    await player.setLoopMode(LoopMode.off);
    await player.play();
  }

  @override
  onClickReload() {
    bloc.fetchAttendance();
  }

  @override
  void onRequestFail(Object error) {
    if (error.requiredContactItException()) {
      registered = true;
    }
  }

  convertToAppliedOffer(AttendanceShiftDto dto, {int? presentId}) {
    return AppliedOffer(
      id: dto.id,
      jobName: dto.jobName,
      projectId: dto.projectId,
      allowFaceRecognition: dto.allowFaceRecognition,
      isFingerPrint:
          dto.canSkipQr == true ? AppliedOffer.CONTROLLER_TYPE_QR : null,
      statusId: presentId,
    );
  }
}
