import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/bail_requests/index.dart';
import '../../datasources/remote/api/bail_requests/bail_requests_api.dart';

@Injectable()
class BailRequestsRepository {

  final BailRequestsAPI _api;

  BailRequestsRepository(this._api);

  Future<List<BailRequestDto>> fetchBailRequests(int type) async {
    final service = await _api.fetchBailRequests(type);
    return service.payload!;
  }

  Future<String> approveRejectBailRequest(ApproveRejectBailParams params) async {
    final service = await _api.approveRejectBailRequest(params);
    return service.message!;
  }

  Future<List<BailTermAndConditionDto>> fetchBailTermsAndConditions() async {
    final service = await _api.fetchBailTermsAndConditions();
    return service.payload!;
  }

}