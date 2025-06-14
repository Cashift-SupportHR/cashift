import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/data/repositories/profile/profile_repository.dart';
import 'package:shiftapp/domain/entities/account/remote_file.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../data/models/account/feature_app_dto.dart';
import '../../../../../data/repositories/user/user_repository.dart';
import '../../../../../domain/entities/account/user.dart';

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
  String? image;

  fetchRegisteredFace() async {
    try {
      final dataToggle = _userRepository.accountDataToggle();
      bool inAdminMode = _userRepository.isEnableAdmin();
      final haveAdminFeatures = await isHaveAdminFeatures();
      bool? adminEnable = _userRepository.accountServices()?.adminEnable;
      if(adminEnable==true){
        final value = await repository.downloadFaceRecognition();
        final file = await _createFileFromString(value.payload!);
        // Uint8List data = File(file).readAsBytesSync();
        // int sizeInBytes = data.length;
        // double sizeInMb = sizeInBytes / (1024 * 1024);
        // print('sizeInMb ${sizeInMb} => ${value.payload?.fileAttachment}');
        image = value.payload?.fileAttachment;
      }
      if (adminEnable==true && dataToggle?.isAllowFaceRecognition== true) {
        emit(InitializedToggleData(
          image: image ?? "",
          isAdmin: inAdminMode,
          haveAdminFeatures:haveAdminFeatures,
          adminEnable: adminEnable ?? false,
          isAllowFaceRecognition: dataToggle?.isAllowFaceRecognition ?? false,
          user: User(),
        ));
      } else {

        emit(InitializedToggleData(
          image: image??"",
          isAdmin: inAdminMode,
          haveAdminFeatures:haveAdminFeatures,
          adminEnable: adminEnable ?? false,
          isAllowFaceRecognition: false,
          user: User(),
        ));
      }
    } catch (e) {
      final dataToggle = _userRepository.accountDataToggle();
      bool isAdmin = _userRepository.isEnableAdmin();
      bool? adminEnable = _userRepository.accountServices()?.adminEnable;
      final user = _userRepository.getUser();
      final haveAdminFeatures = await isHaveAdminFeatures();
      emit(InitializedToggleData(
        image: "",
        isAdmin: isAdmin,
        haveAdminFeatures:haveAdminFeatures,
        adminEnable: adminEnable ?? false,
        isAllowFaceRecognition: dataToggle?.isAllowFaceRecognition ?? false,
        user: user ?? User(),
      ));
      if(isAdmin==true){
        emit(FailureStateListener(e));
      }
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
