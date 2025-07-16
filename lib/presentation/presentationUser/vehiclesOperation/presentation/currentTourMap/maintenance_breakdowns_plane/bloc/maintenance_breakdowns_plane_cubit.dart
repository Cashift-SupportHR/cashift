import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import '../../../../../../adminFeatures/maintenanceAndBreakdowns/domain/entities/maintenance.dart';
import '../../../../../common/common_state.dart';
import '../../../../../common/stream_data_state.dart';
import '../../../../data/repositories/vehicles_operation_repository.dart';
import '../../../../domain/entities/index.dart';

@Injectable()
class MaintenanceBreakdownsPlaneCubit extends BaseCubit {
  final ReceiveVehiclesRepository _repository;

  MaintenanceBreakdownsPlaneCubit(this._repository);

  void fetchInitialData(int roundTripId) async {
    executeBuilder(
      () => _repository.fetchRoundsMaintenance(roundTripId),
      onSuccess: (value) {
        emit(Initialized< MaintenanceData>(data: value));
      },
    );
  }
}
