import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';
import 'package:shiftapp/common/components/texts/row_rich_texts.dart';

import '../../../../../common/domain/entities/bail_requests/employee_services_status.dart';
import '../../../../../common/domain/entities/loans_request/loan_request.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../bail_requests/widgets/title_icon_services.dart';
import 'installment_details.dart';

class LoanRequestItem extends BaseStatelessWidget {
  final int type;
  final LoanRequest request;

  LoanRequestItem({Key? key, required this.type, required this.request}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16),
      color: kWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleIconServices(
            title: request.typeLoans ?? '',
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
                  title1: strings.loan_start_date,
                  value: request.createdOn ?? '',
                ),
                const SizedBox(
                  height: 10,
                ),
                _CustomRichText(
                  title1: strings.amount_value,
                  value: (request.loanAmount ?? '0.0') ,
                ),
                if(type != EmployeeServicesStatus.rejected)
                  InstallmentDetails(request: request),

                if(type == EmployeeServicesStatus.rejected && request.description != null && request.description!.isNotEmpty)
                WarningWidget(warningText: request.createdOn ?? '')
              ],
            ),
          ),

          const SizedBox(
            height: 8,
          ),
          const Divider(
            color: kGrey_DF,
            thickness: 1,
            endIndent: 18,
            height: 1,
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
