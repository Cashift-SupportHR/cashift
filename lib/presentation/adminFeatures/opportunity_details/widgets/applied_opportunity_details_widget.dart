import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';

import '../../../../core/services/routes.dart';
import '../../../presentationUser/resources/constants.dart';
import '../../../../common/components/circular_percent_widget.dart';
import '../../../../common/components/decorations/decorations.dart';

import '../../../../common/components/underline_widget.dart';
import '../../shared/domain/entities/opportunities/OpportunityDetailsData.dart';
import '../applied_details/pages/Applicants/applied_page.dart';

class AppliedOpportunityDatailsWidget extends BaseStatelessWidget {
  final OpportunityDetailsData opportunityDetails;
  AppliedOpportunityDatailsWidget({required this.opportunityDetails});
  @override
  Widget build(BuildContext context) {
    double percentageActive =
        (opportunityDetails.activeApplicantsCount?.percentage)! / 100;
    double percentageWaiting =
        (opportunityDetails.waitingApprovalApplicantsCount?.percentage)! / 100;
    double percentageCancelled =
        (opportunityDetails.cancelledApplicantsCount?.percentage)! / 100;
    double percentagePaidOff =
        (opportunityDetails.paidOffApplicantsCount?.percentage)! / 100;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      padding: const EdgeInsets.all(8),
      decoration: Decorations.shapeDecoration(radius: 10),
      child: Column(
        children: [
          headerWidget(context),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 110,
                  //      width: MediaQuery.of(context).size.width / 2.3,
                  child: CircularPercentWidgetV2(
                    text: strings.active,
                    descrption:
                        opportunityDetails.activeApplicantsCount?.subtitle ??
                            '',
                    percentData: PercentData(
                        label: strings.applied,
                        text: strings.applied,
                        percent: opportunityDetails
                                    .activeApplicantsCount?.percentage ==
                                0
                            ? 0
                            : percentageActive,
                        count:
                            opportunityDetails.activeApplicantsCount?.count ??
                                0),
                  ),
                ),
              ),
              Container(
                height: 110,
                width: 1,
                color: kGray_AC,
              ),
              Expanded(
                child: Container(
                  height: 110,
                  //   width: MediaQuery.of(context).size.width / 2.3,
                  child: CircularPercentWidgetV2(
                    text: strings.waiting_for_approval,
                    descrption: opportunityDetails
                            .waitingApprovalApplicantsCount?.subtitle ??
                        '',
                    percentData: PercentData(
                        label: strings.applied,
                        text: strings.applied,
                        percent: opportunityDetails
                                    .waitingApprovalApplicantsCount
                                    ?.percentage ==
                                0
                            ? 0
                            : percentageWaiting,
                        count: opportunityDetails
                                .waitingApprovalApplicantsCount?.count ??
                            0),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            height: 1,
            width: double.infinity,
            color: kGray_AC,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 110,
                  //      width: MediaQuery.of(context).size.width / 2.3,
                  child: CircularPercentWidgetV2(
                    text: strings.paid_off,
                    descrption:
                        opportunityDetails.paidOffApplicantsCount?.subtitle ??
                            '',
                    percentData: PercentData(
                        label: strings.applied,
                        text: strings.applied,
                        percent: opportunityDetails
                                    .paidOffApplicantsCount?.percentage ==
                                0
                            ? 0
                            : percentagePaidOff,
                        count:
                            opportunityDetails.paidOffApplicantsCount?.count ??
                                0),
                  ),
                ),
              ),
              Container(
                height: 110,
                width: 1,
                color: kGray_AC,
              ),
              Expanded(
                child: Container(
                  height: 110,
                  //       width: MediaQuery.of(context).size.width / 2.3,
                  child: CircularPercentWidgetV2(
                    text: strings.canceled_withdrawn,
                    descrption:
                        opportunityDetails.cancelledApplicantsCount?.subtitle ??
                            '',
                    percentData: PercentData(
                        label: strings.applied,
                        text: strings.applied,
                        percent: opportunityDetails
                                    .cancelledApplicantsCount?.percentage ==
                                0
                            ? 0
                            : percentageCancelled,
                        count: opportunityDetails
                                .cancelledApplicantsCount?.count ??
                            0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  headerWidget(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                strings.applicants,
                style:
                    kTextSemiBold.copyWith(color: kPrimaryDark, fontSize: 17),
              ),
              UnderlineWidget(width: 60),
            ],
          ),
        ),
        Text(
          "${opportunityDetails.totalCount} ${strings.applied}",
          style: kTextRegular.copyWith(fontSize: 10, color: kGray_AC),
        ),
        Spacer(),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context,Routes.appliedPage,
                arguments: opportunityDetails);
          },
          child: Text(
            strings.show_details_data,
            style: kTextSemiBold.copyWith(
                color: kOrange7f,
                fontSize: 18,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
