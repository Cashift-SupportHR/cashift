
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/data/repositories/profile/profile_repository.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../data/models/account/feature_app_dto.dart';
import '../../../../../data/repositories/user/user_repository.dart';
import '../../../../../domain/entities/account/user.dart';
import '../../../../data/repositories/resume/resume_repository.dart';
import 'face_detection_intialize_state.dart';

class CheckFaceRecogenationCubit extends BaseCubit {
  final ProfileRepository repository;
  final UserRepository _userRepository;
  final ResumeRepository _resumeRepository;

  CheckFaceRecogenationCubit(
    this.repository,
    this._userRepository,
    this._resumeRepository,
  );
  User userData = User();

  fetchRegisteredFace() async {
    try {
      await getUserData();
      final faceRecognitionConfig = _userRepository.accountDataToggle();
      final image = await repository.getFaceImageBase64();
      print('image getFaceImageBase64: $image');
      if (image.isNullOrEmpty()) {
        emit(EmptyFaceImageListener());
      } else {
        emit(FaceDetectionInitializeState(
          base64Image: image ?? "",
          faceRecognitionConfig: faceRecognitionConfig ?? FaceRecognitionConfig(),
        ));
      }
    } catch (e) {
      emit(FailureStateListener(e));
    }
  }

  Future<void> getUserData() async {
    final user = _userRepository.getUser();
    if(user!=null) {
      final response = await _resumeRepository.fetchResume();
      user.name = response.name;
    }
    userData = user ?? User();
  }
}
