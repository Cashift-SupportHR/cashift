import 'dart:io';

import 'package:get/get.dart';
import 'package:shiftapp/core/services/routes.dart';
import 'package:shiftapp/common/data/models/attendance/attendance_config_dto.dart';
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
    extends BaseStatelessWidget{
  final bool faceDetectionEnabled  ;

  RequestItemBuilder({required this.faceDetectionEnabled});

@override
  Widget build(BuildContext context) {
  return buildProfileItem(strings.requests,
      icon: kLoadSvgInCircle("requests"), onTap: () async {

        if (faceDetectionEnabled) {
          final matching = await checkFaceRecognition(context);
          if(matching){
            Navigator.pushNamed(context, Routes.requestsUserPage);
          }
        } else {
          Navigator.pushNamed(context, Routes.requestsUserPage);
        }
      });
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


}
