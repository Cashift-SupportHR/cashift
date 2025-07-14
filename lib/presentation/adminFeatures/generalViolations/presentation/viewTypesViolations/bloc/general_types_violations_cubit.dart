import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/exceptions/empty_list_exception.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../data/repositories/general_violations_repository.dart';
import '../../../domain/entities/index.dart';

@Injectable()
class GeneralTypesViolationsCubit extends BaseCubit {
  final GeneralViolationsRepository repository;

  GeneralTypesViolationsCubit(this.repository);

  List<ViolationType> violationsTypes = [];

  void fetchInitialData() {
    executeBuilder(() => repository.fetchAllViolationsTypes(), onSuccess: (data) {
      violationsTypes = data;
      emit(Initialized<List<ViolationType>>(data: data));
    });
  }

  void searchByText(String value) {
    emit(LoadingState());
    if (value.isEmpty) {
      emit(Initialized<List<ViolationType>>(data: violationsTypes));
    } else {
      final filteredList = violationsTypes.where((element) {
        return element.nameAr!
                .toLowerCase()
                .contains(value.toLowerCase()) ||
            element.nameEn!
            .toLowerCase()
            .contains(value.toLowerCase()) ||
            element.companyName!
                .toLowerCase()
                .contains(value.toLowerCase()) ||
            element.projectName!
                .toLowerCase()
                .contains(value.toLowerCase());
      }).toList();
      if (filteredList.isEmpty) {
        emit(ErrorState(EmptyListException()));
      } else {
        emit(Initialized<List<ViolationType>>(data: filteredList));
      }
    }
  }
}
