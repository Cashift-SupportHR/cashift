import 'package:flutter/material.dart';

import '../../../../core/utils/app_icons.dart';
import '../../../presentationUser/resources/colors.dart';
import '../../../presentationUser/resources/constants.dart';
import '../../../shared/components/base_stateless_widget.dart';
import '../../../shared/components/dialogs_manager.dart';
import '../../../shared/components/helper_widgets.dart';
import '../../../shared/components/image_builder.dart';
import '../../../shared/components/options_menu_button.dart';
import '../../../shared/components/underline_widget.dart';
import '../../available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../shared/domain/entities/opportunities/menu_employees_status.dart';
import '../../shared/domain/entities/opportunities/opportunity_details.dart';
import 'popup_menu_employee_item_builder.dart';

class PopupMenuEmployee extends BaseStatelessWidget {
  final OpportunityDetails opportunityDetails;
  final MenuEmployees menuEmployees;
  final Function() onRefresh;
  PopupMenuEmployee({Key? key, required this.opportunityDetails, required this.menuEmployees, required this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OptionsMenuButton(
      options: [
        BuildPopupMenuItemContent(
          title: MenuEmployeesStatus.acceptedOrRejectedStatus.contains(menuEmployees.status) ? strings.approval_order : strings.attendance_update,
          titleStyle: kTextRegular.copyWith(
            fontSize: 12,
            color: kSteal,
          ),
          iconPath: MenuEmployeesStatus.acceptedOrRejectedStatus.contains(menuEmployees.status) ? AppIcons.job : AppIcons.attendanceDeparture,
          iconSize: 28,
          isDivider: false,
        )
      ],
      onSelect: (value) {
        if (MenuEmployeesStatus.acceptedOrRejectedStatus.contains(menuEmployees.status)) {
          DialogsManager.showCustomDialog(
            context,
            AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              actionsPadding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
              contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              insetPadding: const EdgeInsets.all(16),
              content: SizedBox(
                height: 400,
                width: 500,
                child: PopupMenuEmployeeItemBuilder(
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
            child: PopupMenuEmployeeItemBuilder(
              jopName: opportunityDetails.jobName ?? '',
              menuEmployees: menuEmployees,
              opportunityId: opportunityDetails.id ?? 0,
              onRefresh: onRefresh,
            ),
          );
        }
      },
    );
  }
}
