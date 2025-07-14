import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';
import 'package:shiftapp/common/components/texts/row_rich_texts.dart';

import '../../../../../common/domain/entities/bail_requests/employee_services_status.dart';
import '../../../../../common/domain/entities/salary-definition-request/salary_definition_request.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../bail_requests/widgets/title_icon_services.dart';
import 'download_rounded_button.dart';

class SalaryDefinitionRequestItem extends BaseStatelessWidget {
  final int type;
  final SalaryDefinitionRequest request;
  final Function() onDownloadFile;

  SalaryDefinitionRequestItem({Key? key, required this.type, required this.request, required this.onDownloadFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16),
      color: kWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleIconServices(
            title: request.title ?? '',
            status: type,
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CustomRichText(
                  title1: strings.direction_to,
                  value: request.slipForDistination ?? '',
                ),
                const SizedBox(
                  height: 8,
                ),
                _CustomRichText(
                  title1: strings.purpose_of_request,
                  value: request.resonF ?? '',
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    FittedBox(
                      child: _CustomRichText(
                        title1: strings.chamber_commerce_attestation_required,
                        value: request.needStamp ?? '',
                      ),
                    ),
                    const VerticalDivider(
                      color: kGreen_2,
                      thickness: 1,
                      width: 10,
                    ),
                    FittedBox(
                      child: _CustomRichText(
                        title1: strings.date_request,
                        value: request.createdDate ?? '',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          if(type == EmployeeServicesStatus.approved)
             DownloadRoundedButton(
               onPressed: onDownloadFile,
             ),
          if(type == EmployeeServicesStatus.rejected)
             WarningWidget(warningText: request.rejectReason ?? ''),
          if(type == EmployeeServicesStatus.waitingForReview)
          const SizedBox(
            height: 8,
          ),
          const Divider(
            color: kGrey_DF,
            thickness: 1,
            endIndent: 18,
          ),
        ],
      ),
    );
  }
}

class _CustomRichText extends StatelessWidget {
  final String title1;
  final String value;

  const _CustomRichText({Key? key, required this.title1, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomRichText(
      title: title1,
      subTitle: value,
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
