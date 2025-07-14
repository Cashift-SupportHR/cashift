import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../data/models/approve_reject_violation_params.dart';
import '../../data/repositories/violations_user_repository.dart';
import '../../domain/entities/violations_data.dart';
@Injectable()
class ViolationsUserCubit extends BaseCubit {
  final ViolationsUserRepository repository;

  ViolationsUserCubit(this.repository);

  Future<void> fetchViolationsData(int type) async {
    executeBuilder(
      () => repository.fetchViolationsData(type),
      onSuccess: (result) async {
        ViolationsData data = ViolationsData.fromDto(result);
        emit(Initialized<ViolationsData>(data: data));
      },
    );
  }

  Future<void> approveRejectViolationFreelance(ApproveRejectViolationParams params) async {
    executeEmitterListener(
      () => repository.approveRejectViolation(params),
    );
  }
}
