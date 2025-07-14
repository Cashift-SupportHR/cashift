import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../bloc/tracking_focus_points_cubit.dart';
import 'tracking_focus_points_screen.dart';


class TrackingFocusPointsPage extends BaseBlocWidget<Initialized<List<CommonListItem>>, TrackingFocusPointsCubit> {
   TrackingFocusPointsPage({Key? key})
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
    bloc.fetchProjects();
  }


  @override
  String? title(context)=> strings.tracking_focus_points;

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<CommonListItem>> state) {
    return TrackingFocusPointsScreen(
      projects: state.data,
      shiftsByProjectsStream: bloc.shiftsByProjectsStream,
      infoTrackingFocusPointStream: bloc.infoTrackingFocusPointStream,
      onFetchShiftsByProjects: (id) {
        bloc.fetchShiftsByProjects(id);
      },
      onFetchInfoTrackingFocusPoint: (projectId) {
        bloc.fetchInfoTrackingFocusPoint(projectId);
      },
    );
  }
}
