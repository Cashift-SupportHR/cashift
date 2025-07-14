import 'package:flutter/cupertino.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/app_widgets.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/error_handler_widget.dart';

import '../../../../../../common/data/exceptions/empty_list_exception.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../domain/entities/employee_opportunity.dart';
import '../widgets/employee_opportunity_item.dart';

class EmployeesOpportunitiesScreen extends BaseStatelessWidget {
  final List<EmployeeOpportunity> employees;
  final StreamStateInitial<List<EmployeeOpportunity>?> employeesStream;
  final Function(List<EmployeeOpportunity>) onSelectedEmployee;

  EmployeesOpportunitiesScreen(
      {Key? key,
      required this.employees,
      required this.employeesStream,
      required this.onSelectedEmployee})
      : super(key: key);

  List<EmployeeOpportunity> employeesSelected = [];
  StreamStateInitial<bool> isSelectedStream = StreamStateInitial();

  @override
  Widget build(BuildContext context) {
    // List<EmployeeOpportunity> employees = this.employees;
    checkIfSelected();
    return
    Column(
      children: [
        Expanded(
          child: StreamBuilder<List<EmployeeOpportunity>?>(
              stream: employeesStream.stream,
              builder: (context, snapshot) {
                employeesSelected = snapshot.data ?? [];
                isSelectedStream.setData(employeesSelected.isNotEmpty);
                print('employees is ${employees.length}');
                print('snapshot.data is ${snapshot.data?.length}');
                return
                  (employees.isEmpty)
                    ? ErrorPlaceHolderWidget(
                        exception: EmptyListException(),
                )
                    :
                  ListView.builder(
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      print('index is ${employeesSelected.contains(employees[index])}');
                      return EmployeeOpportunityItem(
                          value: employeesSelected.contains(employees[index]),
                          employee: employees[index],
                          onSelectedEmployee: (employee) {
                            print('employee $employee');
                            if (employeesSelected.contains(employee)) {
                              employeesSelected.remove(employee);
                            } else {
                              employeesSelected.add(employee);
                            }
                            isSelectedStream.setData(employeesSelected.isNotEmpty);
                            print('on employees is $employeesSelected');
                          });
                    });
              }),
        ),
        SizedBox(height: 16),
        saveButton(),
      ],
    );
  }

  Widget saveButton() {
    return StreamBuilder(
      stream: isSelectedStream.stream,
      builder: (context, isSelect) {
        return AppCupertinoButton(
          text: strings.save_button,
          radius: BorderRadius.circular(8),
          margin: const EdgeInsets.all(16),
          onPressed: isSelect.data == true ? () {
            onSelectedEmployee(employeesSelected);
          } : null,
        );
      }
    );
  }

  checkIfSelected() {
    if (employees.any((element) => element.checked == true)) {
      employeesSelected =
          employees.where((element) => element.checked == true).toList();
      employeesStream.setData(employeesSelected);
    }
    print('employeesSelected is $employeesSelected');
  }
}
