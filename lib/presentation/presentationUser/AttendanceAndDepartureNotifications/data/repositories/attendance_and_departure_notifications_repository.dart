import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';

import '../datasource/attendance_and_departure_notifications_provider.dart';
import '../models/index.dart';


@injectable
class AttendanceAndDepartureNotificationsRepository {
  final AttendanceAndDepartureNotificationsAPI _api;

  AttendanceAndDepartureNotificationsRepository(this._api);

  Future<ApiResponse> addAttendanceNotifications(
      {required AddAttendanceNotificationsPrams
          addAttendanceNotificationsPrams}) async {
    final response =
        await _api.addAttendanceNotifications(addAttendanceNotificationsPrams);
    return response;
  }

  Future<List<AttendanceNotifiActionDto>> fetchAttendanceNotifications() async {
    final response = await _api.fetchAttendanceNotifications();
    return response.payload!;
  }

  Future<List<AttendanceNotifiTypeDto>> fetchAttendanceType() async {
    final response = await _api.fetchAttendanceType();
    return response.payload!;
  }
}
