
import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/admin_endpoint.dart';
import '../models/emp_attendance_rports_dto.dart';
import '../models/emp_attendance_rports_prams.dart';
import 'package:injectable/injectable.dart';

@injectable
class AttendanceNotificationsReportsAPI {
  final AdminEndpoint api;

  AttendanceNotificationsReportsAPI({required this.api});

  Future<ApiResponse<EmpAttendanceRportsDto>>
      fetchAttendanceNotificationsReports(
          EmpAttendanceRportsPrams empAttendanceRportsPrams) {
    return api.fetchAttendanceNotificationsReports(empAttendanceRportsPrams);
  }
}
