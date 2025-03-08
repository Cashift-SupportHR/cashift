
import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';

import '../../../../../data/models/auth/change_password_params.dart';
import '../../../../../data/repositories/profile/profile_repository.dart';
import '../../../../../data/repositories/user/user_repository.dart';

@Injectable()
class ChangePasswordCubit extends BaseCubit {
  final ProfileRepository _profileRepository;

  ChangePasswordCubit(UserRepository userRepository, this._profileRepository) : super();

  Future<void> changePassword(ChangePasswordParams passwordParams) async {
    executeEmitterListener(() => _profileRepository.changePassword(passwordParams));
  }

}
