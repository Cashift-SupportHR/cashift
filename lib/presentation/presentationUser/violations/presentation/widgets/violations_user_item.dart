import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';
import 'package:shiftapp/common/components/buttons/row_small_button.dart';
import 'package:shiftapp/common/components/texts/list_row_texts.dart';
import 'package:shiftapp/common/components/texts/list_row_texts_icons.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../common/domain/entities/bail_requests/employee_services_status.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/decorations/decorations.dart';
import '../../../../../common/components/divider/custom_divider.dart';
import '../../../bail_requests/widgets/title_icon_services.dart';
import '../../data/models/violation_user_dto.dart';

class ViolationsUserItem extends BaseStatelessWidget {
  final int type;
  final String description;
  final ViolationUserDto violation;
  final Function() onAccept;
  final Function() onReject;

  ViolationsUserItem(
      {Key? key,
      required this.type,
      required this.description,
      required this.violation,
      required this.onAccept,
      required this.onReject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16, bottom: 16),
      color: kWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleIconServices(
            title: violation.violationName ?? '',
            status: type,
            iconFirstStatus: AppIcons.violation,
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListRowTexts(
                  flex: 1,
                  isHideEmptyValue: true,
                  titleStyle:
                      kTextBoldTitle.copyWith(color: kGreen_2, fontSize: 11),
                  valueStyle: kTextBodyBold.copyWith(
                      color: kBattleShipGrey, fontSize: 11),
                  titles: [
                    strings.violation_type,
                    strings.violation_value,
                    strings.company_name,
                    strings.project_name,
                    strings.opportunity_date,
                    strings.violation_details,
                    strings.employee_details,
                  ],
                  values: [
                    violation.typesOfViolationName ?? '',
                    (violation.amountViolation?.toString() ?? '0.0') ,
                    violation.companyName ?? '',
                    violation.projectName ?? '',
                    dateTime(),
                    violation.adminDescription ?? '',
                    violation.applyDescription ?? '',
                  ],
                ),
                type != 1
                    ? Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsetsDirectional.fromSTEB(0, 5, 20, 10),
                        decoration: Decorations.boxDecorationBorder(
                          borderColor: kPrimary,
                        ),
                        child: Column(
                          children: [
                            ListRowTextsIcons(
                              // flex: 2,
                              titleStyle: kTextBoldTitle.copyWith(
                                  color: kOrange00, fontSize: 11),
                              valueStyle: kTextBodyBold.copyWith(
                                  color: kBattleShipGrey, fontSize: 11),
                              titles: [
                                strings.status_infringement,
                              ],
                              values: [
                                violation.status ?? '',
                              ],
                              icons: [
                                AppIcons.dot,
                              ],
                            ),
                            violation.fromDate == null &&
                                    violation.toDate == null
                                ? SizedBox()
                                : ListRowTextsIcons(
                                    titleStyle: kTextBoldTitle.copyWith(
                                        color: kPrimary, fontSize: 11),
                                    valueStyle: kTextBodyBold.copyWith(
                                        color: kBattleShipGrey, fontSize: 11),
                                    icons: [
                                        AppIcons.timeIn,
                                        AppIcons.timeOut,
                                      ],
                                    titles: [
                                        strings.start_date_blocking,
                                        strings.end_date_blocking
                                      ],
                                    values: [
                                        violation.fromDate ?? '',
                                        violation.toDate ?? '',
                                      ]),
                          ],
                        ),
                      )
                    : SizedBox(),
                if (type == 1) rowSmallButtons(),
              ],
            ),
          ),
          if (type != EmployeeServicesStatus.approved)
            WarningWidget(
                warningText: description,
                color: type == EmployeeServicesStatus.waitingForReview
                    ? kGreen_2
                    : null),
          const CustomDivider(),
        ],
      ),
    );
  }

  String dateTime() {
    return (DateFormatter.formatDateStringNoPattern(
                violation.startShiftDate ?? '',
                pattern: DateFormatter.DATE_UI) ??
            '') +
        ' - ' +
        DateFormatter.formatDateStringNoPattern(violation.startShiftDate ?? '',
            pattern: DateFormatter.HOUR_MINUT_12) +
        '' +
        DateFormatter.formatDateStringNoPattern(violation.endShiftDate ?? '',
            pattern: DateFormatter.HOUR_MINUT_12);
  }

  Widget rowSmallButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: RowSmallButton(
        radius: 50,
        textSave: strings.approval,
        textCancel: strings.refusal,
        onCancel: onReject,
        onSave: onAccept,
        // heightSaveButton: 30,
      ),
    );
  }
}
