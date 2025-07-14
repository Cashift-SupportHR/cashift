 import 'package:shiftapp/presentation/shared/components/index.dart';

import '../../../../../../common/domain/constants/codes_constants.dart';
import '../../../../../presentationUser/common/common_state.dart';

 import '../../../data/models/action_notifications_prams.dart';
import '../../action/pages/action_notification_screen.dart';
import '../cubit/acction_vehicle_notifications_cubit.dart';


class ActionVehicleNotificationPage extends BaseBlocWidget<
    UnInitState, ActionVehicleNotificationsCubit> {
  final Function( ) onRefrash;
  int  id;
  String  code;
ActionVehicleNotificationPage( {required  this.code,required  this.id,required this.onRefrash,});


  @override
  Widget buildWidget(
      BuildContext context, UnInitState state) {
    return  ActionVehicleNotificationScreen(onSave: (String procedure) {
      code == CodesConstants.waitingApprove
          ? bloc.finalActionVehicleNotification(
        ActionNotificationsPrams(
          notificationId: id,
          action: procedure,
        ),
      )
          : bloc.actionVehicleNotification(
        ActionNotificationsPrams(
          notificationId:  id,
          action: procedure,
        ),
      );
    }, code: code) ;
  }

  @override
  void onSuccessDismissed() {
    Navigator.pop(context);
    onRefrash();

  }

 }
