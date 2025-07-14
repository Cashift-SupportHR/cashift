import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../common/components/base/base_stateless_widget.dart';
import '../../../common/components/buttons/row_buttons.dart';
import '../resources/constants.dart';

///  Created by harbey on 11/1/2023.
class DialogBackgroundService extends BaseStatelessWidget {
  final Function() onSave;
  final Function() onReject;

  DialogBackgroundService({Key? key, required this.onSave, required this.onReject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      content: Column(
        children: [
          Text(
            "${strings.background_service_permission_message}\n\n${strings.location_service_permission_message}",
            style: kTextSemiBold.copyWith(fontSize: 20),
          ),
          SizedBox(height: 15),
          Text(
            strings.reject_service_permission_message,
            style: kTextSemiBold.copyWith(fontSize: 20, color: kRed),
          ),
          Spacer(),
          RowButtons(
            textSaveButton: strings.accept_but,
            onSave: () async {
              onSave();
            },
            onCancel: () {
              Navigator.pop(context);
              onReject();
            },
          ),
        ],
      ),
    );
  }
}

void showBackgroundServiceDialog(BuildContext context,
    {required Function() onSave,  Function() ?onReject}) async {
  final granted = await detectRequiredBackgroundPermission();
  if(granted==false) {
    showDialog(
      context: context,
      builder: (context) => DialogBackgroundService(onSave: () async {
        Navigator.pop(context);
        try {
          onSave();
        }catch(e){
          if(onReject!=null)
          onReject();
        }
      },
        onReject: () {
          if(onReject!=null)
            onReject();
          }
      ),
    );
  }else{
    onSave();
  }
}

Future<bool> detectRequiredBackgroundPermission() async {
  var status = await Permission.location.status;
  var statusNotification = await Permission.notification.status;
  var statusBattery = await Permission.ignoreBatteryOptimizations.status;
  if (status.isGranted &&
      statusNotification.isGranted &&
      statusBattery.isGranted) {
    return true;
  } else {
    return false;
  }
}
