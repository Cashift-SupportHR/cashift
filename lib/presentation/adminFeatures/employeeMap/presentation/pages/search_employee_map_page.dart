import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/presentation/adminFeatures/employeeMap/presentation/pages/filter/filter_employee_map_page.dart';
import 'package:shiftapp/presentation/shared/components/helper_widgets.dart';

import '../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../presentationUser/common/common_state.dart';
import '../../../../shared/components/base_widget_bloc.dart';
import '../../data/models/fetch_emp_map_prams.dart';
import '../../domain/entities/EmpMap.dart';
import '../../domain/entities/FreeLncerLocations.dart' show FreeLncerLocations;
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
    return strings.cashifter_on_map;
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
                    onFilter: (
                      fetchEmpMapPrams,
                      String cityName,
                      String jobName,
                    ) {
                      bloc.fetchInitialData(fetchEmpMapPrams);
                      city = cityName;
                      job = jobName;
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(child: buildConsumer(context)),
        ],
      ),
    );
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<EmpMap> state) {
    return SearchEmployeeMapScreen(
      data: getInitialState(state).data,
      city: city ?? strings.all_city,
      job: job ?? strings.all_job,
    );
  }

  Initialized<EmpMap> getInitialState(Initialized<EmpMap> state) {
    // LatLng comes from link when user click on dynamic link, check the LinkHandler class
    final args = getArguments(context);
    if (args != null && args is LatLng) {
      print('args latitude ${args.latitude} , longitude ${args.longitude}');
      state.data.freeLncerLocations?.add(
        FreeLncerLocations(
          id: 0,
          lat: args.latitude,
          lng: args.longitude,
          isFirstCameraZoom: true,
          gender: true,
          isActive: true,
        ),
      );
    }
    return state;
  }
}
