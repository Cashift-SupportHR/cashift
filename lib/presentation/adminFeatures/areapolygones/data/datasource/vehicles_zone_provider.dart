import 'package:shiftapp/presentation/adminFeatures/vehicles/data/models/vehicles_dto.dart';
import '../../../../../common/data/models/api_response.dart';

import '../../../../../common/network/source/admin_endpoint.dart';
import '../models/add_vehicle_zone_params.dart';
import '../models/edit_vehicle_zone_lat_lng_params.dart';
import '../models/filter_vehicle_zone_params.dart';
import '../models/vehicle_zone_dto.dart';
import 'package:injectable/injectable.dart';

@injectable
class VehiclesZoneAPI {
  final AdminEndpoint api;

  VehiclesZoneAPI({required this.api});

  Future<ApiResponse<List<VehicleZoneDto>>> fetchVehiclesZone() {
    return api.fetchVehiclesZone();
  }

  Future<ApiResponse> addVehicleZone(AddVehicleZoneParams params) {
    return api.addVehicleZone(params);
  }

  Future<ApiResponse> editVehicleZone(AddVehicleZoneParams params) {
    return api.editVehicleZone(params);
  }

  Future<ApiResponse> editVehiclesCoordinates(
      EditVehicleZoneLatLngParams params) {
    return api.editVehiclesCoordinates(params);
  }

  Future<ApiResponse<List<VehiclesDto>>> fetchVehiclesByProjectId(
      int projectId) {
    return api.fetchVehiclesByProjectId(projectId);
  }

  Future<ApiResponse> deleteVehiclesZone(int id) {
    return api.deleteVehiclesZone(id);
  }

  Future<ApiResponse<List<VehicleZoneDto>>> fetchVehiclesZoneAreasByProjectId(FilterVehicleZoneParams params) {
    return api.fetchFilterVehiclesZoneAreas(params);
  }
}
