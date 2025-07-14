import 'package:flutter/material.dart';
import '../../../../../../core/services/routes.dart';
import '../../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../../../common/components/base/stream_state_widget_v2.dart';
import '../../../../../shared/components/base_widget_bloc.dart';
import '../../../domain/entities/track_attendance_departure.dart';
import '../bloc/track_attendance_departure_cubit.dart';
import 'track_attendance_departure_screen.dart';

class TrackAttendanceDeparturePage extends BaseBlocWidget<
    Initialized<List<TrackAttendanceDeparture>>,
    TrackAttendanceDepartureCubit> {
  @override
  String? title(BuildContext context) {
    return strings.request_track_attendance_departure;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
    controller.clear();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: Column(
        children: [
          TitleAndAddNewRequest(
            title: strings.view_tracking_requests,
            textButton: strings.add_tracking_request,
            onTap: () async {
              final isRefresh = await Navigator.pushNamed(
                  context, Routes.requestTrackAttendanceDeparturePage);
              print('isRefresh $isRefresh');
              if (isRefresh == true) {
                loadInitialData(context);
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldSearchJob(
              title: strings.search,
              controller: controller,
              readOnly: false,
              onTap: () {},
              onChanged: (value) {
                bloc.searchByText(value);
              },
            ),
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
      BuildContext context, Initialized<List<TrackAttendanceDeparture>> state) {
    return StreamStateWidgetV2<List<TrackAttendanceDeparture>?>(
      stream: bloc.trackAttendanceDepartureStream,
      initialData: state.data,
      builder: (context, snapshot) {
        return TrackAttendanceDepartureScreen(
          data:snapshot??[],
          onRefresh: () {
            loadInitialData(context);
          },
        );
      }
    );
  }
}
