import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/index.dart';

import '../../../../../../utils/app_icons.dart';
   import '../../../domain/entities/TransactionsList.dart';

class AttendanceItem extends BaseStatelessWidget {
  final TransactionsList transactionsList;
  final int index;

  AttendanceItem(
      {super.key, required this.transactionsList, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Decorations.boxDecorationBorder(
          borderWidth: 1.5,
          borderColor:
              index == 2 ? kRed.withOpacity(0.3) : kGreen_2.withOpacity(0.3)),
      margin: EdgeInsets.only(bottom: 10),
      child: ListRowTextsIconsV2(
        padding:
            EdgeInsetsDirectional.only(start: 10, top: 10, bottom: 6, end: 5),

        items: [
        ListRowTextItem(title:  strings.status, value:  transactionsList.vactionType ?? "",icon: AppIcons.empName,),
        ListRowTextItem(title:  strings.project_name, value:  transactionsList.projectName ?? "",icon: AppIcons.projectName,),
        ListRowTextItem(title:  strings.period, value:  transactionsList.shiftName ?? "",icon: AppIcons.emp3,),
        ListRowTextItem(title:  strings.date, value:  transactionsList.fullDates ?? "",icon: AppIcons.dateOutline,),
        ListRowTextItem(title:  strings.beginning_work, value:  transactionsList.checkIn ?? "",icon: AppIcons.startTime,),
        ListRowTextItem(title:  strings.end_work, value:  transactionsList.checkOut ?? "",icon: AppIcons.endTime,),
      ],
      ),
    );
  }
}
