import 'dart:io';

import 'package:shiftapp/common/network/source/admin_endpoint.dart';
import '../../../../../common/data/models/api_response.dart';
import '../../../employees/data/models/tab_cashifter_dto.dart';
import '../../../projectsManagement/data/models/working_period_dto.dart';
import '../models/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class EmploymentManagementAPI {
  final AdminEndpoint api;

  EmploymentManagementAPI({required this.api});

  Future<ApiResponse<List<EmploymentManagementTabDto>>>
      fetchEmploymentManagementTabsData() {
    return api.fetchEmploymentManagementTabsData();
  }

  Future<ApiResponse<List<EmployeeChashifterDataDto>>> fetchEmployeesData(
      EmployeeDataParams params) {
    return api.fetchEmployeesData(params);
  }

  Future<ApiResponse<List<OrderStatusDto>>> fetchEmployeesOrderStatus() {
    return api.fetchEmployeesOrderStatus();
  }

  Future<ApiResponse<List<OrderStatusDto>>>
      fetchEmployeesOrderStatusIfAccept() {
    return api.fetchEmployeesOrderStatusIfAccept();
  }

  Future<ApiResponse<List<WorkingPeriodDto>>> fetchWorkingPeriods() {
    return api.fetchWorkingPeriods();
  }

  Future<ApiResponse<String>> saveEmployeesOrderStatus(
      SaveOrderStatusParams params) {
    return api.saveEmployeesOrderStatus(params);
  }

  Future<ApiResponse<EmployeeOrderStatusDto>> fetchEmployeesOrderStatusForEdit(
      int freelanceId) {
    return api.fetchEmployeesOrderStatusForEdit(freelanceId);
  }

  Future<ApiResponse<int>> changePhoneNumber(
    int freeLanceInfoId,
    String newPhoneNumber,
    File attachmentFile,
    int notificationType,
  ) {
    return api.changePhoneNumber(
        freeLanceInfoId, newPhoneNumber, attachmentFile, notificationType);
  }

  Future<ApiResponse<bool>> resendChangePhoneNumberCode(int id) {
    return api.resendChangePhoneNumberCode(id);
  }

  Future<ApiResponse<List<NotificationTypeCodeDto>>> fetchNotificationTypes() {
    return api.fetchNotificationTypes();
  }

  Future<ApiResponse<String>> checkChangePhoneNumberCode(
      CheckPhoneCodeParams params) {
    return api.checkChangePhoneNumberCode(params);
  }

  Future<ApiResponse<ResetPhoneDataDto>> fetchPhoneNumberData() {
    return api.fetchPhoneNumberData();
  }

  Future<ApiResponse<PopupEmploymentManagementDto>> fetchPopupsData() {
    return api.fetchPopupsData();
  }

  Future<ApiResponse<bool>> addBlockEmployee(AddBlockEmployeeParams params) {
    return api.addBlockEmployee(params);
  }

  Future<ApiResponse<bool>> allowEditFaceRecognition(int id) {
    return api.allowEditFaceRecognition(id);
  }



}
