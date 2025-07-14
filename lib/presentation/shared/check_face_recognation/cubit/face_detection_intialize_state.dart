import 'package:shiftapp/core/resources/data_state.dart';

import '../../../../common/data/models/account/index.dart';
import '../../../presentationUser/common/common_state.dart';

class FaceDetectionInitializeState extends CommonStateFBuilder{
  final String base64Image ;
  final FaceRecognitionConfig faceRecognitionConfig;

  FaceDetectionInitializeState({required this.base64Image, required this.faceRecognitionConfig});


}