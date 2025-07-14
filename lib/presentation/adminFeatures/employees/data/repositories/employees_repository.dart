import 'dart:async';
import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../../common/data/models/api_response.dart';
import '../../domain/entities/Emp_attandance.dart';
import '../../domain/entities/tab_cashifter.dart';
import '../datasource/employees_provider.dart';
import '../models/accept_or_reject_attachment_emp_prams.dart';
import '../models/attachments_emp_dto.dart';
import '../models/emp_attandance_prams.dart';
import '../models/employee_chasfiter_details_dto.dart';
import '../models/index.dart';
import '../models/requirement_attachment_prams.dart';

@injectable
class EmployeesRepository {
  final EmployeesAPI _api;

  EmployeesRepository(this._api);

  Future<List<EmployeeDataDto>> fetchEmployee(String? search) async {
    final response = await _api.fetchEmployee(search);
    return response.payload!;
  }

  Future<List<ProjectEmployeDto>> fetchProject() async {
    final response = await _api.fetchProject();
    return response.payload!;
  }

  Future<ApiResponse> addEditEmployee(
      {required AddEmployeePrameter addEmployeePrameter}) async {
    final response = await _api.AddEditEmployee(addEmployeePrameter);
    return response;
  }

  Future<List<DayRelaxDto>> fetchDayRelax() async {
    final response = await _api.fetchDayRelax();
    return response.payload!;
  }

  Future<List<ShiftEmployeeDto>> fetchShiftsByProjects(int? projectId) async {
    final response = await _api.fetchShiftsByProjects(projectId);
    return response.payload!;
  }

  Future<List<PaymentPeriodTypesDto>> fetchPaymentPeriodTypesByProject(
      int? projectId) async {
    final response = await _api.fetchPaymentPeriodTypesByProject(projectId);
    return response.payload!;
  }

  Future<List<EmployeeStatusesDto>> fetchEmployeeStatusesByProject(
      int? projectId) async {
    final response = await _api.fetchEmployeeStatusesByProject(projectId);
    return response.payload!;
  }

  Future<List<EmpChasifterDto>> fetchEmployeeChashifter(
      {required int employeeStatusId}) async {
    final response = await _api.fetchEmployeeChashifter(employeeStatusId);
    return response.payload!;
  }

  Future<List<TabCashifterDto>> fetchTab() async {
    final response = await _api.fetchTab();
    return response.payload!;
  }

  Future<List<TabCashifter>> fetchTabAttachment() async {
    final response = await _api.fetchTabAttachment();
    final data = response.payload!.map((e) => TabCashifter.fromDto(e)).toList();

    return data;
  }

  Future<List<AttachmentsEmpDto>> fetchAttachments(
      {int? freelancerId, int? statusCode}) async {
    final response = await _api.fetchAttachments(freelancerId, statusCode);

    return response.payload!;
  }

  Future<EmployeeChasfiterDetailsDto> fetchEmpById(
      {required int freelancerId}) async {
    final response = await _api.fetchEmpById(freelancerId);
    return response.payload!;
  }

  Future<ApiResponse> addEditFreelancerAttachmentAdmin(
      {required RequirementAttachmentPrams requirementAttachmentPrams,
      required File file}) async {
    final response = await _api.AddEditFreelancerAttachmentAdmin(
        requirementAttachmentPrams, file);
    return response;
  }

  Future<ApiResponse> acceptOrRejectAttachmentEmp(
      AcceptOrRejectAttachmentEmpPrams acceptOrRejectAttachmentEmpPrams) async {
    final response = await _api
        .acceptOrRejectAttachmentEmp(acceptOrRejectAttachmentEmpPrams);
    return response;
  }

  Future<ApiResponse> AddEditFreelancerAttachmentUser(
      {required int requirementAttachmentId, required File file}) async {
    final response = await _api.AddEditFreelancerAttachmentUser(
        requirementAttachmentId, file);
    return response;
  }

  Future<EmpAttandance> fetchEmployeeAttendance(
      EmpAttandancePrams empAttandancePrams) async {
    final response = await _api.fetchEmployeeAttendance(empAttandancePrams);
    final data = EmpAttandance.fromDto(response.payload!);
    return data;
  }
}
