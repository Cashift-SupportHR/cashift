import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/core/resources/data_state.dart';
import 'package:shiftapp/data/models/auth/index.dart';

import 'package:shiftapp/data/exceptions/nobiometric_saved_exception.dart';
 import 'package:shiftapp/data/repositories/login/auth_repository.dart';
import 'package:shiftapp/data/repositories/user/user_repository.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:meta/meta.dart';
 import 'package:shiftapp/core/utils/secure_storage.dart';

@Injectable()
class LoginBloc extends BaseCubit  {

  final UserRepository userRepository;
  final AuthRepository _loginRepository;
  final SecureStorage _secureStorage =SecureStorage() ;

  StreamState<String>  phoneStream= StreamStateInitial() ;

  LoginBloc(this._loginRepository, this.userRepository);

  register(RegisterParams params) async {
      executeListener(() => _loginRepository.register(params), onSuccess: (response){
        emit(VerificationCodeSentListener(phoneNumber: response));
      });
  }

  enableBio(){
    userRepository.setEnableBiometric(true);
  }
  loginBio() async {
     emit(LoadingStateListener());
    try {
      if(userRepository.isEnableBiometric()) {
        final loginParams = await _secureStorage.readLoginParams();
        if (loginParams != null) {
          await _loginRepository.login(loginParams);
          emit(SuccessStateListener(data: loginParams.phone!));
        } else {
         emit(FailureStateListener(NoBiometricSavedException()));
        }
      }else{
        emit(BiometricNotEnabledState());
      }
    }catch(e){
      emit(FailureStateListener(e));
    }

  }

  login(LoginParams loginParams){
    executeListener(() => _loginRepository.login(loginParams), onSuccess: (value) async {
      syncBioParams(loginParams);
      emit(SuccessStateListener(data: value));
    });
  }

  Future<void> syncBioParams(LoginParams loginParams) async {
    try {
      if (userRepository.isEnableBiometric()) {
        _secureStorage.addLoginItem(loginParams);
      } else {
        final params = await _secureStorage.readLoginParams();
        if (params?.phone != loginParams.phone) {
          _secureStorage.deleteAll();
        }
      }
    }catch(e){

    }
  }
}
