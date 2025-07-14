import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';

import '../../../../../../common/data/repositories/resume/resume_repository.dart';
import '../../../../common/common_state.dart';


@Injectable()
class FavoriteJobsCubit extends BaseCubit {
  final ResumeRepository _resumeRepository;

  FavoriteJobsCubit(this._resumeRepository);


  Future<void> fetchJobSkills(int jobId) async {
    emit(LoadingState());
    try {
      final result = await _resumeRepository.fetchJobSkills(jobId);
      emit(Initialized(data: result));
    } catch (e) {
      emit(ErrorState(e));
    }
  }
}