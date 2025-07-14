import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/index.dart';
 import '../../../../domain/entities/EmpAttendanceRportsDto.dart';
import '../../cubit/attendance_notifications_reports_cubit.dart';
import 'attendance_notifications_reports_screen.dart';

class AttendanceNotificationsReportsPage extends BaseBlocWidget<
    Initialized<EmpAttendanceRports?>, AttendanceNotificationsReportsCubit> {


  @override
  String? title(BuildContext context) {
    return strings.attendance_and_departure_notifications_reports;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchLoadData();
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<EmpAttendanceRports?> state) {
    return AttendanceNotificationsReportsScreen(
      empReport: bloc.empAttendanceRports,
      onSearch: (empAttendanceRportsPrams) {
        bloc.fetchAttendanceNotificationsReports(
            empAttendanceRportsPrams: empAttendanceRportsPrams);
        Navigator.pop(context);
      },
    );
  }
}
