import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:shiftapp/domain/entities/shift/index_shift.dart';
import 'package:shiftapp/data/models/activity_log/index.dart';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftapp/data/datasources/remote/api_exception.dart';
import 'package:shiftapp/data/datasources/remote/resume_not_complete_exception.dart';
import 'package:shiftapp/data/exceptions/empty_list_exception.dart';
import 'package:shiftapp/data/models/activity_log/confirm_activity_params.dart';
import 'package:shiftapp/data/repositories/activitylog/activity_log_repository.dart';
import 'package:shiftapp/data/repositories/joboffers/job_offers_repository.dart';
import 'package:shiftapp/data/repositories/profile/profile_repository.dart';
import 'package:shiftapp/data/repositories/user/user_repository.dart';

import 'package:shiftapp/domain/entities/account/remote_file.dart';
 import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:collection/collection.dart';

import '../../../../../data/datasources/local/constants.dart';
import '../../../../../data/models/account/cashifter_code_dto.dart';
import '../../../../../data/models/overview/index.dart';
import '../../../../../data/models/user_overview/index.dart';
 import '../../../../../domain/entities/required_tasks/index.dart';
  import '../../../../../domain/usecases/tasks_notifications_usecase.dart';
import '../../../geofence/geo_task.dart';
import '../../../mana_delivery/data/repositories/mana_delivery_repo.dart';
import '../../../mana_delivery/domain/entities/delivery_orde.dart';
import '../../../mana_delivery/domain/entities/my_order.dart';
import 'overview_state.dart';

