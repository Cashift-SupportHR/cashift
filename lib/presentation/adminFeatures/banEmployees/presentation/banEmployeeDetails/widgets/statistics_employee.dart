import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shiftapp/common/components/icons/icon_text.dart';

import '../../../../../../utils/app_icons.dart';
import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../domain/entities/ban_employee_details.dart';
import '../../../domain/entities/job_evaluations_employee.dart';
import 'previous_opportunities_and_evaluations.dart';

///  Created by harbey on 8/5/2023.
class StatisticsEmployee extends BaseStatelessWidget {
  final BanEmployeeDetails details;
  final List<JobEvaluationsEmployee> jobEvaluationsEmployee;

  StatisticsEmployee({
    Key? key,
    required this.details,
    required this.jobEvaluationsEmployee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: Decorations.decorationOnlyRadius(),
      child: Column(
        children: [
          iconText(),
          SizedBox(height: 8),
          statisticEmployee(context),
          SizedBox(height: 10),
          PreviousOpportunitiesAndEvaluations(
            numOpportunities: details.numPreviousOpportunities ?? 0,
            jobEvaluationsEmployee: jobEvaluationsEmployee,
          ),
        ],
      ),
    );
  }
  Widget statisticEmployee(context) {
    return Container(
      height: 110,
      width: double.infinity,
      child: ListView.builder(
        itemCount: details.freelanceApply?.length ?? 0,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return circularPercentWidget(
              count: details.freelanceApply?[index].count ?? 0,
              text: details.freelanceApply?[index].name ?? '',
              percent: details.freelanceApply?[index].percentage ?? 0,
              label: details.freelanceApply?[index].label ?? ''
          );
        },
      ),
    );
  }

  circularPercentWidget({
    required int count,
    required String text,
    required double percent,
    required String label,
  }) {
    return Container(
      width: 100,
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.all(8),
      decoration: Decorations.shapeDecoration(radius: 10),
      child: CircularPercentIndicator(
        header: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            text,
            style: kTextMedium.copyWith(color: kDark, fontSize: 14),
          ),
        ),
        radius: 30.0,
        lineWidth: 4.0,
        percent: percent / 100,
        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              count.toString(),
              style: kTextMedium.copyWith(color: kRateBarIconColor, fontSize: 11),
            ),
            Text(
              label,
              style: kTextMedium.copyWith(color: kRateBarIconColor, fontSize: 11),
            ),
          ],
        ),
        progressColor: Colors.green,
      ),
    );
  }

  Widget iconText({String? text, String? icon}){
    return
      IconText(
        text: strings.statistic_emp,
        icon: AppIcons.statisticsEmpOutline,
        crossAxisAlignment: CrossAxisAlignment.center,
        iconSize: 20,
        textStyle: kTextBodyBold.copyWith(
            color: kRateBarIconColor,
            fontSize: 16,
            fontWeight: FontWeight.w700),
      );
  }
}

