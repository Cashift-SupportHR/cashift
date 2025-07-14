import 'package:floor/floor.dart';


import '../../../domain/entities/attendance/attendance_offline_query.dart';

@dao
abstract class AttendanceOfflineQueryDao {
  @Query('SELECT * FROM AttendanceOfflineQuery')
  Future<List<AttendanceOfflineQuery>?> fetchAllAttendanceQueryOffline();

  @insert
  Future<void> insertAttendanceQuery(AttendanceOfflineQuery attendanceQuery);

  @update
  Future<void> updateAttendanceQuery(AttendanceOfflineQuery attendanceQuery);

  @delete
  Future<void> deleteAttendanceQuery(AttendanceOfflineQuery attendanceQuery);
}

