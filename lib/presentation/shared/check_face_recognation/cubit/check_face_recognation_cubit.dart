import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/repositories/profile/profile_repository.dart';
import 'package:shiftapp/common/domain/entities/account/remote_file.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../common/data/models/account/feature_app_dto.dart';
import '../../../../../common/data/repositories/user/user_repository.dart';
import '../../../../../common/domain/entities/account/user.dart';
import 'face_detection_intialize_state.dart';

class CheckFaceRecogenationCubit extends BaseCubit {
  final ProfileRepository repository;
  final UserRepository _userRepository;

  CheckFaceRecogenationCubit(
    this.repository,
    this._userRepository,
  );

  fetchRegisteredFace() async {
    try {
      final faceRecognitionConfig = _userRepository.accountDataToggle();
      final image = await repository.getFaceImageBase64();

      emit(FaceDetectionInitializeState(
        base64Image: image ?? "",
        faceRecognitionConfig: faceRecognitionConfig ?? FaceRecognitionConfig(),
      ));
    } catch (e) {
      emit(FailureStateListener(e));
    }
  }
}
