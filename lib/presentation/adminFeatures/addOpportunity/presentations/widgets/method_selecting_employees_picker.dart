import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../../core/services/routes.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/bottom_sheet/list_picker_widget.dart';
import '../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../data/models/employees_opportunity_params.dart';
import '../../domain/entities/MethodSelectEmployee.dart';
import '../../domain/entities/employee_opportunity_type.dart';
import '../employees_opportunities/pages/employees_opportunities_page.dart';
import 'accept_opportunity_method_item.dart';
import '../../../../../common/components/text_field/build_text_field_item.dart';

class MethodSelectingEmployeesPicker extends BaseStatelessWidget {
  final int? opportunityId;
  final int? companyId;
  final bool isClear;
  final List<int>? employeesIds;
  final int? initialId;
  final int? isAllEmployees;
  final List<EmployeeOpportunityType> data;
  final dynamic Function(MethodSelectEmployee) onSelectItem;

  MethodSelectingEmployeesPicker(
      {Key? key,
      this.opportunityId,
      this.companyId,
      required this.onSelectItem,
      this.employeesIds,
      this.initialId,
      this.isAllEmployees,
      this.isClear = false,
      required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller =  TextEditingController(text: getInitialName());

    return BuildTextFieldItem(
      title: strings.method_selecting_employees,
      suffixIcon: Icons.keyboard_arrow_down,
      controller: controller,
      onTap: () {
        ListPickerWidget.showPicker(
            context: context,
            setSearch: false,
            title: strings.select_method_selecting_employees,
            isScrollControlled: true,
            itemBuilder: (context, item) {
              return AcceptOpportunityMethodItem(
                data: data[item.index],
              );
            },
            items: data.map((e) => Item(index: data.indexOf(e), value: e.name ?? ''),)
                .toList(),
            onSelectItem: (item) async {
              EmployeeOpportunityType employeeType = data[item.index];
              controller.text = employeeType.name ?? '';

              // for clear the selected employees in the employeesOpportunitiesPage when the user select the same item
              ArgsEmployeesOpportunities argsData = ArgsEmployeesOpportunities(1, []);
              // params for get the employees in the employeesOpportunitiesPage
              EmployeesOpportunityParams params = EmployeesOpportunityParams(
                approvelLevelId: 0,
                actionType: opportunityId == null ? 1 : 2,
                oppId: opportunityId ?? 0,
                isAllEmployees: isAllEmployees,
              );
              params.companyId = companyId;
              params.approvelLevelId = employeeType.id;
              params.title = employeeType.name;
              List<int> employeesIds = [];
              // if code is not equal 2-2 go to employeesOpportunitiesPage and select employees to assign to the opportunity then return to this page
              if (employeeType.code != MethodSelectEmployee.allEmployees) {
                print('employeeType is ${companyId}');
                final args = await Navigator.pushNamed(
                    context, Routes.employeesOpportunitiesPage,
                    arguments: params);
                if (args != null && args is ArgsEmployeesOpportunities) {
                  argsData = args;
                  employeesIds = args.employees.map((e) => e.id!).toList();
                  print('Sheet employeesIds is ${employeesIds}');
                }
              }
              onSelectItem(MethodSelectEmployee(
                employeeType: employeeType,
                isAll: argsData.isAll,
                employeesIds: employeesIds,
                // isSelectEmployee refer if the user go the employeesOpportunitiesPage and select employees to assign to the opportunity
                isSelectEmployee: employeeType.code != MethodSelectEmployee.allEmployees,
              ));
            },
        );
      },
    );
  }

  String getInitialName() {
    print('initialId is ${initialId}');
    if (initialId == null) return '';
    // if (data.any((element) => element.id == initialId) == false) return '';
    return data.firstWhereOrNull((element) => element.id == initialId)?.name ?? '';
  }
}
