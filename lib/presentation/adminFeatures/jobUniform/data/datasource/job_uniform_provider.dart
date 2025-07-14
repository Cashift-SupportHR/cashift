import 'dart:io';

 import 'package:injectable/injectable.dart';

import '../../../../../common/data/models/api_response.dart';

import '../../../../../common/network/source/admin_endpoint.dart';
import '../models/uniform_dto.dart';

@injectable
class JobUniformAPI {
  final AdminEndpoint api;

  JobUniformAPI({required this.api});

  Future<ApiResponse<List<UniformDto>>> fetchJobUniform(
      int jobId, int companyId) {
    return api.fetchJobUniform(jobId, companyId);
  }

  Future<ApiResponse<bool>> addEditJobUniform(int? Id, int? JobId, int? companyId,
      int? JobUniformCategoryId, String? description,
      {File? file = null}) {
    return api.addEditJobUniform(
        Id, JobId, companyId, JobUniformCategoryId, description,
        file: file);
  }

  Future<ApiResponse<bool>> deleteJobUniform(int id) {
    return api.deleteJobUniform(id);
  }
}
