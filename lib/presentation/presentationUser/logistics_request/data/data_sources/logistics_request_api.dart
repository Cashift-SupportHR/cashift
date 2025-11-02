import '../../../../../data/models/api_response.dart';
import '../../../../../network/source/admin_endpoint.dart';
import '../../../../../network/source/user_endpoint.dart';
import '../models/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogisticsRequestAPI {
  final UserEndpoint api;

  LogisticsRequestAPI({required this.api});

  Future<ApiResponse<List<CarLogisticsDto>>> fetchCarLogistics() {
    return api.fetchCarLogistics();
  }

  Future<ApiResponse<List<CarTermsAndConditionsDto>>>
  fetchCarTermsAndConditionsDto() {
    return api.fetchCarTermsAndConditionsDto();
  }

  Future<ApiResponse> CanSubmitLogistics() {
    return api.CanSubmitLogistics();
  }

  Future<ApiResponse> addLogistic(AddLogisticPrams prams) {
    return api.addLogistic(prams);
  }
}
