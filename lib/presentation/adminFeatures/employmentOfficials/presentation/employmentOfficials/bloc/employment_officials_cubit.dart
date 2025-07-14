import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/exceptions/empty_list_exception.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../presentationUser/common/stream_data_state.dart';
import '../../../data/repositories/employment_officials_repository.dart';
import '../../../domain/entities/employment_official.dart';


@Injectable()
class EmploymentOfficialsCubit extends BaseCubit {
  final EmploymentOfficialsRepository repository;

  EmploymentOfficialsCubit(this.repository);

  List<EmploymentOfficial> officials = [];

  Future<void> fetchInitialData(int type) async {
    executeBuilder(() => repository.fetchEmploymentOfficials(type), onSuccess: (officialsDto){
      officials = officialsDto.map((e) => EmploymentOfficial.fromDto(e)).toList();
      emit(Initialized<List<EmploymentOfficial>>(data: officials));
    });
  }



  void deleteEmploymentOfficial(int id) {
    executeEmitterListener(() => repository.deleteEmploymentOfficial(id));
  }

  void searchByText(String value) {
    debugPrint('searchByText $value');
    emit(LoadingState());
    List<EmploymentOfficial> projectsSearched = officials;
    if(value.isNotEmpty) {
      projectsSearched = officials
          .where((element) =>
      (element.name != null && element.name!.contains(value)) ||
      (element.email != null && element.email!.contains(value)) ||
      (element.phone != null && element.phone!.contains(value)) ||
      (element.cityName != null && element.cityName!.contains(value)) ||
          (element.address != null && element.address!.contains(value)) ||
          (element.timesOfWork != null && element.timesOfWork!.contains(value)) ||
          (element.workDays != null && element.workDays!.contains(value)) ||
      (element.description != null && element.description!.contains(value))
      ).toList();
      if(projectsSearched.isEmpty) {
        emit(ErrorState(EmptyListException()));
        return;
      }
    } else {
      projectsSearched = officials;
    }
    emit(Initialized<List<EmploymentOfficial>>(data: projectsSearched));
  }
}
