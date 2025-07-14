import 'package:flutter/src/widgets/framework.dart';
import 'package:shiftapp/common/data/models/attendance/index.dart';
import 'package:shiftapp/common/domain/entities/attendance/index.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/overtimeAttendance/bloc/overtime_attendance_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/overtimeAttendance/page/overtime_attendance_screen.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/widgets/shared_widgets.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

class OvertimeAttendancePage extends BaseBlocWidget<
    Initialized<AttendanceShiftDto>, OvertimeAttendanceCubit> {
   @override
  bool initializeByKoin() {
    return false;
  }
  @override
  void loadInitialData(BuildContext context) {
    bloc.loadOvertime();
  }

  @override
  void onRequestSuccess(String? message) {
    bloc.loadOvertime();
    super.onRequestSuccess(message);
  }
  @override
  Widget buildWidget(
      BuildContext context, Initialized<AttendanceShiftDto> state) {
    return OvertimeAttendanceScreen(
      attendanceShift: state.data,
      onSubmit:state.data.projectId!=null ?() {
        performAttendance(
            context, state.data.projectId!, state.data.canSkipQr == true,
            onReadyToAttendance: (String projectId) {
              registerOvertimeAttendance(state.data);
        });
      }:null,
    );
  }

  @override
  String? title(BuildContext context) {
    return strings.overtime_screen_title;
  }


  void registerOvertimeAttendance(AttendanceShiftDto data) {
    fetchLocation(onGetLocation: (location) {
      bloc.registerAttendance(
          AttendanceQuery(
              latitude: location.latitude,
              longitude: location.longitude,
              projectId: data.projectId,
              id: data.id),
          data.startOverTime==true);
    });
  }

  void endShift(AttendanceShiftDto data) {}
}
