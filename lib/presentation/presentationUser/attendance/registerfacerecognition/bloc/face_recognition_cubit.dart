import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/files/files_manager.dart';

import '../../../../../data/datasources/local/constants.dart';
import '../../../../../data/models/salary-definition-request/down_load_salary_definition.dart';
import '../../../../../data/repositories/profile/profile_repository.dart';
import '../../../../../domain/entities/account/registered_face.dart';
import '../../../../../domain/entities/account/remote_file.dart';

@Injectable()
class FaceRecognitionCubit extends BaseCubit {
  final ProfileRepository repository;
  FaceRecognitionCubit(this.repository);
  void saveFace(File value) {
    executeEmitterListener(() => repository.updateFaceRecognition(value));
  }

  void downloadFaceRecognition() async {
    executeBuilder(() => repository.downloadFaceRecognition(),
        onSuccess: (remoteFile) async {
      final face = await mapRemoteFileToFace(remoteFile.payload);
      print('isEdit ${face.eligibleToUpdate}');
      saveFaceRecognitionEncryptedFile(remoteFile.payload!);
      emit(Initialized<RegisteredFace>(data: face));
    }, onError: (e) {
      emit(Initialized<RegisteredFace?>(data: null));
    });
  }

  mapRemoteFileToFace(RemoteFile? remoteFile) async {
    String filePath = '';
    if (remoteFile == null) {
      filePath = '';
    } else {
      filePath = await FilesManager().createFileFromBase64(
        DownLoadSalaryDefinition(
            fileAttachment: remoteFile.fileAttachment,
            fileName: remoteFile.fileName,
            fileAttachmentType: remoteFile.fileAttachmentType),
      );
    }
    return RegisteredFace(filePath, remoteFile?.allowedEdit == true, remoteFile?.notes ?? "");
  }

  Future<void> saveFaceRecognitionEncryptedFile(RemoteFile remoteFile ) async {
    try {
      // String ext = remoteFile.fileAttachmentType ?? 'png';
      final dir = await getApplicationDocumentsDirectory();
      final path = '${dir.path}/${remoteFile.fileName}';
      saveFilePath(path);
      File file = File(path);
      final decodedBytes = base64Decode(remoteFile.fileAttachment ?? '');
      file.writeAsBytesSync(decodedBytes);
      print('saveFaceRecognitionEncryptedFile path $path');
    } on Exception catch (e) {
      print('saveFaceRecognitionEncryptedFile Error $e');
    }
  }

  saveFilePath(String path) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(LocalConstants.RecognitionEncryptedFilePATH, path);
  }
}
