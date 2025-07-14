import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../../../common/domain/entities/wallet/apply_details.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import 'list_opportunity_details.dart';

class ApplyDetailsListScreen extends BaseStatelessWidget {
  final List<ApplyDetails> applyDetailsList;
  final bool loan;
  ApplyDetailsListScreen({required this.applyDetailsList, required this.loan});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: ListView.builder(
        itemCount: applyDetailsList.length,
        itemBuilder: (context, index) {
          final item = applyDetailsList[index];

          return loan
              ? loanDetails(item)
              : ApplyDetailsWidget(
                  model: item,
                );
        },
      ),
    );
  }

  Widget loanDetails(ApplyDetails item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          valueAndTextFunds(
              text: "${strings.loan_type}: ",
              value: item.loanType.toString()),
          valueAndTextFunds(
              text: strings.loan_amount, value: item.totalLoanAmount.toString()),
          Row(
            children: [
              Expanded(
                child: valueAndTextFunds(
                    text: strings.monthly_installment,
                    value: item.installment.toString()),
              ),
              valueAndTextFunds(
                  text: strings.no_installment, value: item.numberInstall.toString()),
            ],
          ),
          valueAndTextFunds(
              text: "${strings.create_date}: ",
              value: item.createdDate.toString()),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: kGrey,
            thickness: .5,
          ),
        ],
      ),
    );
  }
}
