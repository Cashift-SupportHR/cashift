import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
  import '../../../../../common/data/datasources/remote/remote_constants.dart';
import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/user_endpoint.dart';
import '../models/index.dart';

@Injectable()
class AttendanceAndDepartureNotificationsAPI {
  final UserEndpoint api;

  AttendanceAndDepartureNotificationsAPI(this.api);

  Future<ApiResponse<List<AttendanceNotifiActionDto>>> fetchAttendanceNotifications( ) async {
    return await api.fetchAttendanceNotifications();
  }

  Future<ApiResponse<List<AttendanceNotifiTypeDto>>> fetchAttendanceType( ) async {
    return await api.fetchAttendanceType();
  }

  Future<ApiResponse> addAttendanceNotifications(AddAttendanceNotificationsPrams addAttendanceNotificationsPrams ) async {
    return await api.addAttendanceNotifications(addAttendanceNotificationsPrams);
  }


}
