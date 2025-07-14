import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/repositories/joboffers/job_offers_repository.dart';
import 'package:shiftapp/common/data/repositories/logger/logger_repository.dart';
import 'package:shiftapp/common/data/repositories/profile/profile_repository.dart';

import '../../../../common/data/exceptions/mistake_shift_location_exception.dart';
import '../../../../common/data/models/logger/index.dart';
import '../../../../common/data/models/shift/index.dart';
import '../../../../common/domain/entities/appliedOffers/index.dart';
import '../../../../common/domain/entities/shift/index_shift.dart';
import '../../common/common_state.dart';
import '../pages/qrcode_screen.dart';

@Injectable()
class AppliedOffersCubit extends BaseCubit {
  final JobOffersRepository _offersRepository;
  final ProfileRepository profileRepository;
  final LoggerRepository loggerRepository;

  AppliedOffersCubit(
      this._offersRepository, this.profileRepository, this.loggerRepository);

  Future<bool> enableRate() async {
    final service = await profileRepository.getAccountServices();
    return service.rateEnable == true;
  }

  void changeShiftStatus(
      {required AppliedOffer appliedOffers,
      required LocationData position,
      required QrCode qr}) async {
    emit(LoadingStateListener());
    try {
      if (appliedOffers.statusId == OpportunitiesStatus.Accept.index) {
        final response = await _offersRepository.startShift(StartShiftParams(
          id: appliedOffers.id,
          projectId: qr.code,
          startTimeLatitude: position.latitude.toString(),
          startTimeLongtude: position.longitude.toString(),
        ));
        emit(SuccessStateListener(data: response.message));
      } else if (appliedOffers.statusId == OpportunitiesStatus.Start.index) {
        final response = await _offersRepository.finishShift(EndShiftParams(
          id: appliedOffers.id,
          projectId: qr.code,
          endTimeLatitude: position.latitude.toString(),
          endTimeLongtude: position.longitude.toString(),
        ));
        emit(SuccessStateListener(data: response));
      } else {
        loggerRepository.sendLog(LoggerParams(
            description:
                'change shift status  current status is ${appliedOffers.statusId}',
            error: 'MistakeShiftStatusExceptions',
            object: appliedOffers.toJson().toString() +
                ',userLocation:' +
                position.toString(),
            tagName: 'ChangeShiftStatusEvent'));
        emit(FailureStateListener(MistakeShiftLocationExceptions()));
      }
    } catch (e) {
      loggerRepository.sendLog(LoggerParams(
          description:
              'change shift status  current status is ${appliedOffers.statusId}',
          error: e.toString(),
          object: appliedOffers.toJson().toString() +
              ',userLocation:' +
              position.toString(),
          tagName: 'ChangeShiftStatusEvent'));
      emit(FailureStateListener(e));
    }
  }

  void cancelShift(CancelShiftParams params) async {
    executeEmitterListener(() => _offersRepository.cancelShift(params));
  }

  void fetchAppliedOpportunities(bool isActiveOffers) {
    executeBuilder(
        () =>
            _offersRepository.fetchAppliedOpportunities(isActiveOffers ? 1 : 2),
        onSuccess: (data) {
          final  resp = data!.map((e) => e.builder()).toList();
          print('fetchAppliedOpportunities ${resp}');
      emit(Initialized<List<AppliedOffer>>(
          data: data!.map((e) => e.builder()).toList()));
    });
  }

  fetchCurrentShift() {
    executeBuilder(() => _offersRepository.fetchCurrentShift(),
        onSuccess: (data) {
      emit(Initialized<AppliedOffer>(data: data.payload!.builder()));
    });
  }
}
