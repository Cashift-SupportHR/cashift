import 'dart:async';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/data/models/working_period_dto.dart';

import '../../domain/entities/index.dart';
import '../datasource/employment_management_provider.dart';
import '../models/index.dart';


@injectable
class EmploymentManagementRepository {

  final EmploymentManagementAPI _api;

  EmploymentManagementRepository(this._api);


  Future<List<EmploymentManagementTabDto>> fetchEmploymentManagementTabsData() async {
    final response = await _api.fetchEmploymentManagementTabsData();
    return response.payload!;
  }

  Future<List<EmployeeChashifterDataDto>> fetchEmployeesData(EmployeeDataParams params) async {
    final response = await _api.fetchEmployeesData(params);
    return response.payload!;
  }

  Future<List<OrderStatusDto>> fetchEmployeesOrderStatus() async {
    final response = await _api.fetchEmployeesOrderStatus();
    return response.payload!;
  }

  Future<List<OrderStatusDto>> fetchEmployeesOrderStatusIfAccept() async {
    final response = await _api.fetchEmployeesOrderStatusIfAccept();
    return response.payload!;
  }

  Future<List<WorkingPeriodDto>> fetchWorkingPeriods() async {
    final response = await _api.fetchWorkingPeriods();
    return response.payload!;
  }

  Future<ApiResponse<String>> saveEmployeesOrderStatus(SaveOrderStatusParams params) async {
    final response = await _api.saveEmployeesOrderStatus(params);
    return response;
  }

  Future<EmployeeOrderStatusDto> fetchEmployeesOrderStatusForEdit(int freelanceId) async {
    final response = await _api.fetchEmployeesOrderStatusForEdit(freelanceId);
    return response.payload!;
  }

  Future<ApiResponse<int>> changePhoneNumber(ChangePhoneNumberParams params ) async {
    return await _api.changePhoneNumber(
      params.freeLanceInfoId ?? 0,
      params.newPhoneNumber ?? '',
      params.attachmentFile ?? File(''),
      params.notificationType ?? 0,
    );
  }

  Future<ApiResponse<bool>> resendChangePhoneNumberCode(int id) async {
    return await _api.resendChangePhoneNumberCode(id);
  }

  Future<List<NotificationTypeCode>> fetchNotificationTypes() async {
    final response = await _api.fetchNotificationTypes();
    return response.payload?.map((e) => NotificationTypeCode.fromDto(e)).toList() ?? [];
  }

  Future<ApiResponse<String>> checkChangePhoneNumberCode( CheckPhoneCodeParams params) async {
    return await _api.checkChangePhoneNumberCode(params);
  }

  Future<ResetPhoneData> fetchPhoneNumberData() async {
    final data = await _api.fetchPhoneNumberData();
    return ResetPhoneData.fromDto(data.payload!);
  }

  Future<PopupEmploymentManagement> fetchPopupsData() async {
    final data = await _api.fetchPopupsData();
    return PopupEmploymentManagement.fromDto(data.payload!);
  }

  Future<ApiResponse<bool>> addBlockEmployee(AddBlockEmployeeParams params) async {
    return await _api.addBlockEmployee(params);
  }

  Future<ApiResponse<bool>> allowEditFaceRecognition(int id) async {
    return await _api.allowEditFaceRecognition(id);
  }
}
