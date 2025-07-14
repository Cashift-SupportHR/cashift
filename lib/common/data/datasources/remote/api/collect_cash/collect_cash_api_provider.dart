import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/domain/entities/collect_cash/index.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
 import '../../../../../network/source/user_endpoint.dart';


@Injectable()
class CollectCashAPI {
  final UserEndpoint api;
  CollectCashAPI(this.api);


  Future<ApiResponse<List<DuesItem>>> fetchCollectedAndNonCollectedJobs(int statusId){
    return api.fetchCollectedAndNonCollectedJobs(statusId);
  }

  Future<ApiResponse<List<JobCash>>> fetchWallet(){
    return api.fetchWallet();
  }

  Future<ApiResponse<String>> generateReceiveCashCode( int id ,int type ){
    return api.generateReceiveCashCode(id,type);
  }

  Future<ApiResponse<List<Cashier>>> fetchCashierList( int id) async {
    return await api.fetchCashierList(id);
  }

}
