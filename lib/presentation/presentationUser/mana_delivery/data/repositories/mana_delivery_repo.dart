import 'package:injectable/injectable.dart';

import '../../../../../data/models/api_response.dart';
import '../../domain/entities/index.dart';
import '../data_sources/mana_deliver_api.dart';
import '../models/index.dart';

@injectable
class ManaDeliverRepository {
  final ManaDeliverAPI _api;

  ManaDeliverRepository(this._api);

  Future<ApiResponse> acceptTermsMana(AcceptTermsPrams params) async {
    return await _api.acceptTermsMana(params);
  }

  Future<ApiResponse> confirmReservation(  ConfirmReservationWarningPrams params) async {
    return  await _api.confirmReservation(params);

  }


   Future<ApiResponse> verifyPickupCode(  VerifyCodePrams params){
    return _api.verifyPickupCode(params);
  }


  Future<ApiResponse> verifyDeliveryCode(  VerifyCodePrams params) {
    return _api.verifyDeliveryCode(params);
  }



  Future<ApiResponse> cancelReservation(   int  orderId) async {
     final  data= await _api.cancelReservation(orderId);
    return ApiResponse(
      status: data.status,
      message: "onCancel",
      payload: data.payload,
    );
  }

  Future<List<TermsManaEntity>> fetchTermsMana() async {
    final response = await _api.fetchTermsMana();
    return TermsManaEntity.fromDtoList(response.payload ?? []);
  }

  Future<List<DeliveryOrderEntity>> fetchDeliveryOrders(
    DeliveryOrdersPrams params,
  ) async {
    final response = await _api.fetchDeliveryOrders(params);
    return DeliveryOrderEntity.fromDtoList(response.payload ?? []);
  }

  Future<OrderManaEntity> fetchDeliveryOrdersById(int id) async {
    final response = await _api.fetchDeliveryOrdersById(id);
    return OrderManaEntity.fromDto(response.payload!);
  }

  Future<List<NearbyWarehousesEntity>> fetchNearbyWarehouses(
    DeliveryOrdersPrams params,
  ) async {
    final response = await _api.fetchNearbyWarehouses(params);
    return NearbyWarehousesEntity.fromDtoList(response.payload ?? []);
  }

  Future<PenaltyWarningEntity> fetchPenaltyWarnings() async {
    final response = await _api.fetchPenaltyWarnings();
    return PenaltyWarningEntity.fromDto(response.payload!);
  }
}
