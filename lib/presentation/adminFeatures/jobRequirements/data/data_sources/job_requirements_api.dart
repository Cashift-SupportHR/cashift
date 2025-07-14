import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/admin_endpoint.dart';
import '../models/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class JobRequirementsAPI {
  final AdminEndpoint api;

  JobRequirementsAPI({required this.api});

  Future<ApiResponse<List<JobModelDto>>> fetchListJob() {
    return api.fetchListJob();
  }

  Future<ApiResponse<List<JobRequirementsDto>>> fetchJobRequirements(int type) {
    return api.fetchJobRequirements(type);
  }

  Future<ApiResponse> deleteJobRequirements(int id) {
    return api.deleteJobRequirements(id);
  }

  Future<ApiResponse> addEditJobRequirements(
      AddEditJobContaionPrams addEditJobContaionPrams) {
    return api.addEditJobRequirements(addEditJobContaionPrams);
  }
}
