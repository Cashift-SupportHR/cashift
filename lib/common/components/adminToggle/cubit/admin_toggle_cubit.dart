import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/repositories/profile/profile_repository.dart';
import 'package:shiftapp/common/domain/entities/account/remote_file.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../data/models/account/feature_app_dto.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../domain/entities/account/user.dart';

// @Injectable()
class AdminToggleCubit extends BaseCubit {
  final ProfileRepository repository;
  final UserRepository _userRepository;
  final ProfileRepository _profileRepository;

  AdminToggleCubit(
    this.repository,
    this._userRepository,
    this._profileRepository,
  );


  fetchRegisteredFace() async {
    try {
      final dataToggle = _userRepository.accountDataToggle();
      bool inAdminMode = _userRepository.isEnableAdmin();
      bool? adminEnable = _userRepository.accountServices()?.adminEnable;


      if (adminEnable == true && dataToggle?.isAllowFaceRecognition == true) {
        final image = await repository.getFaceImageBase64();
        emit(InitializedToggleData(
          image: image ?? "",
          isAdmin: inAdminMode,
          adminEnable: adminEnable ?? false,
          isAllowFaceRecognition: dataToggle?.isAllowFaceRecognition ?? false,
          user: User(),
        ));
      } else {
        emit(InitializedToggleData(
          image:"",
          isAdmin: inAdminMode,
          adminEnable: adminEnable ?? false,
          isAllowFaceRecognition: false,
          user: User(),
        ));
      }
    } catch (e) {
      print('InitializedToggleData error $e');
      final dataToggle = _userRepository.accountDataToggle();
      bool isAdmin = _userRepository.isEnableAdmin();
      bool? adminEnable = _userRepository.accountServices()?.adminEnable;
      final user = _userRepository.getUser();


      if (isAdmin == true) {
         emit(FailureStateListener(e));
      }
      emit(InitializedToggleData(
        image: "",
        isAdmin: isAdmin,
        adminEnable: adminEnable ?? false,
        isAllowFaceRecognition: dataToggle?.isAllowFaceRecognition ?? false,
        user: user ?? User(),
      ));
    }
  }

  Future<String> _createFileFromString(RemoteFile remote) async {
    Uint8List bytes = base64.decode(remote.fileAttachment.toString());
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File("$dir/" +
        DateTime.now().millisecondsSinceEpoch.toString() +
        ".${remote.fileAttachmentType.toString()}");
    await file.writeAsBytes(bytes);
    return file.path;
  }

  setEnableAdmin(bool isAdmin) {
    _userRepository.setEnableAdmin(isAdmin);
  }

  bool isAdmin() {
    final data = _userRepository.isEnableAdmin();
    return data;
  }

  FaceRecognitionConfig? getDataToggle() {
    final data = _userRepository.accountDataToggle();
    return data;
  }

  Future<bool> isHaveAdminFeatures() async {
    final appFeatures = await _profileRepository.getAccountServices();
    final haveAdminFeatures = appFeatures.adminEnable == true;
    return haveAdminFeatures;
  }
}
