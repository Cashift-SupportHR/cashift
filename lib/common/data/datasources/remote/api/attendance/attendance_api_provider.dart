
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import 'package:shiftapp/common/data/models/overview/index.dart';
import 'package:shiftapp/common/domain/entities/attendance/index.dart';

import '../../../../../network/source/user_endpoint.dart';
import '../../../../models/attendance/index.dart';

@Injectable()
class AttendanceApi {
  final UserEndpoint api;
  AttendanceApi(this.api);

  Future<ApiResponse<AttendanceShiftDto>> fetchAvailableShift() async {
    return await api.fetchAvailableShift();
  }

  Future<ApiResponse<AttendanceShiftDto>> fetchCurrentOvertime() async {
    return await api.fetchCurrentOvertime();
  }

  Future<ApiResponse<String>> registerAttendance(@Body() AttendanceQuery params) async {
    return await api.registerAttendance(params);
  }

  Future<ApiResponse<String>> startOvertime(@Body() AttendanceQuery params) async {
    return await api.startOvertime(params);
  }

  Future<ApiResponse<String>> endOvertime(@Body() AttendanceQuery params) async {
    return await api.endOvertime(params);
  }

  //http://85.184.232.38:8003/api/v5/TransactionLogCashift/EmployeeTransactionLog
  Future<ApiResponse<List<AttendanceLog>>> fetchAttendanceLog(@Body() AttendanceLogQuery query) async {
    return await api.fetchAttendanceLog(query);
  }

  Future<ApiResponse<List<AttendanceLog>>> fetchOvertimeLog() async {
    return await api.fetchOvertimeLog();
  }

  Future<ApiResponse<List<Violation>>> fetchViolation() async {
    return await api.fetchViolation();
  }

  Future<ApiResponse<String>> autoAttendanceDto(@Body() AutoAttendanceDto params) async {
    return await api.autoAttendanceDto(params);
  }
  Future<ApiResponse<String>> uploadFakeFaceRecognition(File files) async {
    return await api.uploadFakeFaceRecognition(files);
  }
}
