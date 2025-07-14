
import 'package:injectable/injectable.dart';

import '../../../../../common/data/models/api_response.dart';
import '../../../vehicles/domain/entities/vehicle.dart';
import '../../domain/entities/vehicle_zone.dart';
import '../datasource/vehicles_zone_provider.dart';
import '../models/add_vehicle_zone_params.dart';
import '../models/edit_vehicle_zone_lat_lng_params.dart';
import '../models/filter_vehicle_zone_params.dart';


@injectable
class VehiclesZoneRepository {
  final VehiclesZoneAPI _api;

  VehiclesZoneRepository(this._api);

  Future<List<VehicleZone>> fetchVehiclesZone() async {
    final data = await _api.fetchVehiclesZone();
    return VehicleZone.fromListDto(data.payload ?? []);
  }

  Future<ApiResponse> addVehicleZone(AddVehicleZoneParams params) async {
    return await _api.addVehicleZone(params);
  }

  Future<ApiResponse> editVehicleZone( AddVehicleZoneParams params) async {
    return await _api.editVehicleZone(params);
  }

  Future<ApiResponse> editVehiclesCoordinates(EditVehicleZoneLatLngParams params) async {
    return await _api.editVehiclesCoordinates(params);
  }

  Future<List<Vehicle>> fetchVehiclesByProjectId(int projectId) async {
    final data = await _api.fetchVehiclesByProjectId(projectId);
    return Vehicle.fromListDto(data.payload ?? []);
  }

  Future<ApiResponse> deleteVehiclesZone(int id) async {
    return await _api.deleteVehiclesZone(id);
  }

  Future<List<VehicleZone>> fetchVehiclesZoneAreasByProjectId(FilterVehicleZoneParams params) async {
    final data = await _api.fetchVehiclesZoneAreasByProjectId(params);
    return VehicleZone.fromListDto(data.payload ?? []);
  }
}
