
 import 'dart:io';

import 'package:get/get.dart';
import 'package:livelyness_detection/livelyness_detection.dart';
import 'package:shiftapp/core/services/routes.dart';
import 'package:shiftapp/common/data/models/attendance/attendance_config_dto.dart';
 import 'package:shiftapp/extensions/extensions.dart';
 import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/adminToggle/screen/admin_toggle_widget.dart';

 import '../../../../presentation/presentationUser/attendance/facerecognation/faces_matching.dart';
import '../../../../presentation/presentationUser/attendance/facerecognation/index.dart';
import '../../../../presentation/shared/components/base_widget_bloc.dart';
import '../../../../presentation/shared/components/dialogs_manager.dart';
import '../../../../presentation/shared/components/progress/progress_dialog.dart';
import '../cubit/admin_toggle_cubit.dart';

class AdminToggleBuilder
    extends BaseBlocWidget<InitializedToggleData, AdminToggleCubit> {
  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchRegisteredFace();
  }

  @override
  Widget buildWidget(BuildContext context, InitializedToggleData state) {
    return AdminToggleWidget(
      image: state.image,
      isAllowFaceRecognition: state.isAllowFaceRecognition,
      user:state.user,
      isAdmin: state.isAdmin,
      adminEnable: state.adminEnable,
      setEnableAdmin: (isAdmin) {
        bloc.setEnableAdmin(isAdmin);
      },
      onAction: () {

        onFaceDetection(context,state.image);

      },
    );
  }


  Future<void> onFaceDetection(
      BuildContext context, String image,
      ) async {
    try {


      final data = bloc.getDataToggle();

      final matching = await FaceMatchingUtils.startMatching(context,
         config :   AttendanceConfigDto(
            eyeCheck: data?.eyeCheck,
            moveFace: data?.moveFace,
            smile: data?.smile,
            isDirectDetectFace: true,
          ),refImageBase64: image
      );

      if(matching.match){
        onToggle();
      }


    } catch (e) {
      handleErrorDialog(strings.undefine_error, context);
    }
  }




  void onToggle() {
    bool isAdmin = bloc.isAdmin();
    bloc.setEnableAdmin(!isAdmin);
    Navigator.pushReplacementNamed(context, Routes.home);
  }


}
