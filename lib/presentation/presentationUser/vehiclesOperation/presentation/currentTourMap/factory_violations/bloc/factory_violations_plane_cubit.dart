import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import '../../../../../../adminFeatures/vehicles/domain/entities/vehicle_violation.dart';
import '../../../../../common/common_state.dart';
import '../../../../../common/stream_data_state.dart';
import '../../../../data/repositories/vehicles_operation_repository.dart';
import '../../../../domain/entities/index.dart';

@Injectable()
class FactoryViolationsPlaneCubit extends BaseCubit {
  final ReceiveVehiclesRepository _repository;

  FactoryViolationsPlaneCubit(this._repository);

  void fetchInitialData(int roundTripId) async {
    executeBuilder(
      () => _repository.fetchRoundViolation(roundTripId),
      onSuccess: (value) {
        emit(Initialized<ContractViolationData>(data: value));
      },
    );
  }
}
