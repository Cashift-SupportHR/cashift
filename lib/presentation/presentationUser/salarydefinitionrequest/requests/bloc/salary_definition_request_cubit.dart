import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/domain/entities/salary-definition-request/index.dart';
 import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/data/models/salary-definition-request/index.dart';

 import '../../../../../common/data/repositories/salary-definition-request/salary_definition_repository.dart';
import '../../../../shared/components/files/files_manager.dart';

@Injectable()
class SalaryDefinitionRequestCubit extends BaseCubit {
  final SalaryDefinitionRepository repository;

  SalaryDefinitionRequestCubit(this.repository);

  Future<void> fetchSalaryDefinitionRequest(int type) async {
    emit(LoadingState());
    try {
      final result = await repository.fetchSalaryDefinitionRequest(type);
      List<SalaryDefinitionRequest> data =
          (result).map((e) => SalaryDefinitionRequest.fromJson(e)).toList();
      emit(Initialized(data: data));
    } on Exception catch (e) {
      emit(ErrorState(e));
    }
  }

  Future<void> downLoadSalaryDefinition(
      {required String id, required String type}) async {
    emit(LoadingStateListener());
    try {
      final result =
          await repository.downLoadSalaryDefinition(id: id, type: type);
      await base64Strings(result);
      emit(SuccessStateListener(data: 'تم تحميل الملف بنجاح'));
    } on Exception catch (e) {
      emit(FailureStateListener(e));
    }
  }

  base64Strings(DownLoadFileDto response) async {
    try {
      requestPermission();
      FilesManager().saveFileFromBase64(response);
    } on Exception catch (e) {
      print('base64Strings error: $e');
    }
  }

  requestPermission() async {
    final status = await Permission.storage.status;
    if (status.isDenied) {
      await Permission.storage.request();
      print('requestPermission: ${await Permission.storage.status}');
    }else{
      print('requestPermission: ${await Permission.storage.status}');
    }
  }
}
