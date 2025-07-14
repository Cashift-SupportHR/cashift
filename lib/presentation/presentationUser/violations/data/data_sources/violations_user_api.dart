import 'package:injectable/injectable.dart';

import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/user_endpoint.dart';
import '../models/approve_reject_violation_params.dart';
import '../models/violations_user_data_dto.dart';

@Injectable()
class ViolationsUserAPI {
  final UserEndpoint api;

  ViolationsUserAPI(this.api);

  Future<ApiResponse<ViolationsUserDataDto>> fetchViolationsData(int type) async {
    return await api.fetchViolationsData(type);
  }

  Future<ApiResponse<String>> approveRejectViolation(ApproveRejectViolationParams params) async {
    return await api.approveRejectViolation(params);
  }
}
