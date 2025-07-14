
import 'package:injectable/injectable.dart';

import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/user_endpoint.dart';
import '../models/pledge_generalization_dto.dart';

@Injectable()
class PledgesAndGeneralizationAPI {
  final UserEndpoint api;

  PledgesAndGeneralizationAPI(this.api);

  Future<ApiResponse<List<PledgeGeneralizationDto>>> fetchPledgesAndGeneralization(int type) async {
    return await api.fetchPledgesAndGeneralization(type);
  }

  Future<ApiResponse<String>> resetPledgesAndGeneralization(int id) async {
    return await api.resetPledgesAndGeneralization(id);
  }

}
