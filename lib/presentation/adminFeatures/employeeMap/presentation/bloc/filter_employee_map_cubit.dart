import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';

import '../../../../../common/data/repositories/resume/resume_repository.dart';
import '../../../../presentationUser/common/common_state.dart';
import '../../../projectsManagement/data/repositories/projects_management_repository.dart';
import 'filter_emp_map_state.dart';

@Injectable()
class FilterEmployeeMapCubit extends BaseCubit {
  final ProjectsManagementRepository _repository;
  final ResumeRepository _resumeRepository;
  FilterEmployeeMapCubit(
    this._repository,
    this._resumeRepository,
  );

  fetchInitialData() async {
    executeBuilder(() => _resumeRepository.fetchAllCities(),
        onSuccess: (data) async {
      final  jobs=await _repository.fetchAllJobForDrops( );
      emit(Initialized<FilterEmpMapState>(
          data: FilterEmpMapState(cities: data,jobs: jobs)));
    });
  }
}
