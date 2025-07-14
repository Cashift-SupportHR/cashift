import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';

import '../data_sources/violations_user_api.dart';
import '../models/approve_reject_violation_params.dart';
import '../models/violation_user_dto.dart';
import '../models/violations_user_data_dto.dart';

@Injectable()
class ViolationsUserRepository {
  final ViolationsUserAPI _api;

  ViolationsUserRepository(this._api);

  Future<ViolationsUserDataDto> fetchViolationsData(int type) async {
    final service = await _api.fetchViolationsData(type);
    return service.payload!;
  }

  Future<ApiResponse<String>> approveRejectViolation(ApproveRejectViolationParams params) async {
    final service = await _api.approveRejectViolation(params);
    return service!;
  }
}