part 'overview_events.dart';
@Injectable()
class OverviewBloc extends Bloc<OverviewEvents, CommonState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  final UserRepository _userRepository;
  final JobOffersRepository _offersRepository;
  final ActivityLogRepository _activityLogRepository;
  final ProfileRepository _profileRepository;
  final RequiredTasksUseCase _requiredTasksUseCase;
  final ProfileRepository profileRepository;
  final ManaDeliverRepository manaDeliverRepository;
  OverviewBloc(
      this._offersRepository,
      this._userRepository,
      this._activityLogRepository,
      this._profileRepository,
      this._requiredTasksUseCase,
      this.profileRepository,
      this.manaDeliverRepository,
      )
      : super(UnInitState()){
    on<OverviewEvents>((event, emit) async {
      try {
        await for (final newState in event.applyAsync(currentState: state, bloc: this)) {
          emit(newState);
        }
      } catch (error, stackTrace) {
        developer.log('$error',
            name: 'OverviewBloc', error: error, stackTrace: stackTrace);
        emit(state);
      }
    });
  }

  //
  // @override
  // Stream<CommonState> mapEventToState(
  //     OverviewEvents event,
  //     ) async* {
  //   try {
  //     yield* event.applyAsync(currentState: state, bloc: this);
  //   } catch (_, stackTrace) {
  //     developer.log('$_',
  //         name: 'OverviewBloc', error: _, stackTrace: stackTrace);
  //     yield state;
  //   }
  // }

  @override
  Future<void> close() async {
    await super.close();
  }

  List<JobOfferDto> allOffers = <JobOfferDto>[];
  List<JobOfferDto> jobFavoritesOffersList = <JobOfferDto>[];
  List<JobOfferDto> specialOffersList = <JobOfferDto>[];
  List<JobOfferDto> vipOffersList = <JobOfferDto>[];
  StreamState<AppliedOffer> currentShiftState = StreamStateInitial();
  StreamState<List<AppliedOffer>?> appliedOffers = StreamStateInitial();
  StreamState<List<JobOfferDto>> specialOffers = StreamStateInitial();
  StreamState<List<JobOfferDto>?> jobOffers = StreamStateInitial();
  StreamState<List<JobOfferDto>> jobFavoritesOffers = StreamStateInitial();
  StreamState<List<JobOfferDto>> jobVipOffers = StreamStateInitial();
  StreamState<List<InAppRequiredTask>> inAppNotificationStream = StreamStateInitial();
  StreamState<List<JobOfferSlider>> jobOffersSliders = StreamStateInitial();
  StreamState<List<DeliveryOrderEntity>> deliverOrders = StreamStateInitial();
  StreamState<CashifterCodeDto> cashifterCodeStream = StreamStateInitial();
  StreamState<MyOrderEntity> myOrderEntityStream = StreamStateInitial();

  clearData() {
    appliedOffers.setData(null);
    jobOffers.setData(null);
  }

  Future<List<InAppRequiredTask>> fetchInAppNotification() async {
    try {
      final requiredTasksData = await _requiredTasksUseCase.call();

      _fetchCurrentShiftFromTasks(requiredTasksData);
      inAppNotificationStream.setData(requiredTasksData);
      return requiredTasksData;
    } catch (e) {
      return [];
    }
  }

  _fetchCurrentShiftFromTasks(List<InAppRequiredTask> tasks) async {
    try {
      final task = tasks.firstWhereOrNull((element) => element.requiredStartShift());
      if (task?.toAppliedOffer() != null) {
        currentShiftState.setData(task!.toAppliedOffer()!);
      } else {
        currentShiftState.setError(ApiException("", ""));
      }
    } catch (e) {
      currentShiftState.setError(e);
    }
  }

  fetchAppliedOpportunities() async {
    try {
      final response = await _offersRepository.fetchAppliedOpportunities(1);
      appliedOffers.setData(response?.map((e) => e.builder()).toList() ?? []);
    } catch (e) {
      appliedOffers.setError(e);
      checkErrorType(e);
    }
    return appliedOffers;
  }

  fetchOpportunities() async {
    try {
      final response = await _offersRepository.fetchOpportunities();
      jobOffers.setData(response);
      allOffers = response;
      print(
          'fetchOpportunities ${jobOffers.stream.length} , ${response.length}');
    } catch (e) {
        jobOffers.setError(e);
      checkErrorType(e);
    }
    return jobOffers;
  }

  fetchVipOpportunities() async {
    try {
      final response = await _offersRepository.fetchVIPOpportunities();
      vipOffersList = response;
      jobVipOffers.setData(response);
    } catch (e) {
      jobVipOffers.setError(e);
      checkErrorType(e);
    }
    return jobVipOffers;
  }

  fetchSpecialOpportunities() async {
    try {
      final response = await _offersRepository.fetchSepcialOpportunities();
      specialOffersList = response;
      specialOffers.setData(response);
    } catch (e) {
      specialOffers.setError(e);
      checkErrorType(e);
    }
    return specialOffers;
  }

  fetchFavoritesOpportunities() async {
    try {
      final response = await _offersRepository.fetchFavoritesOpportunities();
      jobFavoritesOffersList = response;
      jobFavoritesOffers.setData(response);
    } catch (e) {
      jobFavoritesOffers.setError(e);
      checkErrorType(e);
    }
    return jobFavoritesOffers;
  }
  fetchJobOffersSliders() async {
    print('fetchJobOffersSliders');
    try {
      final response = await _offersRepository.fetchJobOffersSliders();
      jobOffersSliders.setData(response.payload?.map((e) => JobOfferSlider.fromDto(e)).toList() ?? []);
    } catch (e) {
      jobOffersSliders.setError(e);
     checkErrorType(e);
    }
    return jobOffersSliders;
  }

  addFreeLanceOffer(int id) async {
      final response = await _offersRepository.addFreeLanceOffer(id);
      return response.message;
  }
  filterOffers({DateTime? dateTime}) {
    if (allOffers.isEmpty) {
      return;
    }
    if (dateTime != null) {
      filterAllOffers(dateTime);
      filterFavorites(dateTime);
      filterVipOffers(dateTime);
    } else {
      jobOffers.setData(allOffers ?? []);
      specialOffers.setData(specialOffersList ?? []);
      jobFavoritesOffers.setData(jobFavoritesOffersList ?? []);
      jobVipOffers.setData(vipOffersList ?? []);
    }
  }

  fetchOpportunitiesUnAuth() async {
    try {
      final response = await _offersRepository.fetchOpportunitiesUnAuth();
      jobOffers.setData(response);
      allOffers = response;
    } catch (e) {
      jobOffers.setError(e);
      checkErrorType(e);
    }
    return jobOffers;
  }

  Future<AppliedOffer?> fetchStartSoonShift() async {
    try {
      final response = await _offersRepository.fetchStartSoonShift();
      return response.payload?.builder();
//      final response = await _offersRepository.fetchAppliedOpportunities(1);
      //  return response?.first.builder();
    } catch (e) {
      return null;
    }
  }

  checkErrorType(e) {
    if (e is DioError) {
      print(
          'checkErrorType is time error ${e.type == DioExceptionType.connectionTimeout} ');
      if (e.error is SocketException ||
          e.error is WebSocketException ||
          e.error is HandshakeException ||
          e.type == DioExceptionType.connectionTimeout ||
          e.error is HttpException) {
        throw e;
      }else if (_userRepository.getUser()?.isCompeleteProfile == false) {
        throw ResumeNotCompletedException();
      }
    }  else {}

    print('checkErrorType is DIO ${e is DioError}');
  }

  List<JobOfferDto> filterJobsOffers(
      DateTime dateTime, List<JobOfferDto> list) {
    final filterItems = list.where((element) {
      final sameDate = element.workingDateTime().isSameDate(dateTime);
      return sameDate;
    }).toList();
    return filterItems;
  }

  void filterAllOffers(DateTime dateTime) {
    final filterItems = filterJobsOffers(dateTime, allOffers);
    if (filterItems.isNotEmpty) {
      jobOffers.setData(filterItems);
    } else {
      jobOffers.setError(EmptyListException());
    }
  }

  void filterVipOffers(DateTime dateTime) {
    final vipFilterItems = filterJobsOffers(dateTime, vipOffersList);
    if (vipFilterItems.isNotEmpty) {
      jobVipOffers.setData(vipFilterItems);
    } else {
      jobVipOffers.setError(EmptyListException());
    }
  }

  void filterSpecialOffers(DateTime dateTime) {
    if (specialOffersList.isEmpty) {
      return;
    }
    final filterItems = filterJobsOffers(dateTime, specialOffersList);
    if (filterItems.isNotEmpty) {
      specialOffers.setData(filterItems);
    } else {
      specialOffers.setError(EmptyListException());
    }
  }

  void filterFavorites(DateTime dateTime) {
    final favoritesFilterItems =
        filterJobsOffers(dateTime, jobFavoritesOffersList);
    if (favoritesFilterItems.isNotEmpty) {
      jobFavoritesOffers.setData(favoritesFilterItems);
    } else {
      jobFavoritesOffers.setError(EmptyListException());
    }
  }

  void toggleAdminPanel() {
    final bool enabled = _userRepository.isEnableAdmin();
    _userRepository.setEnableAdmin(!enabled);
  }


  void setFirstOpenDialogPermissionGeofencing() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(LocalConstants.FirstOpenDialogPermissionGeofencing, true);
  }

  Future<bool> getFirstOpenDialogPermissionGeofencing() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isFirst = prefs.getBool(LocalConstants.FirstOpenDialogPermissionGeofencing) ?? false;
   setFirstOpenDialogPermissionGeofencing();
    return isFirst;
  }

  Future<CheckWorkingDocumentDto?> checkCertificateJob(int id) async {
   final data = await _offersRepository.checkCertificateJob(id);
   return data.payload;
  }

  Future<void> saveFaceRecognitionEncryptedFile() async {
    try {
    await profileRepository.getFaceImageBase64();
    } on Exception catch (e) {
      print('saveFaceRecognitionEncryptedFile Error $e');
    }
  }



}
