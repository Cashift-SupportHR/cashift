import 'package:injectable/injectable.dart';
import 'package:shiftapp/data/models/api_response.dart';
import 'package:shiftapp/data/models/auth/index.dart';

import '../../../../../network/source/user_endpoint.dart';
import 'package:shiftapp/domain/entities/account/user.dart';

@Injectable()
class AuthAPI {
  final UserEndpoint api;

  AuthAPI({required this.api});

  Future<ApiResponse<User>> login(LoginParams loginParams) {
    return api.login(loginParams);
  }

  Future<ApiResponse<User>> confirmOtp(ConfirmOtpParams loginParams) {
    return api.confirmOtp(loginParams);
  }

  Future<ApiResponse<User>> refreshToken(RefreshTokenParams params) {
    return api.refreshToken(params);
  }

  Future<ApiResponse<String>> confirmRestPasswordOtp(
      ConfirmOtpParams loginParams) {
    return api.confirmRestPasswordOtp(loginParams);
  }

  Future<ApiResponse<String>> register(RegisterParams loginParams) {
    return api.register(loginParams);
  }

  Future<ApiResponse<String>> sendRestPasswordCode(String phoneNumber) {
    return api.sendRestPasswordCode(phoneNumber);
  }

  Future<ApiResponse<bool>> restPasswordByCode(RestPasswordParams phoneNumber) {
    return api.restPasswordByCode(phoneNumber);
  }
}
