import 'package:flutter/material.dart';

import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import '../../../../../../common/domain/entities/wallet/apply_details.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/constants.dart';

class ApplyDetailsWidget extends BaseStatelessWidget {
  final ApplyDetails model;

  ApplyDetailsWidget({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          valueAndTextFunds(
              text: "${strings.company_name}: ",
              value: model.companyName.toString()),

          Row(
            children: [
              Expanded(
                child: valueAndTextFunds(
                    text: strings.opportunity_name,
                    value: model.jobName.toString()),
              ),
              valueAndTextFunds(
                  text: strings.deserved_amount, value: model.money.toString()),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: valueContainer(
                    value:
                        "${strings.beginning_work}:  ${DateFormatter.repairApiDateTime(model.startShiftDate ?? '', pattern: DateFormatter.DAY_MONTH_YEAR)}"),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: valueContainer(
                    value:
                        "${strings.end_work}:  ${DateFormatter.repairApiDateTime(model.endShiftDate ?? '', pattern: DateFormatter.DAY_MONTH_YEAR)}"),
              ),
            ],
          ),
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


  Widget valueContainer({required String value}) {
    return Container(
      decoration: Decorations.createRectangleDecoration(
          color: kPrimary.withOpacity(0.1), border: 0),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 8, right: 8),
        child: Text(
          value,
          style: kTextRegular.copyWith(
            color: kBattleShipGrey,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
Widget valueAndTextFunds({required String text, required String value}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: Row(
      children: [
        Text(
          text,
          style: kTextMedium.copyWith(
            color: kPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          value,
          style: kTextMedium.copyWith(
            color: kFontDark,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.grey,
          thickness: .5,
        ),
      ],
    ),
  );
}
