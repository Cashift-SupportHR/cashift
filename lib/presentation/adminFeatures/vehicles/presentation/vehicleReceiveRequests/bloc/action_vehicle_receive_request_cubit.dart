import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';

import '../../../../../../common/data/exceptions/empty_list_exception.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../../../data/models/action_vehicle_receive_request_params.dart';
import '../../../data/models/final_action_vehicle_receive_request_params.dart';
import '../../../data/models/index.dart';

@Injectable()
class ActionVehicleReceiveRequestCubit extends BaseCubit {
  final VehiclesRepository repository;

  ActionVehicleReceiveRequestCubit(this.repository);

  void fetchInitialData(int projectId) async {
    executeMultiMethods(
      [
        repository.fetchVehicleEmployeeByProject(projectId),
        repository.fetchActionVehicleReceiveRequestStatues(),
      ],
      onSuccess: (data) {
        emit(
          Initialized<InitializeActionUserRequests>(
            data: InitializeActionUserRequests(
              employees: data[0],
              statuesList: data[1],
            ),
          )
        );
      },
    );
  }

  void actionVehicleReceiveRequest(ActionVehicleReceiveRequestParams params) {
    executeEmitterListener(() => repository.actionVehicleReceiveRequest(params));
  }
}
