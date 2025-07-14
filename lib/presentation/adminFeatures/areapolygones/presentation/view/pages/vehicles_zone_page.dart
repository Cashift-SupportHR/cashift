import 'package:flutter/material.dart';
import '../../../../../../core/services/routes.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../../../common/components/text_field/text_field_search.dart';
import '../../../domain/entities/vehicle_zone.dart';
import '../bloc/vehicles_zone_cubit.dart';
import 'vehicles_zone_screen.dart';

class VehiclesZonePage
    extends BaseBlocWidget<Initialized<List<VehicleZone>>, VehiclesZoneCubit> {
  VehiclesZonePage({Key? key}) : super(key: key);

  @override
  loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
    controller.clear();
  }

  @override
  String? title(BuildContext context) {
    return strings.areas;
  }

  TextEditingController controller = TextEditingController();

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: Column(
        children: [
          TitleAndAddNewRequest(
            title: strings.view_areas,
            textButton: strings.add_area,
            onTap: () async {
              final isRefresh =
                  await Navigator.pushNamed(context, Routes.mainAddVehicleZonePage);
              print('isRefresh $isRefresh');
              if (isRefresh == true) {
                loadInitialData(context);
              }
            },
          ),
          TextFieldSearch(
            title: '${strings.search_for}, ${strings.company_name}, ${strings.project_name}, ${strings.shift_name}, ${strings.vehicle}',
            margin: EdgeInsets.only(right: 12, left: 12, bottom: 12),
              isSuffixIcon: false,
            onChanged: (value) {
              bloc.searchByText(value);
            },
          ),
          Expanded(
            child: buildConsumer(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<VehicleZone>> state) {
    return VehiclesZoneScreen(
      data: state.data,
      onRefresh: () {
        loadInitialData(context);
      },
      onEdit: (params) {
        bloc.editVehiclesCoordinates(params);
      },
      onDelete: (id) {
        bloc.deleteVehicleZone(id);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    loadInitialData(context);
  }
}
