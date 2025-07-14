
import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/admin_endpoint.dart';
import '../../../../shared/models/common_list_item_dto.dart';
 import '../models/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class FocusPointsAPI {
  final AdminEndpoint api;

  FocusPointsAPI({required this.api});

  Future<ApiResponse<int>> addFocusPoint(AddFocusPointParams params) {
    return api.addFocusPoint(params);
  }

  Future<ApiResponse<int>> editFocusPoint(AddFocusPointParams params) {
    return api.editFocusPoint(params);
  }

  Future<ApiResponse<FocusPointByIdDto>> fetchFocusPointById(int id) {
    return api.fetchFocusPointById(id);
  }

  Future<ApiResponse<List<CommonListItemDto>>> fetchProjects() {
    return api.fetchProjects();
  }

  Future<ApiResponse<List<FocusPointTypeDto>>> fetchFocusPointsType() {
    return api.fetchFocusPointsType();
  }

  Future<ApiResponse<List<EmployeeTypeDto>>> fetchEmployeesTypes() {
    return api.fetchEmployeesTypes();
  }

  Future<ApiResponse<List<PointPriorityNumberDto>>> fetchPriorityLevel() {
    return api.fetchPriorityLevel();
  }

  Future<ApiResponse<List<FocusPointTransactionTypeDto>>>
      fetchFocusPointTransactionTypes() {
    return api.fetchFocusPointTransactionTypes();
  }

  Future<ApiResponse<List<ShiftFocusPointDto>>> fetchShifts(int projectId) {
    return api.fetchShifts(projectId);
  }

  Future<ApiResponse<String>> deleteFocusPointShift(int id) {
    return api.deleteFocusPointShift(id);
  }

  Future<ApiResponse<List<CoverageBreakFocusPointDto>>>
      fetchCoverageBreakFocusPoint() {
    return api.fetchCoverageBreakFocusPoint();
  }

  Future<ApiResponse<String>> addFocusPointAttendanceTime(
      List<AddFocusAttendanceTimeParams> params) {
    return api.addFocusPointAttendanceTime(params);
  }

  Future<ApiResponse<List<ShiftsByProjectDto>>> fetchShiftsByProjectId(
      int projectId) {
    return api.fetchShiftsByProjectId(projectId);
  }

  Future<ApiResponse<List<PointAttendanceTypeDto>>>
      fetchFocusPointsAttendanceType() {
    return api.fetchFocusPointsAttendanceType();
  }

  Future<ApiResponse<String>> addFocusPointCovenant(
      List<AddCovenantFocusPointParams> params) {
    return api.addFocusPointCovenant(params);
  }

  Future<ApiResponse<List<CovenantDto>>> fetchCovenantTypes() {
    return api.fetchCovenantTypes();
  }

  Future<ApiResponse<List<FocusPointDto>>> fetchFocusPoints() {
    return api.fetchFocusPoints();
  }

  Future<ApiResponse<String>> deleteFocusPoint(int id) {
    return api.deleteFocusPoint(id);
  }

  Future<ApiResponse<String>> deleteFocusPointCovenant(int id) {
    return api.deleteFocusPointCovenant(id);
  }

  Future<ApiResponse<bool>> deleteFocusPointAttendance(int id) {
    return api.deleteFocusPointAttendance(id);
  }

  Future<ApiResponse<String>> editFocusPointAttendance(
      AddFocusAttendanceTimeParams params) {
    return api.editFocusPointAttendance(params);
  }

  Future<ApiResponse<List<PointAttendanceTime>>>
      fetchFocusPointsAttendanceByFocusPointId(int focusPointId) {
    return api.fetchFocusPointsAttendanceByFocusPointId(focusPointId);
  }

  Future<ApiResponse> deleteCovenantFocusPoint(int id) {
    return api.deleteCovenantFocusPoint(id);
  }

  Future<ApiResponse<String>> editCovenantFocusPoint(
      AddCovenantFocusPointParams params) {
    return api.editCovenantFocusPoint(params);
  }

  Future<ApiResponse<List<FocusPointTimeDto>>> fetchFocusPointTimes(
      int focusPointId) {
    return api.fetchFocusPointTimes(focusPointId);
  }

  Future<ApiResponse<List<FocusPointAreaDto>>> fetchFocusPointAreas(
      int projectId) {
    return api.fetchFocusPointAreas(projectId);
  }

  Future<ApiResponse<List<ShiftByProjectIdDto>>> fetchShiftsByProjects(
      int projectId) {
    return api.fetchShiftsByProjectsFocusPoints(projectId);
  }

  Future<ApiResponse<ProjectInfoFocusPointDto>> fetchInfoTrackingFocusPoint(
      int projectId) {
    return api.fetchInfoTrackingFocusPoint(projectId);
  }

  Future<ApiResponse<List<FocusPointsTypesDto>>> fetchFocusPointsTypes(
      int projectId, int shiftId) {
    return api.fetchFocusPointsTypes(projectId, shiftId);
  }
}
