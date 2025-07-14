import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/admin_endpoint.dart';
import '../models/accept_or_reject_attachment_emp_prams.dart';
import '../models/emp_attandance_prams.dart';
import '../models/emp_attendance_dto.dart';
import '../models/employee_chasfiter_details_dto.dart';
import '../models/index.dart';
import '../models/requirement_attachment_prams.dart';

@injectable
class EmployeesAPI {
  final AdminEndpoint api;

  EmployeesAPI({required this.api});

  Future<ApiResponse<List<EmployeeDataDto>>> fetchEmployee(
      String? searchString) {
    return api.fetchEmployee(searchString);
  }

  Future<ApiResponse<List<ProjectEmployeDto>>> fetchProject() {
    return api.fetchProject();
  }

  Future<ApiResponse<List<DayRelaxDto>>> fetchDayRelax() {
    return api.fetchDayRelax();
  }

  Future<ApiResponse<List<ShiftEmployeeDto>>> fetchShiftsByProjects(
      int? projectId) {
    return api.fetchShiftsByProjects(projectId);
  }

  Future<ApiResponse<List<PaymentPeriodTypesDto>>>
      fetchPaymentPeriodTypesByProject(int? projectId) {
    return api.fetchPaymentPeriodTypesByProject(projectId);
  }

  Future<ApiResponse<List<EmployeeStatusesDto>>> fetchEmployeeStatusesByProject(
      int? projectId) {
    return api.fetchEmployeeStatusesByProject(projectId);
  }

  Future<ApiResponse<List<EmpChasifterDto>>> fetchEmployeeChashifter(
      int? employeeStatusId) {
    return api.fetchEmployeeChashifter(employeeStatusId);
  }

  Future<ApiResponse<List<TabCashifterDto>>> fetchTab() {
    return api.fetchTab();
  }

  Future<ApiResponse<List<AttachmentsEmpDto>>> fetchAttachments(
    int? freelancerId,
    int? statusCode,
  ) {
    return api.fetchAttachments(freelancerId, statusCode);
  }

  Future<ApiResponse<EmployeeChasfiterDetailsDto>> fetchEmpById(
      int freelancerId) {
    return api.fetchEmpById(freelancerId);
  }

  Future<ApiResponse> AddEditEmployee(AddEmployeePrameter addEmployeePrameter) {
    return api.AddEditEmployee(addEmployeePrameter);
  }

  Future<ApiResponse<EmpAttendanceDto>> fetchEmployeeAttendance(
      EmpAttandancePrams empAttandancePrams) {
    return api.fetchEmployeeAttendance(empAttandancePrams);
  }

  Future<ApiResponse> AddEditFreelancerAttachmentAdmin(
      RequirementAttachmentPrams requirementAttachmentPrams,
      File requirementAttachment) {
    return api.AddEditFreelancerAttachmentAdmin(
        requirementAttachmentPrams, requirementAttachment);
  }

  Future<ApiResponse> AddEditFreelancerAttachmentUser(
      @Query("RequirementAttachmentId") int requirementAttachmentId,
      @Part(name: 'RequirementAttachment') File requirementAttachment) {
    return api.AddEditFreelancerAttachmentUser(
        requirementAttachmentId, requirementAttachment);
  }

  Future<ApiResponse<List<TabCashifterDto>>> fetchTabAttachment() {
    return api.fetchTabAttachment();
  }

  Future<ApiResponse> acceptOrRejectAttachmentEmp(
      AcceptOrRejectAttachmentEmpPrams acceptOrRejectAttachmentEmpPrams) {
    return api.acceptOrRejectAttachmentEmp(acceptOrRejectAttachmentEmpPrams);
  }

}
