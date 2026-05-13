import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/domain/entities/opportunities/opportunity_constants.dart';
import 'package:shiftapp/presentation/adminFeatures/available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import 'package:shiftapp/presentation/adminFeatures/opportunity_details/pages/opportunity_details_page.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/domain/entities/opportunities/opportunity.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/presentation/shared/components/helper_widgets.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';
import 'package:shiftapp/presentation/shared/components/texts/list_row_texts_icons.dart';
import 'package:shiftapp/presentation/shared/components/underline_widget.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../core/services/routes.dart';
import '../../../../../domain/entities/shared/date_formatter.dart';
import '../../../../shared/components/base/user_info_widget.dart';
import '../../../../shared/components/decorations/decorations.dart';
import '../../../../shared/components/options_menu_button.dart';
import '../../../addOpportunity/presentations/pages/add_new_opportunity_page.dart';
import '../addopportunityemployee/pages/add_employee_for_opportunity_page.dart';
import 'build_popup_menu.dart';
import 'cancel_opportunity_widget_builder.dart';
import 'column_texts.dart';

class AvailableOpportunityItemV2 extends BaseStatelessWidget {
  final Opportunity opportunity;
  final Function()? onNavigatorToEdit;
  final Function()? onRefresh;
  final int index;
  List<NavItem> navItem;

  AvailableOpportunityItemV2({
    Key? key,
    required this.opportunity,
    required this.index,
    required this.navItem,
    this.onNavigatorToEdit,
    this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAlias,
      decoration: Decorations.shapeDecorationShadow(),
      child: Column(
        children: [
          HeaderItem(opportunity: opportunity),
          Divider(height: 20),
          CountPeople(opportunity: opportunity),
          body(),
          // Spacer(),
          footer(context),
        ],
      ),
    );
  }

  navigatorToDetails(BuildContext context) async {
    final result = await Navigator.pushNamed(context, Routes.opportunityDetails,
        arguments: OpportunityDetailsPageArgs(
          opportunity: opportunity,
          isShowButtonsAction: (index == 0 || index == 1) ? true : false,
          onRefreshOpportunities: onRefresh,
        ));
    if (result == true) {
      onRefresh!();
    }
  }

  Widget checkStatusOpportunity(int opportunityStatus) {
    if (opportunityStatus == OpportunityStatus.todayOpportunity ||
        opportunityStatus == OpportunityStatus.activeOpportunity) {
      return BuildPopupMenuButton(
          opportunity: opportunity,
          onRefresh: onRefresh,
          onNavigatorToEdit: onNavigatorToEdit);
    } else if (opportunityStatus == OpportunityStatus.expiredOpportunity) {
      return AddEmployeeButton(opportunityId: opportunity.id!);
    } else {
      return const SizedBox();
    }
  }

  Widget body() {
    return ListRowTextsIcons(
      padding: EdgeInsetsDirectional.only(start: 16, top: 5, bottom: 0, end: 5),
      titleStyle: kTextSemiBold.copyWith(color: kPrimary, fontSize: 18),
      valueStyle: kTextRegular.copyWith(
          color: kPaleGray5e, fontSize: 12, overflow: TextOverflow.ellipsis),
      maxLines: 1,
      icons: [
        AppIcons.startTime1,
        AppIcons.endTime1,
        AppIcons.projectName,
      ],
      titles: [
        strings.beginning_work,
        strings.end_work,
        strings.project_name,
      ],
      values: [
        "${opportunity.workingStartDate != null ? DateFormatter.formatDate(DateTime.parse(opportunity.workingStartDate!), 'dd-MM-yyyy hh:mm a') : ''}",
        "${opportunity.workingEndDate != null ? DateFormatter.formatDate(DateTime.parse(opportunity.workingEndDate!), 'dd-MM-yyyy hh:mm a') : ''}",
        opportunity.projectName ?? '',
      ],
    );
  }

  Widget footer(BuildContext context) {
    return Padding(
      padding:
          EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 10, top: 8),
      child: Row(
        children: [
          Expanded(
            child: AppCupertinoButton(
              onPressed: () {
                navigatorToDetails(context);
              },
              radius: BorderRadius.circular(10),
              child: Text(
                strings.show_details,
                style: kTextSemiBold.copyWith(color: kWhite),
              ),
              padding: const EdgeInsets.symmetric(vertical: 13),
            ),
          ),
          SizedBox(
            width: 10,
          ),
         // checkStatusOpportunity(index),
          BuildPopupMenuOpportunity(opportunity: opportunity,   onRefresh: onRefresh,
              onNavigatorToEdit: onNavigatorToEdit,data: navItem,)
        ],
      ),
    );
  }
}

 

class AddEmployeeButton extends BaseStatelessWidget {
  final int opportunityId;

  AddEmployeeButton({Key? key, required this.opportunityId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
          child: AddEmployeeForOpportunityPage(opportunityId: opportunityId),
        );
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(start: 16),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: const Color.fromRGBO(30, 134, 111, 0.65), width: 1),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  kLoadSvgInCirclePath(AppIcons.job),
                  const Icon(
                    Icons.add_circle,
                    color: kRed,
                    size: 12,
                  ),
                ],
              ),
            ),
            Text(
              strings.add_applicant,
              style: kTextRegular.copyWith(color: kBattleShipGrey, fontSize: 6),
            ),
          ],
        ),
      ),
    );
  }
}

class CountPeople extends BaseStatelessWidget {
  final Opportunity opportunity;

  CountPeople({Key? key, required this.opportunity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: opportunity.freelanceApplyCounter?.length,
          itemBuilder: (context, index) {
            return ColumnTexts(
              title: opportunity.freelanceApplyCounter?[index].name ?? "",
              subtitle:
                  opportunity.freelanceApplyCounter?[index].count.toString() ??
                      "",
            );
          }),
    );
  }
}

class HeaderItem extends BaseStatelessWidget {
  final Opportunity opportunity;

  HeaderItem({Key? key, required this.opportunity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
      child: Row(
        children: [
          Expanded(
            child: UserInfoWidget(
              image: opportunity.logoPath ?? '',
              name: opportunity.jobName ?? '',
              subTitle: opportunity.companyName ?? '',
              imageBorder: 3,
              borderColor: kPrimary,
              nameStyle: kTextBold.copyWith(color: kPrimary, fontSize: 16),
              subTitleStyle: kTextRegular.copyWith(
                  color: kBlack.withOpacity(0.7), fontSize: 14),
              imageSize: 55,
            ),
          ),
          CounterRemaining(opportunity: opportunity),
        ],
      ),
    );
  }
}

class CounterRemaining extends BaseStatelessWidget {
  final Opportunity opportunity;

  CounterRemaining({super.key, required this.opportunity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          end: 10, top: 10, bottom: 10, start: 16),
      decoration: Decorations.decorationStartRadius(),
      child: Text(
        '${opportunity.requiredCount}  ${strings.remaining}  ${opportunity.actualNumber} ',
        style: kTextMedium.copyWith(fontSize: 14, color: kWhite),
      ),
    );
  }
}
