import 'dart:io';

import 'package:get/get.dart';
import 'package:shiftapp/core/services/routes.dart';
import 'package:shiftapp/data/models/attendance/attendance_config_dto.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/profile/view/widgets/profile_item_widget.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../../../core/services/permission_detector.dart';
import '../../../../presentationUser/attendance/facerecognation/faces_matching.dart';
import '../../../../shared/components/adminToggle/cubit/admin_toggle_cubit.dart';
import '../../../../shared/components/dialogs_manager.dart';

class RequestItemBuilder
    extends BaseBlocWidget<InitializedToggleData, AdminToggleCubit> {
  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  void loadInitialData(BuildContext context) {
    if (bloc.image == null) {
      bloc.fetchRegisteredFace();
    }
  }

  @override
  Widget buildWidget(BuildContext context, InitializedToggleData state) {
    print("AdminTogglePage state");

    print("AdminTogglePage state");
    return buildProfileItem(strings.requests,
        icon: kLoadSvgInCircle("requests"), onTap: () async {

      if (state.image == "") {
        state.isAllowFaceRecognition == true
            ? await Navigator.pushNamed(context, Routes.faceRecognitionPage,
                arguments: state.user)
            : Navigator.pushNamed(context, Routes.requestsUserPage);
        ;
      } else {
        onFaceDetection(context);
      }
    });
  }

  double? simi;
  File? face;

  bool isShowDialogs = false;
  final CustomProgressDialog dialogs =
      DialogsManager.createProgressWithMessage(Get.context!);
  showDialogs() {
    if (!isShowDialogs) {
      dialogs.show();
      isShowDialogs = true;
    }
  }

  dismissDialogs() {
    dialogs.dismiss();
    isShowDialogs = false;
  }

  buildProfileItem(String data,
      {required Widget icon,
      Color? iconColor,
      required Function onTap,
      bool enable = true}) {
    return enable
        ? ProfileItemWidget(
            label: data,
            onTap: onTap,
            icon: icon,
            iconColor: iconColor,
          )
        : Container();
  }

  Future<void> onFaceDetection(
    BuildContext context,
  ) async {
    try {
      simi = null;
      final pickedFile = await navigateToCamera(publicContext);
      if (pickedFile != null) {
        simi = await detectFaceSimilitry(pickedFile);
        if (simi != null && simi! > 60) {
          face = pickedFile;
          Navigator.pushNamed(context, Routes.requestsUserPage);
        }
      }
    } catch (e) {
      handleErrorDialog(strings.undefine_error, context);
    }
  }

  Future<double?> detectFaceSimilitry(File pickedFile) async {
    print('detectFaceSimilitry');
    try {
      showDialogs();
      DialogsManager.createProgressWithMessage(context);
      final pickedUintList = pickedFile.readAsBytesSync();
      final simi =
          await FaceMatchingUtils.matchFaces(pickedUintList, bloc.image??'');

      dismissDialogs();

      print('matchingProcess ${simi}');
      return simi;
    } catch (e) {
      print(e);
      print("errorccc");
      dismissDialogs();
      handleErrorDialog(strings.face_not_matched, publicContext);

      return null;
    }
  }

  Future<File?> navigateToCamera(BuildContext context) async {
    try {
      final granted =
          await PermissionDetector.detectCameraAndStoragePermission(context);
      if (granted == false) return null;
      File? imageFile;
      WakelockPlus.enable();
      final data = bloc.getDataToggle();
      print("jkkk");
      print(data?.eyeCheck);
      print(data?.moveFace);
      print(data?.smile);
      print("jkkk");
      final imagePath = await Navigator.pushNamed(
        context,
        Routes.faceDetectorPage,
        arguments: AttendanceConfigDto(
          eyeCheck: data?.eyeCheck,
          moveFace: data?.moveFace,
          smile: data?.smile,
        ),
      );

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
}
