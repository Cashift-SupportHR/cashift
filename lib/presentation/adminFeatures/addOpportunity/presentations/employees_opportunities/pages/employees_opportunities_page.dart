import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';
import 'package:shiftapp/common/components/checkbox/custom_check_box.dart';

import '../../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../../../common/components/texts/underline_text.dart';
import '../../../data/models/employees_opportunity_params.dart';
import '../../../domain/entities/employee_opportunity.dart';
import '../bloc/employees_opportunities_cubit.dart';
import 'employees_opportunities_screen.dart';

class EmployeesOpportunitiesPage extends BaseBlocWidget<
    Initialized<List<EmployeeOpportunity>>, EmployeesOpportunitiesCubit> {

  @override
  bool detectRequiredTasks() {
    return false;
  }

  StreamStateInitial<bool> isAllSelectedStream = StreamStateInitial();
  StreamStateInitial<List<EmployeeOpportunity>?> employeesStream = StreamStateInitial();
  EmployeesOpportunityParams params = EmployeesOpportunityParams();
  @override
  void loadInitialData(BuildContext context) {
     params = getArguments(context);
     print('params is ${params.isAllEmployees}');
     isAllSelectedStream.setData(params.isAllEmployees == 1);
    bloc.fetchEmployeesOpportunities(params);
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return mainFrame(
        body: Column(
          children: [
            TextFieldSearchJob(
              title: strings.search,
              readOnly: false,
              onTap: () {},
              margin: const EdgeInsets.all(16),
              onChanged: (value) {
                bloc.searchByText(value);
              },
            ),
            header(context),
            Expanded(child: buildConsumer(context))
          ],
        ));
  }

  ArgsEmployeesOpportunities args = ArgsEmployeesOpportunities(2, []);
  @override
  Widget buildWidget(BuildContext context, Initialized<List<EmployeeOpportunity>> state) {
    print('state.data is ${state.data}');
    return EmployeesOpportunitiesScreen(
      employees: state.data,
      employeesStream: employeesStream,
      onSelectedEmployee: (employeesSelected) {
        if(employeesSelected.length == state.data.length){
          args = ArgsEmployeesOpportunities(1, employeesSelected);
          print('employeesSelected ${employeesSelected.length} == ${state.data.length}');
          isAllSelectedStream.setData(true);
        } else if(employeesSelected.length < state.data.length){
          args = ArgsEmployeesOpportunities(2, employeesSelected);
          print('employeesSelected < ${employeesSelected.length} < ${state.data.length}');
          isAllSelectedStream.setData(false);
        }
        Navigator.pop(context, args);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    Navigator.pop(context, true);
  }

  @override
  String? title(BuildContext context) => strings.add_new_job_opportunity;

  Widget header(BuildContext context){
 //   print('params.isAllEmployees is ${params.isAllEmployees}');
    EmployeesOpportunityParams params = getArguments(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UnderlineText(
            text: params.title ?? '',
            fontSize: 16,
          ),
          IntrinsicWidth(
            child: StreamBuilder<bool>(
              initialData: params.isAllEmployees == 1,
              stream: isAllSelectedStream.stream,
              builder: (context, snapshot) {
                print('snapshot.data is ${params.isAllEmployees}');
                print('snapshot is ${snapshot.data}');
                return CustomCheckBox(
                  value: snapshot.data,
                  title: strings.all_employees,
                  onChanged: (value) {
                    if(value == true){
                      employeesStream.setData(bloc.employees);
                    } else {
                      employeesStream.setData(null);
                    }
                  },
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}


class ArgsEmployeesOpportunities {
  // 1 - all employees , 2 - employees selected
  final int isAll;
  final List<EmployeeOpportunity> employees;

  ArgsEmployeesOpportunities(this.isAll, this.employees);
}