import '../../../../../common/data/models/api_response.dart';
 import '../../../../../common/network/source/admin_endpoint.dart';
import '../models/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class PunishmentsAPI {
  final AdminEndpoint api;

  PunishmentsAPI({required this.api});

  Future<ApiResponse<List<PunishmentDto>>> fetchPunishments(int type) {
    return api.fetchPunishments(type);
  }

  Future<ApiResponse<String>> activePunishment(int id) {
    return api.activePunishment(id);
  }

  Future<ApiResponse<String>> deletePunishment(int id) {
    return api.deletePunishment(id);
  }

  Future<ApiResponse<String>> addEditPunishment(
      AddEditPunishmentParams params) {
    return api.addEditPunishment(params);
  }

  Future<ApiResponse<AddEditPunishmentParams>> fetchPunishmentById(int id) {
    return api.fetchPunishmentById(id);
  }

  Future<ApiResponse<List<PunishmentNameDto>>> fetchPunishmentsNames() {
    return api.fetchPunishmentsNames();
  }

  Future<ApiResponse<List<PunishmentTypeDto>>> fetchPunishmentsTypes() {
    return api.fetchPunishmentsTypes();
  }
}
