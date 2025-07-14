import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/texts/text_value_ratting.dart';

import '../../../../../presentationUser/resources/constants.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../../../../common/components/texts/text_value.dart';
import '../../../domain/entities/job_evaluations_employee.dart';

///  Created by harbey on 8/5/2023.
class PreviousOpportunitiesAndEvaluations extends BaseStatelessWidget {
  final int numOpportunities;
  final List<JobEvaluationsEmployee> jobEvaluationsEmployee;

  PreviousOpportunitiesAndEvaluations({
    Key? key,
    required this.numOpportunities,
    required this.jobEvaluationsEmployee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.all(16),
      decoration: Decorations.shapeDecoration(radius: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                strings.previous_opportunities_and_evaluations,
                style: kTextMedium.copyWith(color: kPrimary, fontSize: 16),
              ),
              SizedBox(width: 5),
              if (numOpportunities > 0)
                Text(
                  '( ${numOpportunities.toString()}  ${numOpportunities > 9 ? strings.previous_opportunity : strings.previous_opportunities} )',
                  style: kTextMedium.copyWith(color: kYellow_00, fontSize: 12),
                ),
            ],
          ),
          SizedBox(
            height: jobEvaluationsEmployee.length > 1 ? 160 : null,
            child: Scrollbar(
              child: ListView.builder(
                itemCount: jobEvaluationsEmployee.length,
                padding: EdgeInsets.only(top: 20),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PreviousOpportunitiesAndEvaluationsItem(
                    jobEvaluationsEmployee: jobEvaluationsEmployee[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PreviousOpportunitiesAndEvaluationsItem extends BaseStatelessWidget {
  final JobEvaluationsEmployee jobEvaluationsEmployee;

  PreviousOpportunitiesAndEvaluationsItem({Key? key, required this.jobEvaluationsEmployee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.circle,
                color: kBlack,
                size: 5,
              ),
              SizedBox(width: 5),
              Expanded(
                child: TextValue(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  isExpanded: false,
                  text: jobEvaluationsEmployee.nameAr ?? '',
                  value: '   ( ${jobEvaluationsEmployee.totalWorkHours} )' ?? '',
                  textStyle: kTextMedium.copyWith(color: kBlack, fontSize: 14),
                  valueStyle: kTextMedium.copyWith(color: kBlack, fontSize: 12),
                ),
              ),
              Text(jobEvaluationsEmployee.date ?? '', style: kTextRegular.copyWith(color: kBlack, fontSize: 12)),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                strings.average_feedbacks,
                style: kTextRegular.copyWith(color: kGreen_52, fontSize: 12),
              ),
              TextValueRatting(
                initialRating: jobEvaluationsEmployee.percentage ?? 0,
                iconSize: 18,
                text: jobEvaluationsEmployee.evaluationName ?? '',
                value: jobEvaluationsEmployee.evaluationCount ?? 0,
                isMark: false,
                isExpandedText: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
