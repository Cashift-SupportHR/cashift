import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/common/data/models/activity_log/index.dart';

import 'package:shiftapp/presentation/presentationUser/activity_log/pages/activitylog_screen.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

import '../../appliedoffers/cancelOpprtunity/cancel_opportunity_apologizing_page.dart';
import '../bloc/activity_log_cubit.dart';

class ActivityLogListPage extends BaseBlocWidget<
    Initialized<List<NotificationItem>>, ActivityLogCubit> {
  final bool active;

  ActivityLogListPage({Key? key, required this.active}) : super(key: key);

  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchActivityLog(active);
  }

  cancelJob(int id) {
    /**
     *    statusId: isApprove
        ? ConfirmActivityStatus.Approve
        : ConfirmActivityStatus.Reject,*/
    CancelOpportunityApologizingPage.showCancelOpportunityApologizing(context,
        id: id, onConfirm: (reason) {
      bloc.confirmActivity(ConfirmActivityParams(
          description: reason, id: id, statusId: ConfirmActivityStatus.Reject));
    });
  }

  acceptJob(int id) {
    fetchLocation(onGetLocation: ((location) {
      print('fetchLocation $location');
      bloc.confirmActivity(ConfirmActivityParams(
          id: id,
          latitude: location.latitude,
          longitude: location.longitude,
          statusId: ConfirmActivityStatus.Approve));
    }));
  }

  @override
  void onSuccessDismissed() {
    loadInitialData(context);
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<NotificationItem>> state) {
    return ActivityLogListScreen(
      notificationsList: state.data,
      isActive: active,
      onConfirmJob: (bool isAccept, int id) {
        if (isAccept) {
          acceptJob(id);
        } else {
          cancelJob(id);
        }
      },
    );
  }
}
