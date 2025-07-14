import 'package:flutter/material.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/common/components/helper_widgets.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../../../../vehicles/data/models/action_vehicle_receive_request_params.dart';
import '../../../data/models/action_follow_up_violation_params.dart';
import '../../../domain/entities/follow_up_violation.dart';
import '../../../domain/entities/general_violation.dart';
import '../bloc/action_follow_up_violation_cubit.dart';
import 'action_follow_up_violation_bottom_sheet.dart';

class ActionVehicleReceiveRequestBuilder extends BaseBlocWidget<
    Initialized<List<CommonListItem>>, ActionFollowUpViolationsCubit> {
  final FollowUpViolation item;
  final Function() onRefresh;
  ActionVehicleReceiveRequestBuilder({required this.item, required this.onRefresh});

  static show(BuildContext context,
      {required FollowUpViolation item, required Function() onRefresh}) {
    showAppModalBottomSheet(
        context: context,
        title: context.getStrings().take_action,
        child: ActionVehicleReceiveRequestBuilder(
          onRefresh: onRefresh,
          item: item,
        ),
    );
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<List<CommonListItem>> state) {
    return ActionVehicleReceiveRequestsBottomSheet(
      priorityLevels: state.data,
      onSave: (ActionFollowUpViolationParams params) {
        params.contractViolationId = item.violationId;
        bloc.actionFollowUpViolation(params);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    onRefresh();
  }
}
