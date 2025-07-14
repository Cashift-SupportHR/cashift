
import '../../../../../common/data/models/api_response.dart';
 import '../../../../../common/network/source/admin_endpoint.dart';
import '../models/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClassificationAPI {
  final AdminEndpoint api;

  ClassificationAPI({required this.api});

  Future<ApiResponse<List<ClassificationDto>>> fetchClassification(
      int tapType) {
    return api.fetchClassification(tapType);
  }

  Future<ApiResponse> deleteClassification(int id) {
    return api.deleteClassification(id);
  }

  Future<ApiResponse> addEditClassification(
    int? id,
    int? companyId,
    String? nameAr,
    String? nameEn,
    String? description,
  ) {
    return api.addEditClassification(
        id, companyId, nameAr, nameEn, description);
  }
}
