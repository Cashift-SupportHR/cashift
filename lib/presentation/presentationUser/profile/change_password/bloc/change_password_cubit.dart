
import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';

import '../../../../../common/data/models/auth/change_password_params.dart';
import '../../../../../common/data/repositories/profile/profile_repository.dart';
import '../../../../../common/data/repositories/user/user_repository.dart';

@Injectable()
class ChangePasswordCubit extends BaseCubit {
  final ProfileRepository _profileRepository;

  ChangePasswordCubit(UserRepository userRepository, this._profileRepository) : super();

  Future<void> changePassword(ChangePasswordParams passwordParams) async {
    executeEmitterListener(() => _profileRepository.changePassword(passwordParams));
  }

}
