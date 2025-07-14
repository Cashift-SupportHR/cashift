import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import '../../../../data/models/index.dart';
import '../../../../domain/entities/index.dart';

@Injectable()
class VehicleViolationDetailsCubit extends BaseCubit {
  final VehiclesRepository repository;

  VehicleViolationDetailsCubit(this.repository);

  void fetchVehicleViolationsById(int id) {
    executeEmitterData(() => repository.fetchVehicleViolationsById(id));
  }
}
