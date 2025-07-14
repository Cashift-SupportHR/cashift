import 'package:flutter/material.dart';

import '../../../../../common/domain/entities/loans_request/loan_request.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/texts/row_rich_texts.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';

class InstallmentDetails extends BaseStatelessWidget {
  final LoanRequest request;
  InstallmentDetails({Key? key, required this.request}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RowRichTexts(
      padding: const EdgeInsets.symmetric(vertical: 8),
      title1: strings.number_months_installment,
      title2: strings.installment_amount,
      subTitle1: request.totalMonth ?? '',
      subTitle2: request.installAmount.toString() + ' ' + strings.sar,
      titleStyle: kTextBoldTitle.copyWith(
          color: kGreen_2,
          fontSize: 10
      ),
      subTitleStyle: kTextBodyBold.copyWith(
          color: kBattleShipGrey,
          fontSize: 11
      ),
    );
  }
}
