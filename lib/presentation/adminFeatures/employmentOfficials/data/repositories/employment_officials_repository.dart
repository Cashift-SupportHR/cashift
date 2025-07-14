import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import '../datasource/employment_officials_provider.dart';
import '../models/index.dart';

@injectable
class EmploymentOfficialsRepository {
  final EmploymentOfficialsAPI _api;

  EmploymentOfficialsRepository(this._api);

  Future<ApiResponse<bool>> addEditEmploymentOfficial(
      AddEmploymentOfficialParams params) async {
    final response = params.id == null || params.id == 0
        ? await _api.addEmploymentOfficial(params)
        : await _api.editEmploymentOfficial(params);
    return response;
  }

  Future<List<EmploymentOfficialDto>> fetchEmploymentOfficials(int type) async {
    final response = await _api.fetchEmploymentOfficials(type);
    return response.payload!;
  }

  Future<ApiResponse<bool>> deleteEmploymentOfficial(int id) async {
    final response = await _api.deleteEmploymentOfficial(id);
    return response;
  }
}
