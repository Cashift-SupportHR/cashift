import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import 'package:shiftapp/common/domain/entities/overview/app_version.dart';
import '../../../../../domain/entities/attendance/attendance_offline_query.dart';
import '../../../../../network/source/user_endpoint.dart';

@Injectable()
class HomeAPI {
  final UserEndpoint api;

  HomeAPI(this.api);

  Future<ApiResponse<AppVersion>> fetchAppVersion() {
    return api.fetchAppVersion();
  }

  Future<ApiResponse<String>> attendanceCashiftOffLine(
      @Body() List<AttendanceOfflineQuery> attendanceOfflineQuery) async {
    return await api.attendanceCashiftOffLine(attendanceOfflineQuery);
  }
}
