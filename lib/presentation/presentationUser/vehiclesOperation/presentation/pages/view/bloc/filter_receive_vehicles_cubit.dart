import 'package:injectable/injectable.dart';

import '../../../../../../../../core/bloc/base_cubit.dart';
import '../../../../../../adminFeatures/employees/data/repositories/employees_repository.dart';
import '../../../../../../adminFeatures/employees/domain/entities/shift_employee.dart';
import '../../../../../../adminFeatures/projectsManagement/data/repositories/projects_management_repository.dart';
import '../../../../../../adminFeatures/usersManagement/data/repositories/users_management_repository.dart';
import '../../../../../../adminFeatures/usersManagement/domain/entities/company.dart';
import '../../../../../../shared/models/common_list_item.dart';
import '../../../../../common/common_state.dart';

@injectable
class FilterReceiveVehiclesCubit extends BaseCubit {
  final ProjectsManagementRepository projectsRepository;
  final EmployeesRepository employeesRepository;
  final UsersManagementRepository usersRepository;
  StreamStateInitial<List<CommonListItem>?> projectsStream =
      StreamStateInitial();
  StreamStateInitial<List<ShiftEmployee>?> shiftsStream = StreamStateInitial();
  FilterReceiveVehiclesCubit(
    this.employeesRepository,
    this.projectsRepository,
    this.usersRepository,
  );

  fetchCompany() async {
    executeBuilder(() => projectsRepository.fetchCompanies(),
        onSuccess: (result) async {
      emit(Initialized<List<Company>>(data: result));
    });
  }

  Future<void> fetchProjectsCompanyId(int companyId) async {
    try {
      final data =
          await usersRepository.fetchListProjectsByCompanyId(companyId);
      projectsStream.setData(data);
    } on Exception catch (e) {
      projectsStream.setError(e);
    }
  }

  fetchShiftsByProjects(int projectId) async {
    try {
      final response =
          await employeesRepository.fetchShiftsByProjects(projectId);
      List<ShiftEmployee> shifts =
          response.map((e) => ShiftEmployee.fromDto(e)).toList();
      shiftsStream.setData(shifts);
    } catch (erorr) {
      shiftsStream.setError(erorr);
    }
  }
}
