import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';

import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/data/models/absence_notation/index.dart';
import '../../../../../common/data/repositories/absencenotice/absencenotice.dart';
import '../../../../../common/data/repositories/attendance/attendance_repository.dart';

@injectable
class AbsenceNoticeCubit extends BaseCubit {
  AbsenceNoticeRepository repository;
  AttendanceRepository _attendanceRepository;
  AbsenceNoticeCubit(this.repository, this._attendanceRepository);

  loadAbsenceData() async {
    try {
      emit(LoadingState());
      final userDate = await _attendanceRepository.fetchAvailableShift();
      List<AbsenceDateParams> absenceDate =[];
      try {
        absenceDate =   await repository.fetchAbsenceDate();
      }catch(e){
        emit(FailureStateListener(e));
      }
      emit(InitializedAbsenceNotice( dataUser: userDate,listAbsenceDate: absenceDate??[]));
    } catch (e) {
      emit(ErrorState(e));
    }
  }


  addAbsenceNotice({
    required AddAbsenceNoticeParams addAbsenceNoticeParams
  }) async {
    try {
       emit(LoadingStateListener());
      final message = await repository.addAbsenceNotice(
          addAbsenceNoticeParams:addAbsenceNoticeParams);
      emit(SuccessStateListener(data: message));
    } catch (e) {
      emit(FailureStateListener(e));
    }
  }
}
