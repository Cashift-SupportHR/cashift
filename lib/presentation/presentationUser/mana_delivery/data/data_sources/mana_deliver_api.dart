import '../../../../../data/models/api_response.dart';
import '../../../../../network/source/admin_endpoint.dart';
import '../../../../../network/source/user_endpoint.dart';
import '../models/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class ManaDeliverAPI {
  final UserEndpoint api;

  ManaDeliverAPI({required this.api});

  // Future<ApiResponse> addLogistic(AddLogisticPrams prams) {
  //   return api.addLogistic(prams);
  // }
}
