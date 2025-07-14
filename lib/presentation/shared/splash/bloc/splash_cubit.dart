import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/repositories/profile/profile_repository.dart';
import 'package:shiftapp/common/data/repositories/resume/resume_repository.dart';
import 'package:shiftapp/common/data/repositories/user/user_repository.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../common/data/repositories/local/local_repository.dart';

@Injectable()
class SplashCubit extends Cubit {
  final ResumeRepository resumeRepository;
  final ProfileRepository profileRepository;
  final UserRepository userRepository;
  final LocalRepository localRepository;
  SplashCubit(
      this.resumeRepository, this.userRepository, this.profileRepository, this.localRepository)
      : super(UnInitState());

  checkSessionAndLoadResume() async {
    if (userRepository.isLogged()) {
      try {
        emit(LoadingState());
        final resume = await resumeRepository.fetchResume();
        emit(Initialized(data: true));
      } catch (e) {
        emit(ErrorState(e));
      }
    } else {
      emit(Initialized(data: false));
    }
  }

}
