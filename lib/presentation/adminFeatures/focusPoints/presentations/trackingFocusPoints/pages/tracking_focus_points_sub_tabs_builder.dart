import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/focusPoints/presentations/trackingFocusPoints/pages/tracking_focus_points_sub_tabs.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../domain/entities/focus_points_types.dart';
import '../bloc/tracking_focus_points_cubit.dart';


class TrackingFocusPointsSubTabsBuilder extends BaseBlocWidget<Initialized<List<FocusPointsTypes>>, TrackingFocusPointsCubit> {
  final int projectId;
  final int shiftId;
  final ScrollController? scrollController;

  TrackingFocusPointsSubTabsBuilder({Key? key, required this.projectId, required this.shiftId, this.scrollController})
      : super(key: key);

  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  bool detectRequiredTasks() {
    return false ;
  }
  @override
  void loadInitialData(context) {
    print("TrackingFocusPointsSubTabsBuilder loadInitialData");
    bloc.fetchFocusPointsTypes(projectId: projectId, shiftId: shiftId);
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<FocusPointsTypes>> state) {
    return TrackingFocusPointsSubTabs(
      focusPointsTypes: state.data,
      scrollController: scrollController,
    );
  }
}
