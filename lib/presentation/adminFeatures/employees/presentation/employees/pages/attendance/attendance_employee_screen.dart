import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../domain/entities/index.dart';
import '../../widgets/attendance_item.dart';

class AttendanceEmployeesScreen extends BaseStatelessWidget {
 final List<TransactionsList> transactionsList;
 final int indexPage;

  AttendanceEmployeesScreen({super.key, required this.indexPage,required this.transactionsList});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: kBackground,
      child: ListView.builder(
        itemCount: transactionsList.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 6, bottom: 16, left: 16, right: 16),
        itemBuilder: (context, index) {
          return AttendanceItem(
            index: indexPage,
            transactionsList: transactionsList[index],

              );
        },
      ),
    );
  }
}
