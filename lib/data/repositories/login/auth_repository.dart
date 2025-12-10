

import 'package:injectable/injectable.dart';
import 'package:shiftapp/data/datasources/remote/api/auth/auth_api_provider.dart';
import 'package:shiftapp/data/models/api_response.dart';

import 'package:shiftapp/data/repositories/user/user_repository.dart';
import 'package:shiftapp/data/models/auth/index.dart';

import '../../../domain/entities/account/index.dart';

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

  Future<String> confirmRestPasswordOtp(ConfirmOtpParams request) async {
    final response = await loginApi.confirmOtp(request);
    return response.payload?.token ?? '';
  }

  Future<ApiResponse<String>> sendRestPasswordCode(phone){
    return loginApi.sendRestPasswordCode(phone);
  }
  Future<ApiResponse<bool>> restPasswordByCode(RestPasswordParams params){
    return loginApi.restPasswordByCode(params);
  }
}
