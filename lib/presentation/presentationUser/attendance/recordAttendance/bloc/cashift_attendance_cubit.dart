import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/datasources/local/constants.dart';
import 'package:shiftapp/common/data/repositories/profile/profile_repository.dart';
import 'package:shiftapp/common/domain/entities/account/remote_file.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/domain/entities/attendance/index.dart';

import '../../../../../common/data/datasources/local/init_floor_database.dart';
import '../../../../../common/data/exceptions/empty_face_exception.dart';
import '../../../../../common/data/models/shift/start_shift_params.dart';
import '../../../../../common/data/repositories/attendance/attendance_repository.dart';
import '../../../../../common/data/repositories/joboffers/job_offers_repository.dart';
import '../../../../../common/domain/entities/attendancerecoginatin/attendance_model.dart';
import '../../../../../common/domain/entities/attendancerecoginatin/register_attendance_offline_request_shift.dart';
import '../../../../../common/domain/entities/attendancerecoginatin/register_attendance_request_cashift.dart';
import '../../../../../common/domain/entities/attendancerecoginatin/register_attendance_request_shift.dart';
import '../../../../../common/domain/entities/shared/date_formatter.dart';
import '../../registerfacerecognition/attendance_params.dart';

@Injectable()
class CashiftAttendanceCubit extends BaseCubit {
  final ProfileRepository repository;
  final JobOffersRepository jobOffersRepository;
  final AttendanceRepository attendanceRepository;

  CashiftAttendanceCubit(
      this.repository, this.jobOffersRepository, this.attendanceRepository);

  //final StreamStateInitial<RemoteFile> faceStream = StreamStateInitial<RemoteFile>();
  fetchRegisteredFace(bool eligibleToFaceRecognition, bool isFromCash) {
    if (!eligibleToFaceRecognition) {
      emit(LoadingState());
      emit(Initialized<String?>(data: null));
      return;
    }
    executeBuilder(
          () => repository.getFaceImageBase64(),
      onSuccess: (value) async {
        emit(Initialized<String?>(
            data: value));
      },
    );
  }



  registerAttendanceOffline({required AttendanceOfflineQuery query}) async {
    try {
      emit(LoadingStateListener());
      final database = await InitFloorDatabase.init();
      await database.attendanceQueryOfflineDao.insertAttendanceQuery(query);
      print('registerAttendanceOffline ${query.toJson()}');
      emit(SuccessStateListener(data: 'تم التسجيل بنجاح'));
    } catch (e) {
      print('ErrorDialogState registerAttendanceOffline');
      emit(FailureStateListener(e));
    }
  }

  void uploadFaceRecognition(File ? file, {File? qrFile,}) {
    try {
      if(file!=null) {
        attendanceRepository.uploadFakeFaceRecognition(file);
      }
      if(qrFile!=null) {
        attendanceRepository.uploadFakeFaceRecognition(qrFile);
      }
    } on Exception catch (e) {
      emit(FailureStateListener(e));
    }
  }


  void performAttendance(AttendanceParams params,RegisterAttendanceRequest attendanceRequest){

    switch (attendanceRequest) {
      case RegisterAttendanceRequestShift():
        {
          performShiftAttendance(params, attendanceRequest);
        }
      case RegisterAttendanceRequestCashift():
        {
          performCashiftAttendance(params, attendanceRequest);
        }
      case RegisterAttendanceOfflineRequestShift():
        {
          performOfflineAttendance(params,attendanceRequest);
        }
    }
  }

  Future<void> performCashiftAttendance(AttendanceParams params, RegisterAttendanceRequestCashift shift) async {
    final param = createCashiftParams(params, shift);
    if (param != null) {
      emit(LoadingStateListener());
      if (param.isMock == true && shift.allowToTrack() ) {
        uploadFaceRecognition(params.face,qrFile: params.qr?.image);
      }
      executeEmitterListener(() => jobOffersRepository.startShift(param), showLoading: false);
    }
  }

  Future<void> performShiftAttendance(AttendanceParams param, RegisterAttendanceRequestShift model) async {
    final attendanceQuery = createShiftAttendanceParams(param, model);
    try {
      emit(LoadingStateListener());
      if (param.position?.isMock == true || model.allowToTrack()) {
        uploadFaceRecognition(param.face,qrFile: param.qr?.image);
      }

      final message = await attendanceRepository.registerAttendance(attendanceQuery);
      emit(SuccessStateListener(data: message));
    } catch (e) {
      emit(FailureStateListener(e));
    }

  }

  AttendanceQuery createShiftAttendanceParams(
      AttendanceParams params, RegisterAttendanceRequestShift model) {
    return AttendanceQuery(
        latitude: params.position!.latitude,
        longitude:params. position!.longitude,
        projectId: (model.allowedToDetectQr()) ? params.qr?.code : model.shift.projectId,
        isMock: params.position?.isMock,
        presentId: model.presentId
    );
  }

  StartShiftParams? createCashiftParams(AttendanceParams params, RegisterAttendanceRequestCashift model) {

    final shift = model.cashift ;
    final position = params.position;
    return StartShiftParams(
      startTimeLongtude: position!.longitude.toString(),
      startTimeLatitude: position!.latitude.toString(),
      id: shift.id,
      isMock: position.isMock==true,
      projectId: (model.allowedToDetectQr() ?? false) ? params.qr?.code : shift.projectId,

    );
  }

  void performOfflineAttendance(AttendanceParams params,RegisterAttendanceOfflineRequestShift model) {
    final position = params.position;
    registerAttendanceOffline(query: AttendanceOfflineQuery(
      latitude: position!.latitude,
      longitude: position!.longitude,
      isMock: position?.isMock==true,
      checkedDateTime: DateFormatter.repairRequestApiDateTime(DateTime.now()),
      presentId: params.presentId,
      projectId: params.qr?.code??'',
      attendanceType: model.isDTA ? 1 : 2,
    ));
  }
}
