import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/repositories/attendance/attendance_repository.dart';
import 'package:shiftapp/common/domain/entities/attendance/attendance_query.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

@injectable
class OvertimeAttendanceCubit extends BaseCubit {
  final AttendanceRepository _repository;

  OvertimeAttendanceCubit(this._repository);

  loadOvertime() async {
    try {
      emit(LoadingState());
      final data = await _repository.fetchCurrentOvertime();
      emit(Initialized(data: data));
    } catch (e) {
      emit(ErrorState(e));
    }
  }
  fetchOvertimeLog() async {
    try {
      emit(LoadingState());
      final data = await _repository.fetchOvertimeLog();
      emit(Initialized(data: data));
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  registerAttendance(AttendanceQuery query, bool isStarted) async {
    try{
      emit(LoadingStateListener());
      if(isStarted) {
        final message = await _repository.endOvertime(query);
        emit(SuccessStateListener(data: message));
    }else{
        final message = await _repository.startOvertime(query);
        emit(SuccessStateListener(data: message));
    }
    }catch(e){
      print('ErrorDialogState');
      emit(FailureStateListener(e));
    }
  }

}
