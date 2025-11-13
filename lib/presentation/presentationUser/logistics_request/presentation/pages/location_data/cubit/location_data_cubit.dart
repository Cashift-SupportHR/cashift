import 'package:injectable/injectable.dart';

import '../../../../../../../core/bloc/base_cubit.dart';
import '../../../../../../../data/repositories/resume/resume_repository.dart';
import '../../../../../../../domain/entities/resume/city_item.dart';
import '../../../../../../../domain/entities/resume/district_item.dart';
import '../../../../../../adminFeatures/projectsManagement/data/repositories/projects_management_repository.dart';
import '../../../../../../adminFeatures/projectsManagement/domain/entities/city.dart';
import '../../../../../common/common_state.dart';
import '../../../../../common/stream_data_state.dart';
import '../../../../data/repositories/logistics_request_repo.dart';

@injectable
class LocationDataCubit extends BaseCubit {
  final LogisticsRequestRepository _repository;
  final ResumeRepository _resumeRepository;
  final ProjectsManagementRepository _projectsManagementRepository;

  LocationDataCubit(
    this._repository,
    this._projectsManagementRepository,
    this._resumeRepository,
  );

  fetchCities() async {
    executeBuilder(
      () async => await _resumeRepository.fetchAllCities(),
      onSuccess: (value) {
        emit(Initialized<List<CityItem>>(data: value));
      },
    );
  }

  StreamDataState<List<DistrictItem>> districtsStream =
      StreamDataStateInitial();

  Future<void> fetchDistricts(int cityId) async {
    try {
      final result = await _resumeRepository.fetchDistricts(cityId);
      districtsStream.setData(result);
    } catch (e) {
      districtsStream.setError(e);
    }
  }
}
