import 'package:injectable/injectable.dart';

import '../../../../../common/data/repositories/resume/resume_repository.dart';
import '../../../../../common/domain/entities/resume/city_item.dart';
import '../../../projectsManagement/data/models/project_management_dto.dart';
import '../../../projectsManagement/data/repositories/projects_management_repository.dart';
import '../../../usersManagement/domain/entities/company.dart';

@Injectable()
class CityUseCase {
  final ResumeRepository repository;
  CityUseCase(this.repository);

  Future<List<CityItem>> call() async {
    final response = await repository.fetchAllCities();
    return response;
  }
}
