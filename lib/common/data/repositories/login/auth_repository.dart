

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/datasources/remote/api/auth/auth_api_provider.dart';
import 'package:shiftapp/common/data/models/api_response.dart';

import 'package:shiftapp/common/data/repositories/user/user_repository.dart';
import 'package:shiftapp/common/data/models/auth/index.dart';

@Injectable()
class AuthRepository {
  final AuthAPI loginApi;
  final UserRepository userRepository;
  AuthRepository(this.loginApi, this.userRepository);

  Future<String> login(LoginParams request) async {
    final response = await loginApi.login(request);
    if (response.isSuccessfully()) {
      userRepository.saveUser(response.payload!);
    }
    return response.message??'';
  }

  Future<String> register(RegisterParams request) async {
    final response = await loginApi.register(request);
    return response.payload!;
  }
  Future<String> confirmOtp(ConfirmOtpParams request) async {
    final response = await loginApi.confirmOtp(request);

    if (response.isSuccessfully()) {
      userRepository.clearAll();
      userRepository.saveUser(response.payload!);
    }
    return response.message!;
  }
  Future<ApiResponse<String>> confirmRestPasswordOtp(ConfirmOtpParams request) async {
   return  loginApi.confirmRestPasswordOtp(request);
  }

  Future<ApiResponse<String>> sendRestPasswordCode(phone){
    return loginApi.sendRestPasswordCode(phone);
  }
  Future<ApiResponse<bool>> restPasswordByCode(RestPasswordParams params){
    return loginApi.restPasswordByCode(params);
  }
}
