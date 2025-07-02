import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/addOpportunity/presentations/pages/add_new_opportunity_page.dart';
import 'package:shiftapp/presentation/adminFeatures/available_opportunities/presentation/widgets/cancel_opportunity_widget_builder.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/presentation/shared/components/helper_widgets.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';
import 'package:shiftapp/presentation/shared/components/underline_widget.dart';
import 'package:shiftapp/core/utils/app_icons.dart';
import '../../../../shared/components/decorations/decorations.dart';
import '../../../shared/domain/entities/opportunities/opportunity.dart';
import '../addopportunityemployee/pages/add_employee_for_opportunity_page.dart';

class BuildPopupMenuButton extends BaseStatelessWidget {
  final Opportunity opportunity;
  final Function()? onRefresh;
  final Function()? onNavigatorToEdit;
  BuildPopupMenuButton({Key? key, required this.opportunity, this.onRefresh, this.onNavigatorToEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return PopupMenuButton(
        icon: Container(
          padding: const EdgeInsets.all(10),
          decoration: Decorations.boxDecorationBorder(
            borderWidth: 0.8,
            borderColor: kPrimary,
            radius: 10,
          ),
          child: kLoadSvgInCirclePath(
            AppIcons.edit,
            height: 24,
            width: 24,
          ),
        ),
        padding: const EdgeInsets.all(0),
        itemBuilder: (ctx) => [
          PopupMenuItem(
              value: 1,
              child: BuildPopupMenuItemContent(
                title: strings.edit_opportunity,
                iconPath: AppIcons.editOpportunity,
              )),
          PopupMenuItem(
            value: 2,
            child: BuildPopupMenuItemContent(
              title: strings.add_applicant,
              iconPath: AppIcons.job,
            ),
          ),
          PopupMenuItem(
            value: 3,
            child: BuildPopupMenuItemContent(
              title: strings.cancel_opportunity,
              iconPath: AppIcons.cancelOpportunity,
            ),
          ),
        ],
        onSelected: (value) {
          if (value == 1) {
            if (onNavigatorToEdit != null) {
              onNavigatorToEdit!();
            } else {
              AddNewOpportunityPage.push(context, opportunity: opportunity, onSuccess: () {});
            }
          } else if (value == 2) {
            addEmployeeModelSheet(context);
          } else if (value == 3) {
            showDialogCancelOpportunity(context, opportunityId: opportunity.id ?? 0, onRefresh: onRefresh ?? () {});
          }
        },
      );
    });
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
      child: AddEmployeeForOpportunityPage(opportunityId: opportunity.id ?? 0, onRefresh: onRefresh ?? () {}),
    );
  }
}

class BuildPopupMenuItemContent extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String? iconPath;
  final double? iconSize;
  final bool? isDivider;
  const BuildPopupMenuItemContent({Key? key, required this.title, this.iconPath, this.isDivider = true, this.iconSize, this.titleStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (iconPath != null) ...[
              kLoadSvgInCirclePath(iconPath!, height: iconSize, width: iconSize),
              const SizedBox(
                width: 8,
              ),
            ],
            Text(
              title,
              style: titleStyle ?? kTextLabelNormal.copyWith(color: kPrimary, fontSize: 12),
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
