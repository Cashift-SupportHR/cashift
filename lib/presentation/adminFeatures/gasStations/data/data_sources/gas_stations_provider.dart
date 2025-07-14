import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/admin_endpoint.dart';
import 'package:injectable/injectable.dart';

import '../models/add_edit_gas_station_prams.dart';
import '../models/gas_station_dto.dart';

@injectable
class GasStationsAPI {
  final AdminEndpoint api;

  GasStationsAPI({required this.api});

  Future<ApiResponse<List<GasStationDto>>> fetchGasStation() {
    return api.fetchGasStation();
  }

  Future<ApiResponse> addEditGasStation(
      AddEditGasStationPrams addEditGasStationPrams) {
    return api.addEditGasStation(addEditGasStationPrams);
  }

  Future<ApiResponse> deleteGasStation(int id) {
    return api.deleteGasStation(id);
  }
}
