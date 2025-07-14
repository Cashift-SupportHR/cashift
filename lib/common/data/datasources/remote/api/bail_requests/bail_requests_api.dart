
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shiftapp/common/data/models/bail_requests/index.dart';

import '../../../../../network/source/user_endpoint.dart';
import '../../../../models/api_response.dart';

@Injectable()
class BailRequestsAPI {
  final UserEndpoint api;

  BailRequestsAPI(this.api);

  Future<ApiResponse<List<BailRequestDto>>> fetchBailRequests(@Query('type') int type) async {
    final response = await api.fetchBailRequests(type);
    return response;
  }

  Future<ApiResponse<String>> approveRejectBailRequest(@Body() ApproveRejectBailParams params) async {
    return await api.approveRejectBailRequest(params);
  }


  Future<ApiResponse<List<BailTermAndConditionDto>>> fetchBailTermsAndConditions() async {
    final response = await api.fetchBailTermsAndConditions();
    return response;
  }

}
