import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/bail_requests/widgets/title_icon_services.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/texts/row_rich_texts.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../common/domain/entities/bail_requests/index.dart';
import '../../../../common/components/base/base_stateless_widget.dart';
import 'bail_terms_and_conditions.dart';

class BailRequestItem extends BaseStatelessWidget {
  final int type;
  final BailRequest request;
  final List<BailTermAndCondition> termsAndConditions;
  final Function() onAccept;
  final Function() onReject;
  BailRequestItem({
    Key? key,
    required this.type,
    required this.request,
    required this.termsAndConditions,
    required this.onAccept,
    required this.onReject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kWhite,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 16, top: 10),
        margin: const EdgeInsetsDirectional.only(
          bottom: 14,
          start: 14,
          end: 14,
          top: 8,
        ),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kGrey_DF, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleIconServices(
              title:
                  type == EmployeeServicesStatus.waitingForReview
                      ? strings.bail_application_pending_approval
                      : type == EmployeeServicesStatus.approved
                      ? strings.approved_bail_request
                      : strings.bail_request_denied,
              status: type,
              iconFirstStatus: AppIcons.bail,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CustomRichText(
                    title1: strings.sponsored_name,
                    value: request.freelanceName ?? '',
                  ),
                  const SizedBox(height: 10),
                  _CustomRichText(
                    title1: strings.phone,
                    value: request.phoneNumber?.toString() ?? '',
                  ),
                  const SizedBox(height: 10),
                  _CustomRichText(
                    title1: strings.details,
                    value: request.descriptionRequest ?? '',
                  ),
                  const SizedBox(height: 10),

                  _CustomRichText(
                    title1: strings.loan_amount,

                    value: '${request.totalMoney?.toString() ?? ''}  ',
                  ),
                  const SizedBox(height: 10),
                  _CustomRichText(
                    title1: strings.no_installment,
                    value:
                        '${request.totalInstallment?.toString() ?? ''}  ${strings.months}',
                  ),
                  if (type != EmployeeServicesStatus.waitingForReview)
                    _CustomRichText(
                      title1: strings.status,
                      value: request.statusName ?? '',
                      padding: const EdgeInsets.only(top: 10),
                    ),
                  if (type == EmployeeServicesStatus.rejected)
                    _CustomRichText(
                      title1: strings.reason_refuse,
                      value: request.descriptionReject ?? '',
                      padding: const EdgeInsets.only(top: 10),
                      valueColor: kRed_3B,
                    ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            if (type == 1)
              BailTermsAndConditions(
                termsAndConditions: termsAndConditions,
                onAccept: onAccept,
                onReject: onReject,
              ),
          ],
        ),
      ),
    );
  }
}

class _CustomRichText extends StatelessWidget {
  final String title1;
  final String value;
  final EdgeInsetsGeometry? padding;
  final Color? valueColor;
  const _CustomRichText({
    Key? key,
    required this.title1,
    required this.value,
    this.padding,
    this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomRichText(
      title: title1,
      subTitle: value,
      padding: padding,
      titleStyle: kTextMedium.copyWith(color: kGreen_2, fontSize: 12),
      subTitleStyle: kTextSemiBold.copyWith(
        color: valueColor ?? kBlack.withOpacity(0.7),
        fontSize: 18,
      ),
    );
  }
}
