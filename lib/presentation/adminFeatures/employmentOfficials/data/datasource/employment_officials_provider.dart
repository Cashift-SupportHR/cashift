import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/admin_endpoint.dart';
import '../models/add_employment_official_params.dart';
import '../models/employment_official_dto.dart';
import 'package:injectable/injectable.dart';

@injectable
class EmploymentOfficialsAPI {
  final AdminEndpoint api;

  EmploymentOfficialsAPI({required this.api});

  Future<ApiResponse<bool>> addEmploymentOfficial(
      AddEmploymentOfficialParams params) {
    return api.addEmploymentOfficial(params);
  }

  Future<ApiResponse<bool>> editEmploymentOfficial(
      AddEmploymentOfficialParams params) {
    return api.editEmploymentOfficial(params);
  }

  Future<ApiResponse<List<EmploymentOfficialDto>>> fetchEmploymentOfficials(
      int type) {
    return api.fetchEmploymentOfficials(type);
  }

  Future<ApiResponse<bool>> deleteEmploymentOfficial(int id) {
    return api.deleteEmploymentOfficial(id);
  }
}
