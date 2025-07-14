import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
   import 'package:shiftapp/common/components/texts/list_row_texts_icons.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../../common/components/decorations/decorations.dart';
import '../../../../domain/entities/AttendanceNotifiAction.dart';


class AttendanceAndDepartureNotificationsItem extends BaseStatelessWidget {
 final AttendanceNotifiAction attendanceNotifiAction;

  AttendanceAndDepartureNotificationsItem({super.key, required this.attendanceNotifiAction});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
      decoration: Decorations.decorationTabs,

      child: ListRowTextsIcons(
        icons: [
          iconByType(1),
         AppIcons.calanderTime,
         AppIcons.settingTime,
         AppIcons.statusTime,
         AppIcons.box,

        ],
        titles: [
          strings.type_request,
          strings.date_request,
          strings.leave_period,
          strings.status_request,
          strings.description,
        ],
        values: [
          attendanceNotifiAction.attendanceNotifiTypeName??"",
         DateFormatter.formatDateString(attendanceNotifiAction.reuestDate??"", DateFormatter.TIME_STAMP, DateFormatter.DATE_UI) ,
          " ${strings.from}  ${attendanceNotifiAction.attNotifiFrom??""} ${strings.too}    ${attendanceNotifiAction.attNotifiTo??""}  ",
          attendanceNotifiAction.attendanceNotifiTypeName??"",
          attendanceNotifiAction.discription??"",
        ],
      ) ,
    );
  }

  iconByType(int  type){
    if(type==1){
      return AppIcons.time3;
    } else if(type==2){
      return AppIcons.typeRequest;
    } else if(type==3){
      return AppIcons.workTask;
    }
  }
}

