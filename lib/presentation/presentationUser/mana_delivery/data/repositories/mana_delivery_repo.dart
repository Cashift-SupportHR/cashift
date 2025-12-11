
import 'package:injectable/injectable.dart';

import '../data_sources/mana_deliver_api.dart';

@injectable
class ManaDeliverRepository {
  final ManaDeliverAPI _api;

  ManaDeliverRepository(this._api);
  //
  // Future<ApiResponse> addLogistic(AddLogisticPrams params) async {
  //   return await _api.addLogistic(params);
  //
  // }
  //
  // Future<ApiResponse> CanSubmitLogistics() async {
  //   return await _api.CanSubmitLogistics();
  // }
  //
  // Future<List<CarTermsAndConditionsEntity>> fetchCarTermsAndConditions() async {
  //   final response = await _api.fetchCarTermsAndConditionsDto();
  //   return CarTermsAndConditionsEntity.fromDtoList(response.payload ?? []);
  // }
  //
  // Future<List<CarLogisticsEntity>> fetchCarLogistics() async {
  //   final response = await _api.fetchCarLogistics();
  //   return CarLogisticsEntity.fromDtoList(response.payload ?? []);
  // }
}
