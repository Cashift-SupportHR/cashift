import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../common/domain/usecases/respond_required_task_usecase.dart';
import '../../../../../common/domain/usecases/tasks_notifications_usecase.dart';


@Injectable()
class ConfirmAttendanceCubit extends BaseCubit {
  final RespondRequiredTaskUseCase usecase;

  ConfirmAttendanceCubit(this.usecase);

  Future<void> confirmRequiredTask(int type) async {
    emit(LoadingStateListener());
    try {
      final result = await usecase.call(params: type);
      emit(SuccessStateListener(data: result));
    } on Exception catch (e) {
      emit(FailureStateListener(e));
    }
  }
}
