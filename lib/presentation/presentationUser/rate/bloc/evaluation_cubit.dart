import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/repositories/evaluation/evaluation_repository.dart';
import 'package:shiftapp/common/domain/entities/evulation/index.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

@Injectable()
class EvaluationCubit extends BaseCubit {
  final EvaluationRepository repository;

  EvaluationCubit(this.repository);
  Future<void> loadEvaluations(int transactionId) async {
    try {
      emit(LoadingState());
      final evaluations = await repository.fetchEvaluationItems(transactionId);
      emit(Initialized(data: evaluations));
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  Future<void> saveEvaluations(EvaluationParams params) async {
    try {
      emit(LoadingStateListener());
      final evaluations = await repository.saveEvaluations(params);
      emit(SuccessStateListener(data: evaluations));
    } catch (e) {
      print('saveEvaluations $e');
      emit(FailureStateListener(e));
    }
  }
}
