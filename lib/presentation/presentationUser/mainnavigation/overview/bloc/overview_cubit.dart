import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/domain/entities/shift/index_shift.dart';

import 'package:injectable/injectable.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftapp/data/datasources/remote/api_exception.dart';
import 'package:shiftapp/data/datasources/remote/resume_not_complete_exception.dart';
import 'package:shiftapp/data/exceptions/empty_list_exception.dart';
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
import '../../../../../data/models/activity_log/index.dart';
import '../../../../../data/models/overview/index.dart';
import '../../../../../data/models/user_overview/index.dart';
import '../../../../../domain/entities/required_tasks/index.dart';
import '../../../../../domain/usecases/tasks_notifications_usecase.dart';
import '../../../geofence/geo_task.dart';
import '../../../locationservice/locationservice.dart';
import '../../../logistics_request/data/repositories/logistics_request_repo.dart';
import '../../../mana_delivery/data/models/delivery_orders_prams.dart';
import '../../../mana_delivery/data/repositories/mana_delivery_repo.dart';
import '../../../mana_delivery/domain/entities/index.dart';
import 'overview_bloc.dart';
import 'overview_state.dart';

@Injectable()
class OverviewCubit extends BaseCubit {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  final UserRepository _userRepository;
  final JobOffersRepository _offersRepository;
  final ActivityLogRepository _activityLogRepository;
  final ProfileRepository _profileRepository;
  final RequiredTasksUseCase _requiredTasksUseCase;
  final ProfileRepository profileRepository;
  final LogisticsRequestRepository logisticsRequestRepository;
  final ManaDeliverRepository manaDeliverRepository;
  OverviewCubit(
    this._offersRepository,
    this._userRepository,
    this.logisticsRequestRepository,
    this._activityLogRepository,
    this._profileRepository,
    this._requiredTasksUseCase,
    this.profileRepository,
    this.manaDeliverRepository,
  );

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
  StreamState<List<InAppRequiredTask>> inAppNotificationStream =
      StreamStateInitial();
  StreamState<List<JobOfferSlider>> jobOffersSliders = StreamStateInitial();
  StreamState<List<DeliveryOrderEntity>> deliverOrders = StreamStateInitial();
  StreamState<CashifterCodeDto> cashifterCodeStream = StreamStateInitial();
//fetchCashifterCode
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
      final task = tasks.firstWhereOrNull(
        (element) => element.requiredStartShift(),
      );
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
        'fetchOpportunities ${jobOffers.stream.length} , ${response.length}',
      );
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
      jobOffersSliders.setData(
        response.payload?.map((e) => JobOfferSlider.fromDto(e)).toList() ?? [],
      );
    } catch (e) {
      jobOffersSliders.setError(e);
      checkErrorType(e);
    }
    return jobOffersSliders;
  }
  fetchDeliverOrders(DeliveryOrdersPrams deliveryOrdersPrams) async {
    print('fetchJobOffersSliders');
    try {
      final response = await manaDeliverRepository.fetchDeliveryOrders(deliveryOrdersPrams);
      deliverOrders.setData(
        response
       );
    } catch (e) {
      deliverOrders.setError(e);
      checkErrorType(e);
    }
    return deliverOrders;
  }
  fetchCashifterCode( ) async {
    print('fetchJobOffersSliders');
    try {
      final response = await _profileRepository.fetchCashifterCode( );
     cashifterCodeStream.setData(
        response
       );
    } catch (e) {
      cashifterCodeStream.setError(e);
      checkErrorType(e);
    }
    return cashifterCodeStream;
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
        'checkErrorType is time error ${e.type == DioExceptionType.connectionTimeout} ',
      );
      if (e.error is SocketException ||
          e.error is WebSocketException ||
          e.error is HandshakeException ||
          e.type == DioExceptionType.connectionTimeout ||
          e.error is HttpException) {
        throw e;
      } else if (_userRepository.getUser()?.isCompeleteProfile == false) {
        throw ResumeNotCompletedException();
      }
    } else {}

    print('checkErrorType is DIO ${e is DioError}');
  }

  List<JobOfferDto> filterJobsOffers(
    DateTime dateTime,
    List<JobOfferDto> list,
  ) {
    final filterItems =
        list.where((element) {
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
    final favoritesFilterItems = filterJobsOffers(
      dateTime,
      jobFavoritesOffersList,
    );
    if (favoritesFilterItems.isNotEmpty) {
      jobFavoritesOffers.setData(favoritesFilterItems);
    } else {
      jobFavoritesOffers.setError(EmptyListException());
    }
  }

  void toggleAdminPanel() {
    final bool enabled = _userRepository.isEnableAdmin();
    _userRepository.setEnableAdmin(!enabled);
    emit(ToggledUserState());
  }

  void setFirstOpenDialogPermissionGeofencing() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(LocalConstants.FirstOpenDialogPermissionGeofencing, true);
  }

  Future<bool> getFirstOpenDialogPermissionGeofencing() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isFirst =
        prefs.getBool(LocalConstants.FirstOpenDialogPermissionGeofencing) ??
        false;
    setFirstOpenDialogPermissionGeofencing();
    return isFirst;
  }

  Future<CheckWorkingDocumentDto?> checkCertificateJob(int id) async {
    final data = await _offersRepository.checkCertificateJob(id);
    return data.payload;
  }

  void loadInitialData() async {
    emit(LoadingState());
    try {
      if (_userRepository.isLogged()) {
        final appFeatures = await _profileRepository.getAccountServices();
        final haveAdminFeatures = appFeatures.adminEnable == true;

        emit(
          OverviewPostLoginState(
            jobOffers,
            vipOffers: jobVipOffers,
            favoritesOffers: jobFavoritesOffers,
            currentShift: currentShiftState,
            specialOffers: specialOffers,
            workingHours: appliedOffers,
            haveAdminPrivilege: haveAdminFeatures,
            inAppNotificationStream: inAppNotificationStream,
            /*workingHours: appliedOffers*/
            jobOffersSliders: jobOffersSliders,
              cashifterCodeStream: cashifterCodeStream,
            deliveryOrdersStream: deliverOrders


          ),
        );
        clearData();
        Future.wait<dynamic>([
          fetchAppliedOpportunities(),
          fetchOpportunities(),
        ]);

        final tasks = await fetchInAppNotification();
        final startSoonShift = tasks.firstWhereOrNull(
          (element) => element.requiredConfirmStartSoonShift(),
        );
        final requiredTasks = tasks.where(
          (element) => element.isRequired == true,
        );
        final tasksTypes = requiredTasks.map((e) => e.type.toString()).toList();
        requiredTasks.forEach((element) {
          print('requiredTasksJSON ${element.toJson()}');
        });
        final employeeAttendanceTime = tasks.firstWhereOrNull(
          (element) => element.employeeAttendanceTime(),
        );

        if (tasksTypes.contains(RequiredTasksTypes.dtaAttendance)) {
          emit(RequiredRegisterAttendanceState());
        }
        if (tasksTypes.contains(RequiredTasksTypes.startShift)) {
          emit(RequiredStartShiftState());
        }
        if (employeeAttendanceTime != null) {
          print('RequiredTasksTypes.employeeAttendanceTime');
          bool isFirst = await getFirstOpenDialogPermissionGeofencing();
          TimeAutoAttendanceDto geoTask = TimeAutoAttendanceDto.fromJson(
            employeeAttendanceTime.objects,
          );
          emit(EmployeeAttendanceTimeState(geoTask, isFirst));
        }

        if (tasksTypes.contains(RequiredTasksTypes.autoAttendance)) {
          print('RequiredTasksTypes.autoAttendance');
          final dislcouserOpened =
              await getFirstOpenDialogPermissionGeofencing();
          bool isFirst = dislcouserOpened;

          final projectInfoJson = requiredTasks.firstWhere(
            (element) => element.type == RequiredTasksTypes.autoAttendance,
          );
          GeoTask geoTask = GeoTask.fromJson(
            projectInfoJson.objects,
            job: GeoJob.DTA,
          );
          emit(RequiredAutoAttendanceState(geoTask, isFirst));
        }
        if (startSoonShift?.toAppliedOffer() != null) {
          emit(
            StartSoonShiftListener(
              appliedOffer: startSoonShift!.toAppliedOffer()!,
            ),
          );
        }
        if (tasksTypes.contains(RequiredTasksTypes.clearanceCertificate)) {
          final task = requiredTasks.firstWhere(
            (element) =>
                element.type == RequiredTasksTypes.clearanceCertificate,
          );
          DisclosureRequiredTaskDto requiredTaskDto =
              DisclosureRequiredTaskDto.fromJson(task.objects);
          emit(DisclosureRequiredTaskState(disclosureTaskDto: requiredTaskDto));
        }
        if (tasksTypes.contains(RequiredTasksTypes.confirmOrApologize)) {
          final task = requiredTasks.firstWhere(
            (element) => element.type == RequiredTasksTypes.confirmOrApologize,
          );
          ConfirmAttendance confirmAttendance = ConfirmAttendance.fromJson(
            task.objects,
          );
          emit(ConfirmAttendanceState(confirmAttendance: confirmAttendance));
        }

        InAppRequiredTask? dynamicForm = requiredTasks.firstWhereOrNull(
          (element) => element.isDynamicForm == true,
        );
        if (dynamicForm != null && dynamicForm.isDynamicForm == true) {
          emit(DynamicFormState(inAppRequiredTask: dynamicForm));
        }
        fetchJobOffersSliders();
        fetchSpecialOpportunities();
        fetchVipOpportunities();
        fetchFavoritesOpportunities();
        fetchCashifterCode();
        fetchDeliverOrders(DeliveryOrdersPrams(lat:24.7136,lng:46.6753));
      } else {
        await fetchJobOffersSliders();
        await fetchOpportunitiesUnAuth();
        emit(
          OverviewPreLoginState(jobOffers, jobOffersSliders: jobOffersSliders),
        );
      }
    } catch (e) {
      print('ErrorState OVERVIEW ${e}');
      emit(ErrorState(e));
    }
  }

  void confirmActivity(ConfirmActivityParams params) {
    executeEmitterListener(
      () => _activityLogRepository.confirmActivity(params),
    );
  }

  void applyJobNow(int id) {

    executeEmitterListener(() => _offersRepository.addFreeLanceOffer(id));
  }

  Future<void> canSubmitLogistics() async {
    try {
    await  logisticsRequestRepository.CanSubmitLogistics() ;
       emit(CanSubmitLogistics());
    } catch (e) {
      emit(FailureStateListener(e));
    }

  }

  void requestEvent(OverviewEvents event) {
    if (event is ConfirmJob) {
      confirmActivity(event.params);
    } else if (event is ToggledUserState) {
      toggleAdminPanel();
    }
  }



}
