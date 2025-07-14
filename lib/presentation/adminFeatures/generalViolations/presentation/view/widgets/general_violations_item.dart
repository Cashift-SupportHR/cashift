import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../adminFeatures/available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../../../../common/components/icons/icon_text.dart';
import '../../../../../../common/components/options_menu_button.dart';
import '../../../../../../common/components/texts/icon_double_text.dart';
import '../../../domain/entities/index.dart';

class GeneralViolationItem extends BaseStatelessWidget {
  final GeneralViolation item;
  final bool details;
  final Function() onRefresh;

  GeneralViolationItem({
    Key? key,
    required this.item,
    required this.details,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      // padding: EdgeInsets.all(10),
      decoration: Decorations.decorationTabs,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          _OptionsMenuButton(
            onRefresh: onRefresh,
            item: item,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                buildIconDoubleText(
                  icon: AppIcons.buildingsOutline,
                  title: strings.company_name,
                  value: item.companyName ?? '',
                ),
                buildIconDoubleText(
                  icon: AppIcons.projectName,
                  title: strings.project_name,
                  value: item.projectName ?? '',
                ),
                buildIconDoubleText(
                  icon: AppIcons.workingPeriodOutline,
                  title: strings.working_period,
                  value: item.shiftName ?? '',
                ),
                buildIconDoubleText(
                  icon: AppIcons.complaint,
                  title: strings.type,
                  value: item.scheduleViolationName ?? '',
                  colorText: kRed_12,
                ),
                buildIconDoubleText(
                  icon: AppIcons.empName,
                  title: strings.employee_name,
                  value: item.employeeName ?? '',
                ),
                detailsButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildIconDoubleText(
      {required String icon, required String title, required String value, Color? colorText}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: IconDoubleText(
        icon: icon,
        name: title + ' :',
        value: value,
        nameStyle: kTextRegular.copyWith(fontSize: 14, color: kPrimary),
        valueStyle: kTextMedium.copyWith(fontSize: 14, color: colorText),
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  GestureDetector detailsButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.generalViolationDetailsPage,
            arguments: item.id);
      },
      child: IconText(
        icon: AppIcons.hazard_details,
        text: strings.show_details,
        textStyle: kTextRegular.copyWith(fontSize: 14, color: kOrange00),
        crossAxisAlignment: CrossAxisAlignment.start,
        isIconLift: true,
        iconSize: 20,
        padding: EdgeInsets.only(top: 5),
      ),
    );
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final GeneralViolation item;
  final Function() onRefresh;

  _OptionsMenuButton({
    Key? key,
    required this.item,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextBold.copyWith(fontSize: 10, color: kGreen_54);
    double iconSize = 16;
    return OptionsMenuButton(

      padding: EdgeInsets.all(10),

      options: [

        BuildPopupMenuItemContent(
          title: strings.edit,
          titleStyle: titleStyle,
          iconSize: iconSize,
          isDivider: false,
        ),
      ],
      onSelect: (value) async {
        if (value == 0) {
          final isRefresh = await Navigator.pushNamed(
              context, Routes.addGeneralViolationPage,
              arguments: item.id);
          if (isRefresh == true) {
            onRefresh();
          }
        }
      },
    );
  }
}
