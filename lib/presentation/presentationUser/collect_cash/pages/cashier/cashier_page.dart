import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/collect_cash/pages/cashier/cashier_screen.dart';
import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';


import '../../../../../common/components/base/base_widget.dart';

class CashierPageArgs{
  final int projectId ;
  final int type ;
  CashierPageArgs(this.projectId, this.type);
}
class CashierPage  extends BaseWidget {

  @override
  Widget buildWidget(BuildContext context) {
    final args = context.getArguments() as CashierPageArgs;
    return Scaffold(
        backgroundColor: kBackgroundColor2,
        body:SafeArea(child: CashierScreen(jobCash: args,))
    );

  }

}