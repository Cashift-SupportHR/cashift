import 'dart:io';

 import 'package:injectable/injectable.dart';
 import 'package:shiftapp/data/models/account/index.dart';
import 'package:shiftapp/data/models/api_response.dart';
import 'package:shiftapp/data/models/auth/index.dart';

import '../../../../../domain/entities/account/remote_file.dart';
import '../../../../../network/source/user_endpoint.dart';

@Injectable()
 class ProfileAPI {
  final UserEndpoint api;

  ProfileAPI(this.api);

  Future<ApiResponse<bool>> deleteAccount() async {
    return await api.deleteAccount();
  }

  Future<ApiResponse<List<FeatureAppDto>>> getAppFeatures() async {
    return await api.getAppFeatures();
  }

  Future<ApiResponse<String>> updateFaceRecognition(File files) async {
    return await api.uploadFaceRecognition(files);
  }

  Future<ApiResponse<String>> uploadProfilePhoto(File image) async {
    return await api.uploadProfilePhoto(image);
  }

  Future<ApiResponse> updatePassword(ChangePasswordParams updatePasswordParams) async {
    return await api.updatePassword(updatePasswordParams);
  }

  Future<ApiResponse> checkLogout() async {
    return await api.checkLogout();
  }

  Future<ApiResponse<RemoteFile>> downloadFaceRecognition() async {
    return await api.downloadFaceRecognition();
  }

  Future<ApiResponse<CashifterCodeDto>> fetchCashifterCode( ) async {
    return await api.fetchCashifterCode();
  }

}
