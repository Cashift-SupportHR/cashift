import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/opportunity_details/applied_details/pages/applicants_details/applied_details_page.dart';
import 'package:shiftapp/presentation/adminFeatures/opportunity_details/widgets/menu_employee_for_opportunity_details.dart';
import 'package:shiftapp/presentation/adminFeatures/opportunity_details/widgets/popup_menu_employee.dart';
import 'package:shiftapp/presentation/adminFeatures/opportunity_details/widgets/popup_menu_employee_item_builder.dart';
import 'package:shiftapp/presentation/adminFeatures/opportunity_details/widgets/popup_menu_employee_item_builderV2.dart';

import '../../../../utils/app_icons.dart';
import '../../../presentationUser/resources/colors.dart';
import '../../../presentationUser/resources/constants.dart';
import '../../../../common/components/base/user_info_widget_with_icon.dart';
import '../../../../common/components/base/base_stateless_widget.dart';
import '../../../../common/components/dialogs/block_employee_dialog.dart';
import '../../../../common/components/decorations/decorations.dart';
import '../../../../common/components/dialogs_manager.dart';
import '../../../../common/components/helper_widgets.dart';
import '../../../../common/components/image_builder.dart';
import '../../../../common/components/options_menu_button.dart';
import '../../../../common/components/texts/icon_double_text.dart';
import '../../../../common/components/texts/list_row_texts_icons_v2.dart';
import '../../../../common/components/underline_widget.dart';
import '../../available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../employmentManagement/data/models/add_block_employee_params.dart';
import '../../employmentManagement/data/models/popup_employment_management_dto.dart';
import '../../shared/domain/entities/opportunities/AppliedData.dart';
import '../../shared/domain/entities/opportunities/OpportunityDetailsData.dart';
import '../../shared/domain/entities/opportunities/applicant_role.dart';
import '../../shared/domain/entities/opportunities/index.dart';
import '../../shared/domain/entities/opportunities/menu_employees_status.dart';

class ApplicantItem extends BaseStatelessWidget {
  final AppliedData menuEmployee;
  final Function() onRefresh;
  OpportunityDetailsData opportunityDetails;
  final List<NavItem> navItems;
  Function(AddBlockEmployeeParams addBlockEmployeeParams) onBlockEmployee;

