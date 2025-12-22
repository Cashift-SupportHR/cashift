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


  Future<ApiResponse<List<DeliveryOrderDto>>> fetchDeliveryOrders(   DeliveryOrdersPrams params){
    return api.fetchDeliveryOrders(params);
  }


  Future<ApiResponse<OrderManaDto>> fetchDeliveryOrdersById(  int id){
    return api.fetchDeliveryOrdersById(id);
  }


  Future<ApiResponse<List<TermsManaDto>>> fetchTermsMana(){
    return api.fetchTermsMana();
  }


  Future<ApiResponse> acceptTermsMana(  AcceptTermsPrams params){
    return api.acceptTermsMana(params);
  }

}
