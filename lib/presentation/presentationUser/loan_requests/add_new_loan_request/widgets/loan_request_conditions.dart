import 'package:flutter/material.dart';

import '../../../../../domain/entities/loans_request/loan_num_month_condition.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../shared/components/base_stateless_widget.dart';
import '../../../../shared/components/decorations/decorations.dart';
import '../../../../shared/components/image_builder.dart';
import '../../../../shared/components/underline_widget.dart';
import '../../../common/common_state.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';

class LoanRequestConditions extends BaseStatelessWidget {
  final StreamStateInitial<LoanNumMonthCondition?> loanNumMonthConditionStream;
   LoanRequestConditions({Key? key, required this.loanNumMonthConditionStream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LoanNumMonthCondition?>(
        stream: loanNumMonthConditionStream.stream,
        builder: (context, snapshot) {
          return (snapshot.data?.loansConditions == null || snapshot.data!.loansConditions!.isEmpty) ? const SizedBox() :
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              strings.conditions,
              style: kTextBoldTitle.copyWith(
                color: kGreen_2,
                fontSize: 14,
              ),
            ),
            const UnderlineWidget(),
            const SizedBox(
              height: 16,
            ),
            Container(
                decoration: Decorations.decorationConditions,
                padding: const EdgeInsets.all(16),
                child:  Column(
                  children: snapshot.data?.loansConditions?.map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: kLoadSvgInCirclePath(
                            e.isAccept ?? false ? AppIcons.doneCircle :
                            AppIcons.removeCircle,
                            // height: 18,
                            // width: 18,
                            color: e.isAccept ?? false ? kGreen_2 : kRed,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 10,
                          child: Text(e.description ?? '',
                              style: kTextMedium.copyWith(
                                color: kGreen_2,
                                fontSize: 12,
                              )),
                        ),
                      ],
                    ),
                  )).toList() ?? [],
                )
            ),
          ],
        );
      }
    );
  }
}
