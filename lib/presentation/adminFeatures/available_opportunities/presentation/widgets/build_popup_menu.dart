import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/addOpportunity/presentations/pages/add_new_opportunity_page.dart';
import 'package:shiftapp/presentation/adminFeatures/available_opportunities/presentation/widgets/cancel_opportunity_widget_builder.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/helper_widgets.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/common/components/underline_widget.dart';
import 'package:shiftapp/utils/app_icons.dart';
import '../../../../../common/components/decorations/decorations.dart';
import '../../../../../common/components/options_menu_button.dart';
import '../../../shared/domain/entities/opportunities/opportunity.dart';
import '../addopportunityemployee/pages/add_employee_for_opportunity_page.dart';

class BuildPopupMenuOpportunity extends BaseStatelessWidget {
  final Opportunity opportunity;
  final Function()? onRefresh;
  final Function()? onNavigatorToEdit;
  List<NavItem> data;
  BuildPopupMenuOpportunity(
      {Key? key,
      required this.data,
      required this.opportunity,
      this.onRefresh,
      this.onNavigatorToEdit})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextBold.copyWith(fontSize: 10, color: kGreen_54);
    double iconSize = 20;

    return data.isEmpty?SizedBox(): OptionsMenuButton(
      options: data
          .map(
            (e) => BuildPopupMenuItemContent(
              title: e.navName ?? "",
              titleStyle: titleStyle,
              iconSize: iconSize,
              isDivider: false,
            ),
          )
          .toList(),
      onSelect: (value) async {
        if (data[value].navCode == "editopportunity") {
          if (onNavigatorToEdit != null) {
            onNavigatorToEdit!();
          } else {
            AddNewOpportunityPage.push(context,
                opportunity: opportunity, onSuccess: () {});
          }
        } else if (data[value].navCode == "addopportunity") {
          addEmployeeModelSheet(context);
        } else if (data[value].navCode == "cancelopportunity") {
          showDialogCancelOpportunity(context,
              opportunityId: opportunity.id ?? 0,
              onRefresh: onRefresh ?? () {});
        }
      },
    );
  }

  addEmployeeModelSheet(BuildContext context) {
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
          opportunityId: opportunity.id ?? 0, onRefresh: onRefresh ?? () {}),
    );
  }
}

class BuildPopupMenuItemContent extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String? iconPath;
  final double? iconSize;
  final bool? isDivider;
  const BuildPopupMenuItemContent(
      {Key? key,
      required this.title,
      this.iconPath,
      this.isDivider = true,
      this.iconSize,
      this.titleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (iconPath != null) ...[
              kLoadSvgInCirclePath(iconPath!,
                  height: iconSize, width: iconSize),
              const SizedBox(
                width: 8,
              ),
            ],
            Text(
              title,
              style: titleStyle ??
                  kTextLabelNormal.copyWith(color: kPrimary, fontSize: 12),
            ),
          ],
        ),
        if (isDivider!)
          Padding(
            padding: const EdgeInsets.only(top: 12.5),
            child: const Divider(
              color: kGrey_DF,
              thickness: 1,
              height: 1,
            ),
          )
      ],
    );
  }
}
