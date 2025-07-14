import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/employeesCertificates/data/models/index.dart';
import 'package:shiftapp/presentation/presentationUser/employeesCertificates/data/repositories/employees_certificates_repository.dart';

import '../../../../../../common/components/files/files_manager.dart';

@Injectable()
class EmployeesCertificatesCubit extends BaseCubit {
  final EmployeesCertificatesItemRepository repository;

  EmployeesCertificatesCubit(this.repository);

  StreamStateInitial<List<int>> shareFileStream = StreamStateInitial<List<int>>();


  Future<void> fetchEmployeesCertificates() async {
    emit(LoadingState());
    try {
      final result = await repository.fetchEmployeesCertificates();
      final data = result.map((e) => EmployeeCertificate.fromDto(e)).toList();
      emit(Initialized<List<EmployeeCertificate>>(data: data));
    } on Exception catch (e) {
      emit(ErrorState(e));
    }
  }
  Future<void> shareEmployeeCertificate(int id) async {
    emit(LoadingStateListener());
    try {
      final result = await repository.downLoadEmployeeCertificate(id);
      String filePath = await FilesManager().createFileFromBase64(result.payload!);
      emit(SuccessStateListener<List<XFile>>(data: [XFile(filePath)]));
    } on Exception catch (e) {
      emit(FailureStateListener(e));
    }
  }

  Future<void> downLoadEmployeeCertificate(int id) async {
    emit(LoadingStateListener());
    try {
      final result = await repository.downLoadEmployeeCertificate(id);
       FilesManager().saveFileFromBase64(result.payload!);
      emit(SuccessStateListener(data: result.message));
    } on Exception catch (e) {
      emit(FailureStateListener(e));
    }
  }
}
