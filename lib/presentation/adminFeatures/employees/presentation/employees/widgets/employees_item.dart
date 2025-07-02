import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/employees/presentation/addNewEmployees/pages/add/emp_file/screen/emp_file_page.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';
import 'package:shiftapp/presentation/shared/components/texts/list_row_texts_icons.dart';
import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../shared/components/decorations/decorations.dart';
import '../../../../../shared/components/options_menu_button.dart';
import '../../../../available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../../domain/entities/EmpChasifterData.dart';
import '../../addNewEmployees/pages/add/ifo_emp/emp_info_page.dart';
import '../../addNewEmployees/pages/add/new_emp/add_new_employees_page.dart';
import '../pages/attendance/attendance_employee_tabs.dart';

class EmployeesItem extends BaseStatelessWidget {
  final EmpChasifter item;
  final bool details;
  final Function() onRefresh;
  final Function(String) onChangeStatus;
  final Function(String) onDeleteUser;

  EmployeesItem(
      {Key? key,
      required this.item,
      required this.details,
      required this.onRefresh,
      required this.onChangeStatus,
      required this.onDeleteUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      padding: EdgeInsets.all(5),
      decoration: Decorations.decorationTabs,
      child: Column(
        children: [
          Row(
            children: [
              kBuildCircleImage(item.image ?? ''),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      item.name ?? '',
                      style: kTextBold.copyWith(color: kBlack, fontSize: 16),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: kGrey62,
                          size: 12,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          item.phone ?? '',
                          style: kTextMedium.copyWith(
                              color: kGrey62, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              details == true
                  ? SizedBox()
                  : _OptionsMenuButton(
                      onRefresh: onRefresh,
                      item: item,
                      onDeleteUser: onDeleteUser,
                    )
            ],
          ),
          ListRowTextsIcons(
            padding: EdgeInsetsDirectional.only(
                start: 0, top: 10, bottom: 6, end: 5),
            icons: [
              AppIcons.emp1,
              AppIcons.emp2,
              AppIcons.emp3,
              AppIcons.emp4,
            ],
            titles: [
              strings.project,
              strings.working_time,
              strings.rest_day,
              strings.calculation_method,
            ],
            values: [
              item.projectName ?? '',
              item.shiftName ?? '',
              item.weekDaysString ?? '',
              item.paymentPeriodTypeName ?? '',
            ],
          ),
          item.paymentPeriodTypeName == "يومي" ||
                  item.paymentPeriodTypeName == "daily"
              ? SizedBox()
              : ListRowTextsIcons(
                  iconColor: kOrange00,
                  titleStyle:
                      kTextBold.copyWith(fontSize: 12, color: kOrange00),
                  padding: EdgeInsetsDirectional.only(
                      start: 0, top: 0, bottom: 6, end: 5),
                  icons: [
                    AppIcons.calendarOutline,
                  ],
                  titles: [
                    strings.duration_monthly,
                  ],
                  values: [
                    item.paymentPeriodMonthly ?? '',
                  ],
                ),
        ],
      ),
    );
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final EmpChasifter item;
  final Function() onRefresh;

  final Function(String) onDeleteUser;

  _OptionsMenuButton({
    Key? key,
    required this.item,
    required this.onRefresh,
    // required this.onChangeStatus,
    required this.onDeleteUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextBold.copyWith(fontSize: 10, color: kGreen_54);
    double iconSize = 16;
    return OptionsMenuButton(
      options: [
        BuildPopupMenuItemContent(
          title: strings.edit_employee,
          // iconPath: AppIcons.editPenOutline,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: strings.attachments,
          // iconPath: AppIcons.editPenOutline,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: strings.employee_data,
          // iconPath: AppIcons.editPenOutline,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: strings.attendance_departure,
          //  iconPath: AppIcons.attendanceDeparture,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
      ],
      onSelect: (value) async {
        if (value == 0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddNewEmployeesPage(
                    freeLancerInfoId: item.freelancerInfoId??0,
                        empChasifter: item,
                      )));
        } else if (value == 1) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EmployeeFilePage(
                        freelancerId:  item.freelancerInfoId??0,
                        isEdit: true,
                      )));
        } else if (value == 2) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EmployeeInfoPage(
                        freelancerId:  item.freelancerInfoId??0,
                        isEdit: true,
                      )));
        } else if (value == 3) {
          final isRefresh = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AttendanceEmployeeTabs(
                      item: item,
                    )),
          );
          if (isRefresh != null && isRefresh) {
            onRefresh();
          }
        }
      },
    );
  }
}
