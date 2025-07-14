import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';

import '../../../../../../presentationUser/common/common_state.dart';
import '../../../../../../shared/components/stepper/custom_linear_step_indicator.dart';

 import '../../../../data/models/constract_add_emp.dart';
import 'emp_file/screen/emp_file_page.dart';
import 'ifo_emp/emp_info_page.dart';
import 'new_emp/add_new_employees_page.dart';
import '../../../../domain/entities/index.dart';

class MainAddEmpPage extends BaseStatelessWidget {
  MainAddEmpPage({
    Key? key,
  }) : super(key: key);

  final PageController pageController = PageController(initialPage: 0);
  final StreamStateInitial<int> pageStream = StreamStateInitial();

  @override
  Widget build(BuildContext context) {
    ConstractAddEmp data = getArguments(context);

    return AppScaffold(
      title:  strings.add_cashifters,
      body: CustomLinearStepIndicator(
        icons: [],
        labels: [
          strings.employee_data,
          strings.attachments,
          strings.add_cashifters,
        ],
        pages: [

          EmployeeInfoPage(
            freelancerId: data.empId ?? 0,
            isEdit: false,
            onPrevious: () {
              Navigator.pop(context);
            },
            onNext: () {
              animateToPage(1);
            },
          ),
          EmployeeFilePage(
            onPrevious: () {
              animateToPage(0);
            },
            onNext: () {
              animateToPage(2);
            },
            freelancerId: data.empId ?? 0, isEdit: false,
          ),
          AddNewEmployeesPage(
            onPrevious: () {
              animateToPage(1);
            },
            freeLancerInfoId: data.empId ?? 0,

          ),

        ],
        pageStream: pageStream,
        pageController: pageController,
        onPageChanged: (index) {},
      ),
    );
  }

  animateToPage(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  syncSavedID(id) {
    return id;
  }
}


