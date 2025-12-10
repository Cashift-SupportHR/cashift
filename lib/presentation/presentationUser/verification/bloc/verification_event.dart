part of 'verification_bloc.dart';

@immutable
abstract class VerificationEvent {
  Stream<CommonState> applyAsync(
      {required CommonState currentState,
        required VerificationBloc bloc});
}
class ConfirmOtpEvent extends VerificationEvent{
  final ConfirmOtpParams confirmOtpParams ;
  ConfirmOtpEvent(this.confirmOtpParams);
  @override
  Stream<CommonState> applyAsync({required CommonState currentState, required VerificationBloc bloc}) async*{
    try{
      yield LoadingState();
     final response =  await bloc._authRepository.confirmOtp(confirmOtpParams);
      bloc._secureStorage.deleteAll();
      yield SuccessState(response);
    }catch(e){
      yield ErrorState(e);
    }
  }
}
class ConfirmRestPasswordOtpEvent extends VerificationEvent{
  final ConfirmOtpParams confirmOtpParams ;

  ConfirmRestPasswordOtpEvent(this.confirmOtpParams);
  @override
  Stream<CommonState> applyAsync({required CommonState currentState, required VerificationBloc bloc}) async*{
    try{
      yield LoadingState();
     final token =  await bloc._authRepository.confirmRestPasswordOtp(confirmOtpParams);
     print('ConfirmRestPasswordOtpEvent token ${token}');
      yield SuccessState(token);
    }catch(e){
      yield ErrorState(e);
    }
  }
}

class ResendOtpEvent extends VerificationEvent{
  final String phone;

  ResendOtpEvent(this.phone);
  @override
  Stream<CommonState> applyAsync({required CommonState currentState, required VerificationBloc bloc}) async*{
    try{
      yield LoadingStateListener();
      final response =  await bloc._authRepository.sendRestPasswordCode(phone);
      yield SuccessStateListener(data: response.message ?? '');
    }catch(e){
      yield FailureStateListener(e);
    }
  }
}