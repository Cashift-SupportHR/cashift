import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../../common/data/repositories/resume/resume_repository.dart';


@Injectable()
class QrCodeCubit extends BaseCubit {
  final ResumeRepository repository;

  QrCodeCubit(this.repository);

  fetchUserData() async {
    try {
      emit(LoadingState());
      final data = await repository.fetchResume();
      emit(Initialized<String>(data: data.idNumber.toString()));
    } catch (e) {
      emit(ErrorState(e));
    }
  }
}
