import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../../common/data/models/salary-definition-request/down_load_salary_definition.dart';
import '../../../../../../common/components/files/files_manager.dart';
import '../../../data/repositories/employees_certificates_repository.dart';

@Injectable()
class EmployeeCertificateDetailsCubit extends BaseCubit {
  final EmployeesCertificatesItemRepository repository;

  EmployeeCertificateDetailsCubit(this.repository);

  Future<void> downLoadEmployeeCertificate(int id) async {
    emit(LoadingState());
    try {
      final result = await repository.downLoadEmployeeCertificate(id);
      if(result.payload?.fileAttachmentType?.toLowerCase() == "pdf"){
        String filePath = await FilesManager().createFileFromBase64(result.payload!);
        result.payload?.fileAttachment = filePath;
      }
      emit(Initialized<DownLoadFileDto>(data: result.payload!));
    } on Exception catch (e) {
      emit(FailureStateListener(e));
    }
  }

}
