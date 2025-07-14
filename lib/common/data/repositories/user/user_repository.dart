import 'dart:async';
import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:injectable/injectable.dart';
 import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftapp/common/data/datasources/local/constants.dart';
import 'package:shiftapp/common/domain/entities/account/app_feature.dart';
import 'package:shiftapp/common/domain/entities/resume/resume.dart';
import 'package:shiftapp/common/domain/entities/account/user.dart';

import '../../models/account/feature_app_dto.dart';
import '../profile/face_image_cach_utils.dart';
@injectable
class UserRepository {
  final SharedPreferences? preferences;
  final key = LocalConstants.USER_KEY;
  final bioKey = LocalConstants.BIOMETRIC_KEY;
  final adminKey = LocalConstants.ADMIN_KEY;

  UserRepository(this.preferences);

  saveUser(User user) {
    final json = jsonEncode(user.toJson());
    preferences!.setString(key, json);
  }

  saveResume(Resume resume) {
    final json = jsonEncode(resume.toJson());
    preferences!.setString(LocalConstants.RESUME_KEY, json);
  }

  saveAccountServices(AppFeature services) {
    final json = jsonEncode(services.toJson());
    preferences!.setString(LocalConstants.SERVICES_KEY, json);
  }

  saveDataToggel( FaceRecognitionConfig faceRecognitionConfig) {
    final json = jsonEncode(faceRecognitionConfig.toJson());
    preferences!.setString(LocalConstants.Toggel_KEY, json);
  }

  @nullable
  AppFeature? accountServices() {
    final json = preferences?.getString(LocalConstants.SERVICES_KEY);
    if (json != null) {
      final services = AppFeature.fromJson(jsonDecode(json));

      return services;
    } else {
      return null;
    }
  }
  @nullable
  FaceRecognitionConfig? accountDataToggle() {
    final json = preferences?.getString(LocalConstants.Toggel_KEY);
    if (json != null) {
      final data = FaceRecognitionConfig.fromJson(jsonDecode(json));

      return data;
    } else {
      return null;
    }
  }

  updateUser(User user) {
    user.token = getAccessToken();
    final json = jsonEncode(user.toJson());
    preferences!.setString(key, json);
  }

  bool isLogged() {
    return preferences?.containsKey(key)==true;
  }

  bool isEnableBiometric() {
    return (preferences?.containsKey(bioKey)==true) && preferences?.getBool(bioKey)==true ;
  }

   setEnableBiometric(bool enabled) {
     preferences?.setBool(bioKey, enabled) ;
  }

  bool isEnableAdmin() {
    return preferences!.containsKey(adminKey) && preferences?.getBool(adminKey)==true ;
  }

   setEnableAdmin(bool enabled) {
     preferences?.setBool(adminKey, enabled) ;
  }

  Stream<User?> getUserStream() async* {
    final userJson = preferences!.getString(key);
    if(userJson!=null) {
      final user = User.fromJson(jsonDecode(userJson));
      yield user;
    }else {
      yield null ;
    }
  }

  void clearUser() {
    preferences!.remove(key);
    preferences!.remove(adminKey);
    preferences!.remove( LocalConstants.RESUME_KEY);
    ImageCacheUtil.deleteCachedImage();

    print('user jsoin after ${getUser()?.toJson()}');
  }
  clearAll() {
    preferences!.clear();
  }

  @nullable
  User? getUser() {
    final userJson = preferences?.getString(key);
    if (userJson != null) {
      final user = User.fromJson(jsonDecode(userJson));
      return user;
    } else {
      return null;
    }
  }


  @nullable
  String getAccessToken() {
    final userJson = preferences!.getString(key);
    if (userJson != null) {
      final user = User.fromJson(jsonDecode(userJson));
      return user.token!;
    } else {
      return '';
    }
  }

  bool isNotLoggedIn() {
    return getUser() == null;
  }
}
