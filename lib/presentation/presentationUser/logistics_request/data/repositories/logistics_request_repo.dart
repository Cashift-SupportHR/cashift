import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/data/models/api_response.dart';

import '../../domain/entities/car_logistics.dart';
import '../../domain/entities/car_terms_and_conditions.dart';
import '../data_sources/logistics_request_api.dart';
import '../models/index.dart';

@injectable
class LogisticsRequestRepository {
  final LogisticsRequestAPI _api;

  LogisticsRequestRepository(this._api);

  Future<ApiResponse> addLogistic(AddLogisticPrams params) async {
    return await _api.addLogistic(params);

  }

  Future<ApiResponse> CanSubmitLogistics() async {
    return await _api.CanSubmitLogistics();
  }

  Future<List<CarTermsAndConditionsEntity>> fetchCarTermsAndConditions() async {
    final response = await _api.fetchCarTermsAndConditionsDto();
    return CarTermsAndConditionsEntity.fromDtoList(response.payload ?? []);
  }

  Future<List<CarLogisticsEntity>> fetchCarLogistics() async {
    final response = await _api.fetchCarLogistics();
    return CarLogisticsEntity.fromDtoList(response.payload ?? []);
  }
}
