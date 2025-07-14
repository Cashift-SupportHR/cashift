import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/focusPoints/presentations/trackingFocusPoints/pages/tracking_focus_points_main_tabs.dart';
import 'package:shiftapp/common/components/loading_widget.dart';
import '../../../../../../common/domain/entities/workerWorkPlaces/focus_point_info.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../../../../common/components/error_handler_widget.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../../../domain/entities/focus_point_project.dart';
import '../../../domain/entities/project_info_focus_point.dart';
import '../../../domain/entities/shift_by_project_id.dart';
import '../../add_focus_point/pages/focus_point_data/widgets/projects_picker.dart';
import '../widgets/date_widget_point.dart';

class TrackingFocusPointsScreen extends StatelessWidget {
  final List<CommonListItem> projects;
  final StreamStateInitial<ProjectInfoFocusPoint?> infoTrackingFocusPointStream;
  final StreamStateInitial<List<ShiftByProjectId>?> shiftsByProjectsStream;
  final Function(int) onFetchInfoTrackingFocusPoint;
  final Function(int) onFetchShiftsByProjects;

  const TrackingFocusPointsScreen({
    Key? key,
    required this.projects,
    required this.infoTrackingFocusPointStream,
    required this.shiftsByProjectsStream,
    required this.onFetchInfoTrackingFocusPoint,
    required this.onFetchShiftsByProjects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int projectId = projects.first.id ?? 0;
    final scrollController = ScrollController();
    return RefreshIndicator(
      onRefresh: () async {
        onFetchInfoTrackingFocusPoint(projectId);
        onFetchShiftsByProjects(projectId);
      },
      child: NestedScrollView(
        controller: scrollController,
        floatHeaderSlivers: true,
        scrollBehavior: const ScrollBehavior(),
        physics: const AlwaysScrollableScrollPhysics(),
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ProjectsPicker(
                      initialValue: projects.first.name,
                      items: projects,
                      onSelectItem: (item) {
                        projectId = item.index;
                        onFetchInfoTrackingFocusPoint(item.index);
                        onFetchShiftsByProjects(item.index);
                      },
                    ),
                    _HeaderTrackingFocusPoints(
                      infoTrackingFocusPointStream:
                          infoTrackingFocusPointStream,
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: StreamBuilder<List<ShiftByProjectId>?>(
          stream: shiftsByProjectsStream.stream,
          builder: (context, snapshot) {
            return snapshot.hasError
                ? ErrorPlaceHolderWidget(
                    exception: snapshot.error,
                    color: kBackground,
                  )
                : snapshot.data == null
                    ? const LoadingView()
                    : TrackingFocusPointsMainTabs(
                        projectId: projectId,
                        scrollController: scrollController,
                        listShift: snapshot.data ?? [],
                        onFetchShiftsByProjects: onFetchShiftsByProjects,
                      );
          },
        ),
      ),
    );
  }
}

class _HeaderTrackingFocusPoints extends StatelessWidget {
  final StreamStateInitial<ProjectInfoFocusPoint?> infoTrackingFocusPointStream;

  const _HeaderTrackingFocusPoints({
    Key? key,
    required this.infoTrackingFocusPointStream,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProjectInfoFocusPoint?>(
      stream: infoTrackingFocusPointStream.stream,
      builder: (context, snapshot) {
        return (snapshot.hasError || snapshot.data == null)
            ? const LoadingView()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(snapshot.data?.projectName ?? '',
                      style: kTextSemiBold.copyWith(
                          color: kPrimary, fontSize: 24)),
                  const SizedBox(height: 10),
                  DatesWidgetPoint(
                    focusPointInfo: FocusPointInfo(
                      date: snapshot.data?.date ?? '',
                      shiftName: snapshot.data?.shiftName ?? '',
                      startShift: snapshot.data?.startShift ?? '',
                      endShift: snapshot.data?.endShift ?? '',
                    ),
                  ),
                ],
              );
      },
    );
  }
}
