import 'package:flutter/material.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../data/models/fetch_emp_map_prams.dart';
import '../../bloc/filter_emp_map_state.dart';
import '../../bloc/filter_employee_map_cubit.dart';
import 'filter_employee_map_screen.dart';

class FilterEmployeeMapPage extends BaseBlocWidget<
    Initialized<FilterEmpMapState>, FilterEmployeeMapCubit> {

 final Function (FetchEmpMapPrams fetchEmpMapPrams,String cityName, String  jobName) onFilter;

  FilterEmployeeMapPage({super.key, required this.onFilter});


  @override
  void loadInitialData(BuildContext context) {

    bloc.fetchInitialData();
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<FilterEmpMapState> state) {
    return FilterEmployeeMapScreen(
      jobs: state.data.jobs,
      citys: state.data.cities, onFilter: (fetchEmpMapPrams,String cityName, String  jobName) { onFilter(fetchEmpMapPrams,cityName,jobName); },);
  }
}
