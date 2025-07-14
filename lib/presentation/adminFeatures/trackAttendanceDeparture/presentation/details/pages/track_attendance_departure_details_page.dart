import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/trackAttendanceDeparture/presentation/details/pages/track_attendance_departure_details_screen.dart';
import 'package:shiftapp/common/components/index.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../domain/entities/RequestAttendanceDepartureDetails.dart';
import '../../../domain/entities/track_attendance_departure.dart';
import '../../../domain/entities/track_attendance_departure_image.dart';
import '../bloc/track_attendance_departure_details_cubit.dart';

class TrackAttendanceDepartureDetailsPage
    extends BaseBlocWidget<Initialized< RequestAttendanceDepartureDetails>, TrackAttendanceDepartureDetailsCubit> {
  @override
  loadInitialData(BuildContext context) {
    TrackAttendanceDeparture item = getArguments(context);
    bloc.fetchTrackAttendanceDepartureRequestsDetails(item.id ?? 0);
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  String? title(BuildContext context) {

    return  strings.cashifter_attendance_tracking;
  }





  @override
  Widget buildWidget(BuildContext context, Initialized<RequestAttendanceDepartureDetails> state) {
    return TrackAttendanceDepartureDetailsScreen(
      data: state.data ,
    );
  }
}
