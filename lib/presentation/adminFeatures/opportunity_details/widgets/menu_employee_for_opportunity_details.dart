import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../common/components/base/base_stateless_widget.dart';
import '../../../../common/components/error_handler_widget.dart';
import '../../../../common/components/helper_widgets.dart';
import '../../../../common/components/texts/row_rich_texts.dart';
import '../../../../common/components/underline_widget.dart';
import '../../available_opportunities/presentation/addopportunityemployee/pages/add_employee_for_opportunity_page.dart';
import '../../shared/domain/entities/opportunities/menu_employees_status.dart';
import '../../shared/domain/entities/opportunities/opportunity_details.dart';
import 'popup_menu_employee.dart';

class MenuEmployeeForOpportunityDetails extends BaseStatelessWidget {
  final OpportunityDetails opportunityDetails;
  final ScrollController scrollController;
  final Function() onRefreshOpportunityDetails;
  MenuEmployeeForOpportunityDetails({Key? key, required this.opportunityDetails, required this.scrollController, required this.onRefreshOpportunityDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return opportunityDetails.menuEmployees!.isEmpty
        ? ErrorPlaceHolderWidget(
            error: strings.not_found_applicants,
            buttonName: strings.add_applicant,
            color: kBackground,
            onClickReload: () => addEmployeeModelSheet(context, onRefreshOpportunityDetails: onRefreshOpportunityDetails),
          )
        : ListView.builder(
            controller: scrollController,
            itemCount: opportunityDetails.menuEmployees!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              MenuEmployees menuEmployees = opportunityDetails.menuEmployees![index];
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromRGBO(30, 134, 111, 0.3)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    MenuEmployeesStatus.allStatus.contains(menuEmployees.status)
                        ? PopupMenuEmployee(opportunityDetails: opportunityDetails, menuEmployees: menuEmployees, onRefresh: onRefreshOpportunityDetails)
                        : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RowRichTexts(
                            padding: EdgeInsets.zero,
                            child: SizedBox(
                              child: _CustomRichText(
                                title: strings.employee_name,
                                subTitle: menuEmployees.employeeName ?? '',
                              ),
                            ),
                            subChild: _CustomRichText(
                              title: strings.qualification,
                              subTitle: menuEmployees.qualification ?? '',
                            ),
                          ),
                          RowRichTexts(
                            padding: EdgeInsets.zero,
                            child: _CustomRichText(
                              title: strings.city,
                              subTitle: menuEmployees.cityName ?? '',
                            ),
                            subChild: _CustomRichText(
                              title: strings.status,
                              subTitle: menuEmployees.statusName ?? '',
                            ),
                          ),
                          RowRichTexts(
                            padding: EdgeInsets.zero,
                            child: _CustomRichText(
                              title: strings.id_number,
                              subTitle: menuEmployees.idNumber ?? '',
                            ),
                            subChild: _CustomRichText(
                              title: strings.mobile_number,
                              subTitle: menuEmployees.phoneNumber ?? '',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }

  addEmployeeModelSheet(BuildContext context, {required Function() onRefreshOpportunityDetails}) {
    showAppModalBottomSheet(
      context: context,
      isScrollControlled: true,
      title: strings.add_employee_on_opportunity,
      isDivider: false,
      titleWidget: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              strings.add_employee_on_opportunity,
              style: kTextBold.copyWith(color: kPrimary),
            ),
            const UnderlineWidget(),
          ],
        ),
      ),
      child: AddEmployeeForOpportunityPage(
        opportunityId: opportunityDetails.id ?? 0,
        onRefresh: onRefreshOpportunityDetails,
      ),
    );
  }
}

class _CustomRichText extends StatelessWidget {
  final String title;
  final String subTitle;

  const _CustomRichText({Key? key, required this.title, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, top: 12, bottom: 12),
      child: CustomRichText(
        title: title,
        subTitle: subTitle,
        titleStyle: kTextMediumPrimary.copyWith(
          fontSize: 10,
        ),
        subTitleStyle: kTextRegular.copyWith(
          fontSize: 10,
          color: kBattleShipGrey2,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
