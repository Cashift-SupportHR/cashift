import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/models/auth/rest_password_params.dart';
import 'package:shiftapp/common/data/repositories/login/auth_repository.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
@Injectable()
class ForgetPasswordCubit extends BaseCubit{
  final AuthRepository _repository;

  ForgetPasswordCubit(this._repository);
  Future<void> sendRestPasswordCode(String phone) async {
    try{
      emit(LoadingStateListener());
      final msg = await     _repository.sendRestPasswordCode(phone);
      emit(SuccessStateListener(data: msg.message));
    }catch(e){
      print('');
      emit(FailureStateListener(e));
    }
  }

  Future<void> restPasswordByCode(RestPasswordParams params) async {
    _repository.restPasswordByCode(params);
    try{
      emit(LoadingStateListener());
      final msg = await        _repository.restPasswordByCode(params);

      emit(SuccessStateListener(data: msg.message));
    }catch(e){
      print('');
      emit(FailureStateListener(e));
    }
  }

}