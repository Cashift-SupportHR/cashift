import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/models/attendance/index.dart';
import 'package:shiftapp/common/domain/entities/attendance/index.dart';

 import 'package:shiftapp/common/data/repositories/attendance/attendance_repository.dart';

import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
@injectable
class AttendanceCubit extends BaseCubit{
  final AttendanceRepository attendanceRepository ;

  AttendanceCubit({required  this.attendanceRepository});

  fetchAttendance() async {
    try{
      emit(LoadingState());
    final attendance =await attendanceRepository.fetchAvailableShift();
      emit(Initialized<AttendanceShiftDto>(data: attendance));
    }catch(e){
      print('fetchAttendanceShift $e');
      emit(ErrorState(e));
    }
  }

  registerAttendance(AttendanceQuery projectId) async {
    try{
      emit(LoadingStateListener());
      final message = await attendanceRepository.registerAttendance(projectId);
      print('registerAttendance ${message}');
      emit(SuccessStateListener(data: message));
    }catch(e){
      print('ErrorDialogState');
      emit(FailureStateListener(e));
    }
  }

  Future<void> fetchAttendanceLog(AttendanceLogQuery query) async {
    try{
      emit(LoadingState());
      final attendance =await attendanceRepository.fetchAttendanceLog(query);
      emit(Initialized(data:attendance));
    }catch(e){

      emit(ErrorState(e));
    }
  }
  Future<void> fetchViolation() async {
    try{
      emit(LoadingState());
      final attendance =await attendanceRepository.fetchViolation();
      emit(Initialized(data:attendance));
    }catch(e){
      emit(ErrorState(e));
    }
  }
}