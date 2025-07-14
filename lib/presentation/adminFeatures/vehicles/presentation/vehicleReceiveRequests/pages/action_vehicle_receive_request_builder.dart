import 'package:flutter/material.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/common/components/helper_widgets.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/vehiclesOperation/domain/entities/receive_vehicle_details.dart';
import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../../../common/components/tabview/tab_bar_view_widget.dart';
import '../../../../../../common/components/text_field/text_field_search.dart';
import '../../../data/models/action_vehicle_receive_request_params.dart';
import '../../../domain/entities/vehicle_receive_request.dart';
import '../bloc/action_vehicle_receive_request_cubit.dart';
import '../bloc/vehicle_receive_requests_cubit.dart';
import 'action_vehicle_receive_request_bottom_sheet.dart';
import 'vehicle_receive_requests_screen.dart';

class ActionVehicleReceiveRequestBuilder extends BaseBlocWidget<
    Initialized<InitializeActionUserRequests>, ActionVehicleReceiveRequestCubit> {
  final VehicleReceiveRequest item;
  final Function() onRefresh;
  ActionVehicleReceiveRequestBuilder({required this.item, required this.onRefresh});

  static show(BuildContext context,
      {required VehicleReceiveRequest item, required Function() onRefresh}) {
    showAppModalBottomSheet(
        context: context,
        title: context.getStrings().action_taken,
        child: ActionVehicleReceiveRequestBuilder(
          onRefresh: onRefresh,
          item: item,
        ),
    );
  }

  @override
  loadInitialData(BuildContext context) {
    bloc.fetchInitialData(item.projectId ?? 0);
  }


  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<InitializeActionUserRequests> state) {
    return ActionVehicleReceiveRequestsBottomSheet(
      data: state.data,
      onSave: (ActionVehicleReceiveRequestParams params) {
        params.vehicleHandoverId = item.vehicleComponentHandoverId;
        params.handoverId = item.vehicleHandoverId;
        params.type = item.codeType;
        bloc.actionVehicleReceiveRequest(params);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    onRefresh();
  }

}
