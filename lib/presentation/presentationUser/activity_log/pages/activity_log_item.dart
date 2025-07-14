
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/domain/entities/activity_log/notification_item.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';



import '../../../shared/components/base_widget.dart';

class ActivityLogItemWidget extends BaseWidget {
  final NotificationItem notificationItem;
  final Function(bool isAccept) onConfirmJob;
  final bool isActiv ;

  ActivityLogItemWidget({Key? key , required this.notificationItem ,required this.onConfirmJob ,this.isActiv = false}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: kGrey_D6,
      color: Colors.grey.shade50,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12,top: 12,right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( notificationItem.message.toString(),style: kTextLabelFontDark,),
                Container(),
                isActiv ?  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      onConfirmJob(true);

                    }, icon: Image.asset('images/approve.png')),
                    IconButton(onPressed: (){
                      onConfirmJob(false);
                    }, icon: Image.asset('images/reject.png'))
                  ],):Container()
              ],),
          )
        ],
      ),
    );
  }

}
