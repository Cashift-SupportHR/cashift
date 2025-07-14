import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/employeeMap/presentation/pages/filter/filter_employee_map_page.dart';
import 'package:shiftapp/common/components/helper_widgets.dart';

import '../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../presentationUser/common/common_state.dart';
import '../../../../../common/components/base/base_widget_bloc.dart';
import '../../data/models/fetch_emp_map_prams.dart';
import '../../domain/entities/EmpMap.dart';
import '../bloc/search_employee_map_cubit.dart';
import 'search_employee_map_screen.dart';

class SearchEmployeeMapPage
    extends BaseBlocWidget<Initialized<EmpMap>, SearchEmployeeMapCubit> {
  @override
  void loadInitialData(BuildContext context) {
    city = strings.all_city;
    job = strings.all_job;
    bloc.fetchInitialData(FetchEmpMapPrams());
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  String? title(BuildContext context) {
    // TODO: implement title
    return  getArguments(context);
  }
  TextEditingController controller = TextEditingController();
  String? city;
  String? job;
  @override
  Widget build(BuildContext context) {
    return mainFrame(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFieldSearchJob(
            title: strings.search,
            controller: controller,
            readOnly: true,
            onTap: () {
              showAppModalBottomSheet(
                  isDivider: false,
                  isScrollControlled: false,
                  title: strings.filter,
                  context: context,
                  child: FilterEmployeeMapPage(
                    onFilter:
                        (fetchEmpMapPrams, String cityName, String jobName) {
                      bloc.fetchInitialData(fetchEmpMapPrams);
                      city = cityName;
                      job = jobName;
                      Navigator.pop(context);
                    },
                  ));
            },
          ),
        ),
        Expanded(child: buildConsumer(context))
      ],
    ));
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<EmpMap> state) {
    return SearchEmployeeMapScreen(
        data: state.data, city: city ?? strings.all_city, job: job ?? strings.all_job);
  }
}
