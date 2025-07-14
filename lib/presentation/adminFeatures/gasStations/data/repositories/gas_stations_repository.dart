import 'package:injectable/injectable.dart';
import 'package:shiftapp/presentation/adminFeatures/gasStations/data/models/add_edit_gas_station_prams.dart';
import '../../../../../common/data/models/api_response.dart';
import '../../../generalViolations/domain/entities/violation_by_project_id.dart';
import '../../domain/entities/GasStation.dart';
import '../data_sources/gas_stations_provider.dart';

@injectable
class GasStationsRepository {
  final GasStationsAPI _api;

  GasStationsRepository(this._api);

  Future<List<GasStation>> fetchGasStation() async {
    final response = await _api.fetchGasStation();
    final data = response.payload!.map((e) => GasStation.fromDto(e)).toList();
    return data;
  }

  Future<ApiResponse> addEditGasStation(
      AddEditGasStationPrams addEditGasStationPrams) async {
    final response = await _api.addEditGasStation(addEditGasStationPrams);
    return response;
  }

  Future<ApiResponse> deleteGasStation(int id) async {
    final response = await _api.deleteGasStation(id);
    return response;
  }
}
