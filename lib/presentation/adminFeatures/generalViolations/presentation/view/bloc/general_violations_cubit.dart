import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/exceptions/empty_list_exception.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../data/repositories/general_violations_repository.dart';
import '../../../domain/entities/index.dart';

@Injectable()
class GeneralViolationsCubit extends BaseCubit {
  final GeneralViolationsRepository repository;

  GeneralViolationsCubit(this.repository);

  List<GeneralViolation> workHazards = [];

  void fetchInitialData() {
    executeBuilder(() => repository.fetchGeneralViolations(), onSuccess: (data) {
      workHazards = data;
      emit(Initialized<List<GeneralViolation>>(data: data));
    });
  }

  void searchByText(String value) {
    emit(LoadingState());
    if (value.isEmpty) {
      emit(Initialized<List<GeneralViolation>>(data: workHazards));
    } else {
      final filteredList = workHazards.where((element) {
        return element.scheduleViolationName!
                .toLowerCase()
                .contains(value.toLowerCase()) ||
            element.companyName!
                .toLowerCase()
                .contains(value.toLowerCase()) ||
            element.projectName!
                .toLowerCase()
                .contains(value.toLowerCase());
      }).toList();
      print('filteredList: $filteredList');
      if (filteredList.isEmpty) {
        emit(ErrorState(EmptyListException()));
      } else {
        emit(Initialized<List<GeneralViolation>>(data: filteredList));
      }
    }
  }
}
