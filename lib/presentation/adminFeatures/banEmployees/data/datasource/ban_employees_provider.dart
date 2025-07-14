 import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/admin_endpoint.dart';
import '../models/index.dart';
 import 'package:injectable/injectable.dart';

 @injectable
class BanEmployeesAPI {
  final AdminEndpoint api;

  BanEmployeesAPI({required this.api});

  Future<ApiResponse<List<BanEmployeeTabDto>>> fetchBanEmployeesTabData() {
    return api.fetchBanEmployeesTabData();
  }

  Future<ApiResponse<List<BanEmployeeDto>>> fetchBanEmployeesData(
      BanEmployeeParams params) {
    return api.fetchBanEmployeesData(params);
  }

  Future<ApiResponse<String>> updateBanEmployeesStatus(
      BanEmployeeStatusParams params) {
    return api.updateBanEmployeesStatus(params);
  }

  Future<ApiResponse<BanEmployeeDetailsDto>> fetchEmployeeCVDetails(int id) {
    return api.fetchEmployeeCVDetails(id);
  }

  Future<ApiResponse<List<JobEvaluationsEmployeeDto>>>
      fetchJobEvaluationsEmployee(int freelanceId) {
    return api.fetchJobEvaluationsEmployee(freelanceId);
  }
}
