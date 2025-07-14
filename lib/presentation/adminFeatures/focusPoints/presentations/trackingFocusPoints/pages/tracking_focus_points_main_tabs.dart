import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/focusPoints/presentations/trackingFocusPoints/pages/tracking_focus_points_sub_tabs_builder.dart';
import 'package:shiftapp/common/components/tabview/tab_bar_view_widget_border.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../domain/entities/shift_by_project_id.dart';

class TrackingFocusPointsMainTabs extends BaseStatelessWidget {
  final int projectId;
  final List<ShiftByProjectId> listShift;
  final ScrollController? scrollController;
  final Function(int) onFetchShiftsByProjects;

  TrackingFocusPointsMainTabs({Key? key, required this.projectId, required this.listShift, this.scrollController, required this.onFetchShiftsByProjects,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StreamStateInitial<int> initialIndexStream = StreamStateInitial<int>();
    initialIndexStream.setData(getInitialIndex());
    return TabBarViewWidgetBorder(
      initialIndex: getInitialIndex(),
      initialIndexStream: initialIndexStream,
      tabs: listShift.map((e) => e.shiftName ?? '').toList(),
      children: listShift.map((e) => TrackingFocusPointsSubTabsBuilder(
        shiftId: e.id ?? 0,
        projectId: projectId,
        scrollController: scrollController,
      )).toList(),

    );
  }

  int getInitialIndex() {
    if (listShift.isEmpty) {
      return 0;
    } else {
      for (var element in listShift) {
        if (element.isActive ?? false) {
          return listShift.indexOf(element);
        }
      }
      return 0;
    }
  }
}
