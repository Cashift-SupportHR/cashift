import 'dart:io';

import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/datasources/remote/api/profile/profile_api_provider.dart';
import 'package:shiftapp/common/data/models/account/feature_app_dto.dart';
import 'package:shiftapp/common/data/models/auth/change_password_params.dart';
import 'package:shiftapp/common/data/repositories/user/user_repository.dart';
import 'package:shiftapp/common/domain/entities/account/index.dart';
import 'package:shiftapp/common/domain/entities/account/remote_file.dart';
import 'package:shiftapp/extensions/extensions.dart';

import '../../models/api_response.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'face_image_cach_utils.dart';

@Injectable()
class ProfileRepository {
  final ProfileAPI _api;
  final UserRepository userRepository;
  ProfileRepository(this._api, this.userRepository);

  Future<bool> deleteAccount() async {
    final response = await _api.deleteAccount();
    return response.payload!;
  }

  Future<AppFeature> getAccountServicesRemote() async {
    final response = await _api.getAppFeatures();
    final List<String> account =
        response.payload!.map((e) => e.code.toString()).toList();
    final AppFeature appFeature = AppFeature(
        bankAccountEnable: account.contains(kBANK_FEATURE),
        rateEnable: account.contains(kRATE_FEATURE),
        isAllowFaceRecognition: account.contains(kADMIN_FEATURE),
        adminEnable: account.contains(kADMIN_FEATURE));
    if (account.contains(kADMIN_FEATURE)) {
      response.payload!.map((e) {
        if (e.code == kADMIN_FEATURE) {
          print(e.code);
           userRepository.saveDataToggel(e.faceRecognitionConfig!);
        final data=  userRepository.accountDataToggle();
          print("ikjjkjkkjjk");
          print(data?.eyeCheck);
          print("ikjjkjkkjjk");
        }
      }).toList();
    }
    userRepository.saveAccountServices(appFeature);
    return appFeature;
  }

  Future<AppFeature> getAccountServices() async {
    if (userRepository.accountServices() != null) {
      final response = userRepository.accountServices();
      return response!;
    } else {
      final response = await _api.getAppFeatures();
      final List<String> account =
          response.payload!.map((e) => e.code.toString()).toList();
      final AppFeature appFeature = AppFeature(
        bankAccountEnable: account.contains(kBANK_FEATURE),
        adminEnable: account.contains(kADMIN_FEATURE),
        isAllowFaceRecognition: account.contains(kADMIN_FEATURE),
        rateEnable: account.contains(kRATE_FEATURE),
      );

      userRepository.saveAccountServices(appFeature);
      return appFeature;
    }
  }

  Future<ApiResponse<String>> uploadPhoto(File file) async {
    final response = await _api.uploadProfilePhoto(file);
    if (response.isSuccessfully()) {
      final user = userRepository.getUser();
      user?.profileImagePath = response.payload.toString();
      userRepository.updateUser(user!);
    }
    return response;
  }

  Future<ApiResponse<String>> updateFaceRecognition(File file) async {
    final response = await _api.updateFaceRecognition(file);
    ImageCacheUtil.deleteCachedImage();
    return response;
  }

  Future<ApiResponse> changePassword(ChangePasswordParams params) async {
    final response = await _api.updatePassword(params);
    // log('get response data = ${response.');
    return response;
  }
/*


  Future<String> changePassword(ChangePasswordParams params) async {
    final response = await _api.changePassword(params);
    return response.message!;
  }
*/

  Future<String> checkLogout() async {
    final response = await _api.checkLogout();
    return response.message!;
  }

  Future<ApiResponse<RemoteFile>> downloadFaceRecognition() async {
    final response = await _api.downloadFaceRecognition();
    final fileBase64 = response.payload?.fileAttachment;
    if(fileBase64!=null){
      ImageCacheUtil.saveOrUpdateBase64Image(fileBase64);
    }
    return response;
  }

  Future<String?> getFaceImageBase64() async {
    final cached = await ImageCacheUtil.isImageCached();
    print('getFaceImageBase64 $cached');
    if(cached){
      return await  ImageCacheUtil.getCachedImageAsBase64();
    }else {
      final response = await _api.downloadFaceRecognition();
      final fileBase64 = response.payload?.fileAttachment;
      if(fileBase64!=null){
        ImageCacheUtil.saveOrUpdateBase64Image(fileBase64);
      }
      return response.payload?.fileAttachment;
    }
  }



}
