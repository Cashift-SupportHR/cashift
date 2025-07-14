import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/domain/entities/workerWorkPlaces/index.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/data/models/workerWorkPlaces/index.dart';
import '../../../../../common/data/repositories/workerWorkPlaces/worker_work_places_repository.dart';


@Injectable()
class WorkerWorkPlacesCubit extends BaseCubit {
  final WorkerWorkPlacesRepository repository;

  WorkerWorkPlacesCubit(this.repository);

  Future<void> loadInitialData() async {
    emit(LoadingState());
    try {

      FocusPointInfo focusPointInfo =  await fetchFocusPointFreeLanceInfo();
      List<WorkerWorkPlace> workerWorkPlace =  await fetchFocusPointsGates();
      emit(InitializedFocusPoints(
        focusPointInfo: focusPointInfo,
        workerWorkPlace: workerWorkPlace,
      ));
    } on Exception catch (e) {
      emit(ErrorState(e));
    }
  }

  Future<FocusPointInfo> fetchFocusPointFreeLanceInfo() async {
    final data = await repository.fetchFocusPointFreeLanceInfo();
    FocusPointInfo focusPointInfo =  FocusPointInfo.fromDto(data);
      return focusPointInfo;
  }
  Future<List<WorkerWorkPlace>> fetchFocusPointsGates() async {
    final data = await repository.fetchFocusPointsGates();
    List<WorkerWorkPlace> workerWorkPlaces =  data.map((e) => WorkerWorkPlace.fromDto(e)).toList();
    return workerWorkPlaces;
  }

  Future<void> startAttendanceFocusPoint(StartAttendanceFocusPointParams params) async {
    emit(LoadingStateListener());
    try {
      final data = await repository.startAttendanceFocusPoint(params);
      emit(SuccessStateListener(data: data));
    } on Exception catch (e) {
      emit(FailureStateListener(e));
    }
  }

  Future<void> endAttendanceFocusPoint(StartAttendanceFocusPointParams params) async {
    emit(LoadingStateListener());
    try {
      final data = await repository.endAttendanceFocusPoint(params);
      emit(SuccessStateListener(data: data));
    } on Exception catch (e) {
      emit(FailureStateListener(e));
    }
  }



}
