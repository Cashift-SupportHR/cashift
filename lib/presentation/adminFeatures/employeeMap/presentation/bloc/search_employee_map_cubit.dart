import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';

import '../../../../../common/data/repositories/resume/resume_repository.dart';
import '../../../../presentationUser/common/common_state.dart';
import '../../data/models/fetch_emp_map_prams.dart';
import '../../data/repositories/emp_map_repository.dart';
import '../../domain/entities/EmpMap.dart';

@Injectable()
class SearchEmployeeMapCubit extends BaseCubit {
  final EmployeeMapRepository _repository;
  final ResumeRepository _resumeRepository;
  SearchEmployeeMapCubit(
    this._repository,
    this._resumeRepository,
  );

  fetchInitialData(FetchEmpMapPrams fetchEmpMapPrams) async {
    executeBuilder(() => _repository.fetchEmpInfoLoc(fetchEmpMapPrams),
        onSuccess: (result) {
      final data = EmpMap.fromDto(result);
      emit(Initialized<EmpMap>(data: data));
    });
  }
}
