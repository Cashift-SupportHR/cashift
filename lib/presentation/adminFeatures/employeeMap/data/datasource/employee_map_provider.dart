
import '../../../../../common/data/models/api_response.dart';
 import '../../../../../common/network/source/admin_endpoint.dart';
 import 'package:injectable/injectable.dart';

import '../models/emp_map_dto.dart';
import '../models/fetch_emp_map_prams.dart';

@injectable
class EmployeeMapAPI {
  final AdminEndpoint api;

  EmployeeMapAPI({required this.api});

Future<ApiResponse<EmpMapDto>> fetchEmpInfoLoc(
    FetchEmpMapPrams  fetchEmpMapPrams) {
  return api.fetchEmpInfoLoc(fetchEmpMapPrams);
}

}