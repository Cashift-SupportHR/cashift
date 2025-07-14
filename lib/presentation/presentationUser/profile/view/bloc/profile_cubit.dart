import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../common/data/datasources/remote/unauthorized_exception.dart';
  import '../../../../../common/data/repositories/profile/profile_repository.dart';
import '../../../../../common/data/repositories/resume/resume_repository.dart';
import '../../../../../common/data/repositories/user/user_repository.dart';

@Injectable()
class ProfileCubit extends BaseCubit {
  final UserRepository _userRepository;
  final ProfileRepository _profileRepository;
  final ResumeRepository _resumeRepository;

  ProfileCubit(UserRepository userRepository, this._profileRepository ,this._resumeRepository)
      : _userRepository = userRepository,
        super();

  notifyUpdate() {
    emit(Initialized(data: true));
  }

  Future<void> fetchProfileData() async {
    try {
      emit(LoadingState());
      final user = _userRepository.getUser();
      if(user==null){
        emit(ErrorState(UnAuthorizedException()));
        return ;
      }
      final response = await _resumeRepository.getResumeFromLocal();
      print('FetchProfile ${user.toJson()}');
      final accountServices = await _profileRepository.getAccountServices();
      user.name = response.name;
      emit(ProfileInitialize(user: user,accountServices: accountServices));
    } catch (e, s) {
      print(s);
      emit(ErrorState(e));
    }
  }

Future<void> fetchResumeData() async {
    try {
      final user = _userRepository.getUser();
      print('FetchResume $user');
      if(user!=null) {
        final response = await _resumeRepository.fetchResume();
        user.name = response.name;
        emit(Initialized(data: user));
      } else {
        emit(ErrorState(UnAuthorizedException()));
      }
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  Future<void> checkLogout() async {
    executeListener(() => _profileRepository.checkLogout(), onSuccess: (data){
      FirebaseMessaging.instance.deleteToken();
      _userRepository.clearUser();
      emit(UpdateHomeState(''));
    });
  }

  Future<void> localLogout() async {
    try {
      emit(LoadingStateListener());
      _userRepository.clearUser();
      FirebaseMessaging.instance.deleteToken();
      emit(UpdateHomeState(''));
    } catch (e) {
      emit(FailureStateListener(e));
      rethrow;
    }
  }

  Future<void> updateProfileImage(File file) async {
    executeEmitterListener(() => _profileRepository.uploadPhoto(file));
  }


  Future<void> deleteAccount() async {
    executeBuilder(() => _profileRepository.deleteAccount(), onSuccess: (data){
     _userRepository.clearUser();
     emit(UpdateHomeState(''));
    });
  }
}
