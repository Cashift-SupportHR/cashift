
import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../common/domain/usecases/respond_required_task_usecase.dart';



@Injectable()
class RequiredTasksCubit extends BaseCubit {
  final RespondRequiredTaskUseCase usecase;

  RequiredTasksCubit(this.usecase);


  Future<void> confirmRequiredTask(int type) async {
    emit(LoadingStateListener());
    try {
     final result = await usecase.call(params: type);
      emit(SuccessStateListener<String>(data: result));
    } on Exception catch (e) {
      emit(FailureStateListener(e));
    }
  }

}
