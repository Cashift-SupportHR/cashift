import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/index.dart';
import '../../../../../employees/domain/entities/project_employee.dart';
import '../../../../data/models/emp_attendance_rports_prams.dart';
import '../../cubit/fillter_attendance_notifications_reports_cubit.dart';
import 'filter_attendance_notifications_reports_screen.dart';

class FilterAttendanceNotificationsReportsPage extends BaseBlocWidget<
    Initialized<List<ProjectEmployee>>,
    FilterAttendanceNotificationsReportsCubit> {
  final Function(EmpAttendanceRportsPrams empAttendanceRportsPrams) onSearch;

  FilterAttendanceNotificationsReportsPage({super.key, required this.onSearch});
  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchProject();
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<ProjectEmployee>> state) {
    return FilterAttendanceNotficationScreen(
      shiftsStream: bloc.shiftsStream,
      onSearch: (empAttendanceRportsPrams) {
        onSearch(empAttendanceRportsPrams);
      },
      onFetchShift: (projectId) =>
          bloc.fetchShiftsByProjects(projectId: projectId),
      data: state.data,
    );
  }
}
