import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../shared/components/index.dart';
import '../../../../../resources/colors.dart';
import '../../../../data/models/confirm_reservation_warning_prams.dart';
import '../../../../domain/entities/penalty_warning.dart';
import '../../../intent/mana_delevery_intents.dart';

class ConfirmWidget extends BaseStatelessWidget {
int  orderId;
int  warehouseId;
  final Function(ManaDeliveryIntents intent) intentCallBack;

  PenaltyWarningEntity data;
    ConfirmWidget({super.key,required this.warehouseId,required this.orderId,required this.intentCallBack,required this.data});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        kSvgIcon(image: AppIcons.notes2),
        SizedBox(height: 10,),
        Text(data.title??"", style: kTextBold.copyWith(fontSize: 18),),
        SizedBox(height: 10,),
        Text(data.message??"", style:  kTextRegular.copyWith(
          fontSize: 14,
          color: kGreen_85,
        ),),
        SizedBox(height: 20,),
        RowButtons(
            textSaveButton: data.confirmButtonText??"",

            textCancelButton: data.cancelButtonText??"",
          onSave: () {
            intentCallBack(SubmitReservation(confirmReservationWarningPrams:ConfirmReservationWarningPrams(orderId:orderId,acknowledgedPenalty: true,warehouseId: warehouseId ) ));

          },
          onCancel: () {
            intentCallBack(CancelReservation(orderId: orderId));
        },)
      ],
    );
  }
}
