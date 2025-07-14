import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/exceptions/empty_list_exception.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../data/models/edit_vehicle_zone_lat_lng_params.dart';
import '../../../data/repositories/vehicles_zone_repository.dart';
import '../../../domain/entities/vehicle_zone.dart';

@Injectable()
class VehiclesZoneCubit extends BaseCubit {
  final VehiclesZoneRepository repository;

  VehiclesZoneCubit(this.repository);

  List<VehicleZone> searchData = [];

  void fetchInitialData() {
    executeBuilder(() => repository.fetchVehiclesZone(), onSuccess: (data) {
      searchData = data;
      emit(Initialized<List<VehicleZone>>(data: data));
    });
  }

  void searchByText(String value) {
    emit(LoadingState());
    if (value.isEmpty) {
      emit(Initialized<List<VehicleZone>>(data: searchData));
    } else {
      final filteredList = searchData.where((element) {
        return element.companyName!.toLowerCase().contains(value.toLowerCase()) ||
            element.projectName!.toLowerCase().contains(value.toLowerCase()) ||
            element.shiftName!.toLowerCase().contains(value.toLowerCase()) ||
            element.plateNumber!.toLowerCase().contains(value.toLowerCase());
      }).toList();
      print('filteredList: $filteredList');
      if (filteredList.isEmpty) {
        emit(ErrorState(EmptyListException()));
      } else {
        emit(Initialized<List<VehicleZone>>(data: filteredList));
      }
    }
  }

  void editVehiclesCoordinates(EditVehicleZoneLatLngParams params) {
    executeEmitterListener(() => repository.editVehiclesCoordinates(params));
  }

  void deleteVehicleZone(int id) {
    executeEmitterListener(() => repository.deleteVehiclesZone(id));
  }
}
