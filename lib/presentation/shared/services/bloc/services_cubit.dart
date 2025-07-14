import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/datasources/remote/unauthorized_exception.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../common/data/repositories/service/service_repository.dart';
import '../../../../common/data/repositories/user/user_repository.dart';

@Injectable()
class ServicesCubit extends BaseCubit {
  final ServiceRepository serviceRepository;
  final UserRepository userRepository;

  ServicesCubit(this.serviceRepository,   this.userRepository);

  fetchAppService() async {
    try {
      emit(LoadingState());
      if (userRepository.isNotLoggedIn()) {
        emit(ErrorState(UnAuthorizedException()));
        return;
      }
      final service =
          await serviceRepository.fetchService(userRepository.isEnableAdmin());


      emit(Initialized(data: service));
    } catch (e) {
      emit(ErrorState(e));
    }
  }



  String getAccessToken() {
    String data = userRepository.getAccessToken();

    return data;
  }
}
