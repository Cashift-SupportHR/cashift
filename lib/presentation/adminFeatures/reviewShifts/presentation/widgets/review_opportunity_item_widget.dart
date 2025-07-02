import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/decorations/decorations.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import '../../../../../domain/entities/shared/date_formatter.dart';
import '../../data/models/complet_opportunity_dto.dart';
import '/presentation/adminFeatures/available_opportunities/presentation/widgets/work_dates.dart';
import '/presentation/presentationUser/resources/colors.dart';
import '/presentation/presentationUser/resources/constants.dart';
import '/presentation/shared/components/base_stateless_widget.dart';
import '/presentation/shared/components/image_builder.dart';
import '/presentation/shared/components/outlint_button.dart';
import '../../../../../core/utils/app_icons.dart';

import '../../data/models/completed_opportunity_dto.dart';

class ReviewOpportunityItemWidget extends BaseStatelessWidget {
  final CompletedOpportunityData opportunity;
  final bool? checked;
  final bool? selectable;
  final Function(CompletedOpportunityData shift) onSubmit;
  final Function(bool checked) onChecked;
  ReviewOpportunityItemWidget(
      {required this.opportunity,
      this.checked,
      required this.onChecked,
      required this.onSubmit,
      this.selectable});
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kPrimary.withOpacity(0.2)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Stack(
            children: [
              if (selectable == true)
                PositionedDirectional(end: 0, top: 0, child: checkBoxButton()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  fieldItem(strings.employee_name,
                      opportunity.freelanceName ?? '', AppIcons.mainJob),
                  fieldItem(strings.project_name, opportunity.projectName ?? '',
                      AppIcons.nameProject),
                  fieldItem(
                      strings.value_due,
                      "${opportunity.totalDeductMoneyClearanceCertificate ?? 0} ${strings.sr}",
                      AppIcons.opportunityValue),
                  fieldItem(
                      strings.beginning_work,
                      DateFormatter.repairApiDateTime(
                          opportunity.workingStartDate ?? '',
                          pattern: DateFormatter.WORKING_DATE_TIME_UI),
                      AppIcons.startTime),
                  fieldItem(
                      strings.end_work,
                      DateFormatter.repairApiDateTime(
                          opportunity.endWorkingDateTime ?? '',
                          pattern: DateFormatter.WORKING_DATE_TIME_UI),
                      AppIcons.endTime),
                  if (show == true)
                    Column(
                      children: [
                        fieldItem(strings.the_opportunity,
                            opportunity.jobName ?? '', AppIcons.bagOutline),
                        fieldItem(strings.city, opportunity.cityName ?? '',
                            AppIcons.city),
                        fieldItem(strings.id_number, opportunity.idNumber ?? '',
                            AppIcons.id),
                        fieldItem(strings.phone, opportunity.phoneNumber ?? '',
                            AppIcons.phoneOutline),

                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: Decorations.boxDecorationBorder(
                              borderColor: kPrimary.withOpacity(.5),
                              color: kPrimary.withOpacity(.1)),
                          child: ListRowTexts(
                            flex: 3,
                            padding: EdgeInsets.all(5),
                            valueStyle: kTextMedium.copyWith(
                                fontSize: 12, color: kOrange00),
                            titleStyle: kTextMedium.copyWith(
                                fontSize: 12, color: kPrimary),
                            titles: [
                              strings.discount_criminal_certificate,
                              strings.fines_discount,
                            ],
                            values: [
                              "${opportunity.totalDeductMoneyClearanceCertificate ?? 0} ${strings.sr}",
                              "${opportunity.ammountViolations ?? 0} ${strings.sr}",
                            ],
                          ),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      show = !show;
                      setState(() {});
                    },
                    child: Text(
                      show == true
                          ? strings.show_less + "  >>"
                          : strings.show_more + ">>",
                      style:
                          kTextMedium.copyWith(fontSize: 14, color: kOrange00),
                    ),
                  ),
                if (opportunity.isAllowUpdateStatus == true)
                    AppOutlineButton(
                      onClick: () {
                        onSubmit(opportunity);
                      },
                      text: strings.order_status,
                      borderWidth: 0.9,
                      textColor: kPrimary,
                      radius: 6,
                      padding: const EdgeInsets.all(14),
                    ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget fieldItem(String label, String value, String pathIcon) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          kLoadSvgInCirclePath(pathIcon, height: 20, width: 15,color: kPrimary),
          const SizedBox(width: 5),
          Text(
            '$label : ',
            style: kTextMedium.copyWith(
              fontSize: 12,
              color: kGreen_9B,
            ),
          ),
          Flexible(
            child: Text(
              value,
              style:
                  kTextRegular.copyWith(color: kBattleShipGrey2, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }

  Widget fieldItemChip(String value, {String? label}) {
    return CustomChip(label: label != null ? '${label}  : $value ' : '$value');
  }

  Widget editButton() {
    return Chip(
      label: kLoadSvgIcon(AppIcons.edit),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: kSilverTwo.withOpacity(0.14),
      labelStyle: kTextRegular.copyWith(color: kBattleShipGrey, fontSize: 10),
    );
  }

  Widget checkBoxButton() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: kPrimary, width: 1),
      ),
      width: 20,
      height: 20,
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Colors.transparent),
        child: Checkbox(
          checkColor: kPrimary,
          activeColor: Colors.transparent,
          value: checked,
          tristate: false,
          shape: const CircleBorder(),
          onChanged: (bool? value) {
            onChecked(value == true);
            //setChecked(value!);
          },
        ),
      ),
    );
  }
}
