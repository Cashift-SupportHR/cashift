import 'dart:async';
import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/datasources/remote/api/attendance/attendance_api_provider.dart';
import 'package:shiftapp/common/data/models/attendance/index.dart';
import 'package:shiftapp/common/data/models/overview/auto_attendance_dto.dart';
  import 'package:shiftapp/common/domain/entities/attendance/index.dart';

import '../../models/api_response.dart';

 @injectable
class AttendanceRepository{
  final AttendanceApi _api;

  AttendanceRepository(this._api);

  Future<AttendanceShiftDto> fetchAvailableShift() async {
    final projects = await _api.fetchAvailableShift();
    return projects.payload!;
  }

  Future<AttendanceShiftDto> fetchCurrentOvertime() async {
    final projects = await _api.fetchCurrentOvertime();
    return projects.payload!;
  }

  Future<List<AttendanceLog>> fetchAttendanceLog(
      AttendanceLogQuery query) async {
    final projects = await _api.fetchAttendanceLog(query);
    return projects.payload!;
  }

  Future<List<AttendanceLog>> fetchOvertimeLog() async {
    final projects = await _api.fetchOvertimeLog();
    return projects.payload!;
  }

  Future<String> registerAttendance(AttendanceQuery query) async {
    final projects = await _api.registerAttendance(query);
    return projects.message!;
  }

  Future<String> startOvertime(AttendanceQuery query) async {
    final projects = await _api.startOvertime(query);
    return projects.message!;
  }

  Future<String> endOvertime(AttendanceQuery query) async {
    final projects = await _api.endOvertime(query);
    return projects.message!;
  }

  Future<List<Violation>> fetchViolation() async {
    final projects = await _api.fetchViolation();
    return projects.payload!;
  }

  Future<String> autoAttendanceDto(AutoAttendanceDto params) async {
    final projects = await _api.autoAttendanceDto(params);
    return projects.message ?? '';
  }
  Future<ApiResponse<String>> uploadFakeFaceRecognition(File file) async {
    final response = await _api.uploadFakeFaceRecognition(file);
    return response;
  }
}