  ApplicantItem(
      {Key? key,
      required this.menuEmployee,
      required this.onBlockEmployee,
      required this.opportunityDetails,
      required this.onRefresh,
      required this.navItems,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: Decorations.shapeDecoration(radius: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: FittedBox(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    child: UserInfoWidgetWithIcon(
                      image: menuEmployee.freelanceIcon ?? '',
                      name: menuEmployee.employeeName ?? '',
                      phone: menuEmployee.phoneNumber ?? '',
                    ),
                  ),
                  if (navItems.isNotEmpty)
                  _OptionsMenuButton(
                    menuEmployees: menuEmployee,
                    opportunityDetails: opportunityDetails,
                    onBlockEmployee: onBlockEmployee,
                    onRefresh: onRefresh,
                    navItems: navItems,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListRowTextsIconsV2(
              iconSize: 18,
              // iconColor: kPrimary,
              flex: 6,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
              crossAxisAlignment: CrossAxisAlignment.start,
              items: getListData(context),
            ),
          ),
          footer(),
        ],
      ),
    );
  }

  List<ListRowTextItem> getListData(BuildContext context) {
    return [
      ListRowTextItem(
        icon: AppIcons.a1,
        title: strings.qualification,
        value: menuEmployee.qualification == null ||
                menuEmployee.qualification == ''
            ? '-'
            : menuEmployee.qualification ?? '_',
      ),
      ListRowTextItem(
        icon: AppIcons.city2,
        title: strings.city,
        value: menuEmployee.cityName == null || menuEmployee.cityName == ''
            ? '-'
            : menuEmployee.cityName ?? '_',
      ),
      ListRowTextItem(
        icon: AppIcons.a3,
        title: strings.status,
        value:
            menuEmployee.statusName == null || menuEmployee.statusName == ''
                ? '-'
                : menuEmployee.statusName ?? '_',
      ),
    ];
  }

  Widget footer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: Decorations.bottomRadius(color: kGreen_f4),
      child: IconDoubleText(
        icon: AppIcons.a4,
        name: strings.opportunity_value,
        value:
            '${menuEmployee.deservedAmount == null || menuEmployee.deservedAmount == '' ? '-' : menuEmployee.deservedAmount ?? '_'} ${strings.rs}',
        nameStyle: kTextBold.copyWith(fontSize: 14, color: kPrimary),
        valueStyle: kTextSemiBold.copyWith(fontSize: 22, color: kOrange00),
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final AppliedData menuEmployees;
  OpportunityDetailsData opportunityDetails;
  Function() onRefresh;
  final List<NavItem> navItems;
  Function(AddBlockEmployeeParams addBlockEmployeeParams) onBlockEmployee;

  _OptionsMenuButton(
      {required this.menuEmployees,
      required this.onBlockEmployee,
      required this.onRefresh,
      required this.opportunityDetails,
      required this.navItems});

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextBold.copyWith(fontSize: 10, color: kGreen_54);
    double iconSize = 16;
    return OptionsMenuButton(
      title: Padding(
        padding: const EdgeInsetsDirectional.only(
            end: 15, top: 15, start: 5, bottom: 10),
        child: kLoadSvgInCirclePath(
          AppIcons.menu,
          height: 6,
          width: 6,
        ),
      ),
      options: navItems
          .map(
            (e) => BuildPopupMenuItemContent(
              title: e.navName ?? '',
              titleStyle: titleStyle,
              isDivider: navItems.last != e,
            ),
          )
          .toList(),
      onSelect: (value) async {
        if (navItems[value].navCode == ApplicantRole.editAttendance) {
          if (MenuEmployeesStatus.acceptedOrRejectedStatus
              .contains(menuEmployees.status)) {
            DialogsManager.showCustomDialog(
              context,
              barrierColor: Colors.white.withOpacity(.5),
              AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: kWhite,
                actionsPadding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                insetPadding: const EdgeInsets.all(16),
                content: Container(
                  height: 400,
                  width: 500,
                  color: kWhite,
                  child: PopupMenuEmployeeItemBuilderV2(
                    jopName: opportunityDetails.jobName ?? '',
                    menuEmployees: menuEmployees,
                    opportunityId: opportunityDetails.id ?? 0,
                    onRefresh: onRefresh,
                  ),
                ),
              ),
            );
          } else {
            showAppModalBottomSheet(
              context: context,
              isScrollControlled: false,
              isDivider: false,
              backgroundColor: kWhite,
              titleWidget: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      strings.attendance_update,
                      style: kTextBold.copyWith(color: kPrimary, fontSize: 18),
                    ),
                    const UnderlineWidget(),
                  ],
                ),
              ),
              child: PopupMenuEmployeeItemBuilderV2(
                jopName: opportunityDetails.jobName ?? '',
                menuEmployees: menuEmployees,
                opportunityId: opportunityDetails.id ?? 0,
                onRefresh: onRefresh,
              ),
            );
          }
        } else if (navItems[value].navCode ==
            ApplicantRole.freelanceDetails) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ApplicantsDetailsPage(
                      id: menuEmployees.id ?? 0,
                    )),
          );
        } else if (navItems[value].navCode ==
            ApplicantRole.blockFreelance) {
          DialogsManager.customDialog(
            context,
            child: BlockEmployeeDialog(
              popup: BlockDto(),
              onConfirm: (value) {
                Navigator.pop(context);
                onBlockEmployee(
                  AddBlockEmployeeParams(
                    freeLancerId: menuEmployees.id ?? 0,
                    banReason: value,
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
