import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';

import '../../../../../../common/data/exceptions/empty_list_exception.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/common/stream_data_state.dart';
import '../../../../../presentationUser/vehiclesOperation/domain/entities/receive_vehicle_details.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../../../data/models/action_vehicle_receive_request_params.dart';
import '../../../data/models/final_action_vehicle_receive_request_params.dart';
import '../../../data/models/index.dart';
import '../../../domain/entities/vehicle_receive_request.dart';

@Injectable()
class VehicleReceiveRequestsCubit extends BaseCubit {
  final VehiclesRepository repository;

  VehicleReceiveRequestsCubit(this.repository);

  StreamDataStateInitial<List<VehicleReceiveRequest>?>
      vehicleReceiveRequestsStream = StreamDataStateInitial();
  List<VehicleReceiveRequest> vehicleReceiveRequests = [];

  void fetchInitialData() async {
    executeBuilder(
      () => repository.fetchVehicleReceiveRequestTypesTabs(),
      onSuccess: (data) {
        if (data.isNotEmpty) {
          fetchUsersRequests(data[0].id!);
        }
        emit(Initialized<List<CommonListItem>>(data: data));
      },
    );
  }

  void fetchUsersRequests(int type) async {
    try {
      vehicleReceiveRequestsStream.start();
      final data = await repository.fetchVehicleReceiveRequestsByType(type);
      vehicleReceiveRequests = data;
      vehicleReceiveRequestsStream.setData(data);
    } catch (e) {
      vehicleReceiveRequestsStream.setError(e);
    }
  }

  void searchByText(String value) {
    vehicleReceiveRequestsStream.start();
    if (value.isEmpty) {
      vehicleReceiveRequestsStream.setData(vehicleReceiveRequests);
    } else {
      final filteredList = vehicleReceiveRequests.where((element) {
        return element.vehicleName!
            .toLowerCase()
            .contains(value.toLowerCase()) ||
            element.vehiclePlateNumber!.toLowerCase().contains(value.toLowerCase()) ||
            element.type!.toLowerCase().contains(value.toLowerCase());
      }).toList();
      print('filteredList: $filteredList');
      if (filteredList.isEmpty) {
        vehicleReceiveRequestsStream.setError(EmptyListException());
      } else {
        vehicleReceiveRequestsStream.setData(filteredList);
      }
    }
  }

  void finalActionVehicleReceiveRequest(
      FinalActionVehicleReceiveRequestParams params) {
    executeEmitterListener(
        () => repository.finalActionVehicleReceiveRequest(params));
  }
}
