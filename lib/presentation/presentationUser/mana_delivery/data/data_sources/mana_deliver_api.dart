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


  Future<ApiResponse<List<NearbyWarehousesDto>>> fetchNearbyWarehouses( DeliveryOrdersPrams params){
    return api.fetchNearbyWarehouses(params);
  }


  Future<ApiResponse<PenaltyWarningDto>> fetchPenaltyWarnings( ){
    return api.fetchPenaltyWarnings();
  }

   Future<ApiResponse> confirmReservation(  ConfirmReservationWarningPrams params){
    return api.confirmReservation(params);
   }

   Future<ApiResponse> cancelReservation(   int  orderId){
     return api.cancelReservation(orderId);
   }

  Future<ApiResponse<MyOrderDto>> fetchMyOrders(MyOrderPrams params ){
    return api.fetchMyOrders(params);
  }


  Future<ApiResponse> verifyPickupCode(  VerifyCodePrams params){
    return api.verifyPickupCode(params);
  }


  Future<ApiResponse> verifyDeliveryCode(  VerifyCodePrams params) {
    return api.verifyDeliveryCode(params);
  }


  Future<ApiResponse> acceptTermsMana(  AcceptTermsPrams params){
    return api.acceptTermsMana(params);
  }

}
