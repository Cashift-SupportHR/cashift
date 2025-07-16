import 'dart:io';

import 'package:get/get.dart';
import 'package:shiftapp/core/services/routes.dart';
import 'package:shiftapp/data/models/attendance/attendance_config_dto.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/profile/view/widgets/profile_item_widget.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../../../../core/services/permission_detector.dart';
import '../../../presentationUser/attendance/facerecognation/faces_matching.dart';
import '../../components/dialogs_manager.dart';
import '../cubit/check_face_recognation_cubit.dart';
import '../cubit/face_detection_intialize_state.dart';
import '../widgets/face_detector_widget.dart';

class CheckFaceRecognitionPage
    extends
        BaseBlocWidget<
          FaceDetectionInitializeState,
          CheckFaceRecogenationCubit
        > {
  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  void loadInitialData(BuildContext context) {
    print('loadInitialData CheckFaceRecognitionPage');
    bloc.fetchRegisteredFace();
  }

  static Future<bool> start(BuildContext context) async {
    final isChecked = await Navigator.pushNamed(
      context,
      Routes.checkFaceRecogenationPage,
    );
    return isChecked is bool ? isChecked : false;
  }

  @override
  String? title(BuildContext context) {
    return context.getStrings().face_print;
  }

  @override
  Widget buildWidget(BuildContext context, FaceDetectionInitializeState state) {
    checkAllowFaceRecognition(
      state.faceRecognitionConfig.isAllowFaceRecognition ?? false,
    );

    return FaceDetectorWidget(
      attendanceConfigDto: AttendanceConfigDto(
        eyeCheck: state.faceRecognitionConfig.eyeCheck,
        moveFace: state.faceRecognitionConfig.moveFace,
        smile: state.faceRecognitionConfig.smile,
      ),
      onFaceDetection: (matched) async {
        if (matched) {
          backAction();
        }
      },
      refImageBase64: state.base64Image,
    );
  }

  buildProfileItem(
    String data, {
    required Widget icon,
    Color? iconColor,
    required Function onTap,
    bool enable = true,
  }) {
    return enable
        ? ProfileItemWidget(
          label: data,
          onTap: onTap,
          icon: icon,
          iconColor: iconColor,
        )
        : Container();
  }

  void checkAllowFaceRecognition(bool isAllowFaceRecognition) {
    print('checkAllowFaceRecognition: $isAllowFaceRecognition');
    if (isAllowFaceRecognition) {
      backAction();
    }
  }

  void backAction() {
    Navigator.pop(context, true);
  }

  @override
  buildListener(BuildContext context, dynamic state) {
    if (state is EmptyFaceImageListener) {
      handleEmptyFaceImageListener(context);
    }
    super.buildListener(context, state);
  }

  void handleEmptyFaceImageListener(BuildContext context) {
    showErrorDialog(
      strings.face_image_required_proceed,
      context,
      onClickOk: () async {
        Navigator.pop(context);
        await Navigator.pushNamed(
          context,
          Routes.faceRecognitionPage,
          arguments: bloc.userData
        );
        bloc.fetchRegisteredFace();
      },
    );
  }
}
