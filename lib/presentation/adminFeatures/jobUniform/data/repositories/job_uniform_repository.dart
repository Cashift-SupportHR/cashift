import 'dart:async';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';

import '../datasource/job_uniform_provider.dart';
import '../models/add_job_uniform_params.dart';
import '../models/job_uniform_type_dto.dart';
import '../models/uniform_dto.dart';

@injectable
class JobUniformRepository {
  final JobUniformAPI _api;

  JobUniformRepository(this._api);

  Future<List<UniformDto>> fetchJobUniform(
    int jobId,
    int companyId,
  ) async {
    final response = await _api.fetchJobUniform(jobId, companyId);
    return response.payload!;
  }

  Future<ApiResponse<bool>>  addJobUniform(AddJobUniformParams params) async {
    final response = await _api.addEditJobUniform(params.id, params.jobId,
        params.companyId, params.jobUniformCategoryId, params.description,
        file: params.file);
    return response;
  }

  Future<ApiResponse<bool>>  deleteJobUniform(int id) async {
    final response = await _api.deleteJobUniform(id);
    return response;
  }
}
