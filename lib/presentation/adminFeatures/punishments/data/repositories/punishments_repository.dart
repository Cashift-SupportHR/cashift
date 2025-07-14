import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';

import '../datasource/punishments_provider.dart';
import '../models/index.dart';

@injectable
class PunishmentsRepository {

  final PunishmentsAPI _api;

  PunishmentsRepository(this._api);

  Future<List<PunishmentDto>> fetchPunishments(int type) async {
    final response = await _api.fetchPunishments(type);
    return response.payload!;
  }

  Future<ApiResponse<String>> activePunishment(int id) async {
    final response = await _api.activePunishment(id);
    return response;
  }

  Future<ApiResponse<String>> deletePunishment(int id) async {
    final response = await _api.deletePunishment(id);
    return response;
  }

  Future<ApiResponse<String>> addEditPunishment(AddEditPunishmentParams params) async {
    final response = await _api.addEditPunishment(params);
    return response;
  }

  Future<AddEditPunishmentParams> fetchPunishmentById(int id) async {
    final response = await _api.fetchPunishmentById(id);
    return response.payload!;
  }

  Future<List<PunishmentNameDto>> fetchPunishmentsNames() async {
    final response = await _api.fetchPunishmentsNames();
    return response.payload!;
  }

  Future<List<PunishmentTypeDto>> fetchPunishmentsTypes() async {
    final response = await _api.fetchPunishmentsTypes();
    return response.payload!;
  }


}
