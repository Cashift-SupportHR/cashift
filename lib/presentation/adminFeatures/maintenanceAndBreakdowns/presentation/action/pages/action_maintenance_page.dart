import 'package:flutter/material.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/common/components/helper_widgets.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../../../common/components/underline_widget.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../../../data/models/action_follow_up_up_maintenance_prams.dart';

import '../../../domain/entities/maintenance.dart';
import '../cubit/action_maintenance_cubit.dart';
import 'action_follow_up_maintenance_screen.dart';

class ActionMaintenancePage extends BaseBlocWidget<
    Initialized<List<CommonListItem>>, ActionMaintenanceBreakdownsCubit> {
  final Maintenance item;
  final Function() onRefresh;
  ActionMaintenancePage({required this.item, required this.onRefresh});

  static show(BuildContext context,
      {required Maintenance item, required Function() onRefresh}) {
    showAppModalBottomSheet(
      context: context,
      isScrollControlled: true,
      topMargin: 240,
      isDivider: false,
      titleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.getStrings().action_taken,
              style: kTextBold.copyWith(color: kPrimary, fontSize: 13)),
          UnderlineWidget(width: 80),
        ],
      ),
      child: ActionMaintenancePage(
        onRefresh: onRefresh,
        item: item,
      ),
    );
  }

  @override
  loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<CommonListItem>> state) {
    return ActionMaintenanceScreen(
      priorityLevels: state.data,
      onSave: (ActionFollowUpUpMaintenancePrams params) {
        params.faultsMaintenanceId = item.fautMaintenanceId;
        bloc.actionFollowUpUpMaintenance(params);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    Navigator.pop(context, true);
    onRefresh();
  }
}
