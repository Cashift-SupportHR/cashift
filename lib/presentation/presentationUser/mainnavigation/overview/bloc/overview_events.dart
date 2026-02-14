part of 'overview_bloc.dart';

@immutable
abstract class OverviewEvents {
  Stream<CommonState> applyAsync(
      {required CommonState currentState, required OverviewBloc bloc});
}

class FilterOfferEvent extends OverviewEvents {
  final DateTime? dateTime;

  FilterOfferEvent({this.dateTime});
  @override
  Stream<CommonState> applyAsync(
      {required CommonState currentState, required OverviewBloc bloc}) async* {
    bloc.filterOffers(dateTime: dateTime);
  }
}

class ConfirmJob extends OverviewEvents {
  final ConfirmActivityParams params;
  ConfirmJob(this.params);

  @override
  Stream<CommonState> applyAsync(
      {required CommonState currentState, required OverviewBloc bloc}) async* {
    yield LoadingStateListener();
    try {
      final response =
          await bloc._activityLogRepository.confirmActivity(params);
      yield SuccessStateListener(data: response);
    } catch (e, s) {
      print('ErrorDialogStateCONFIRMLOG $s');
      yield FailureStateListener(e);
    }
  }
}

class FetchComponentDataEvent extends OverviewEvents {
  FetchComponentDataEvent();

  @override
  Stream<CommonState> applyAsync(
      {required CommonState currentState, required OverviewBloc bloc}) async* {
    yield LoadingState();
    try {
        if (bloc._userRepository.isLogged()) {
          final appFeatures = await bloc._profileRepository.getAccountServices();
          final haveAdminFeatures = appFeatures.adminEnable == true;

          yield OverviewPostLoginState(
            bloc.jobOffers,
            vipOffers: bloc.jobVipOffers,
            favoritesOffers: bloc.jobFavoritesOffers,
            currentShift: bloc.currentShiftState,
            specialOffers: bloc.specialOffers,
            workingHours: bloc.appliedOffers,
            haveAdminPrivilege: haveAdminFeatures,
            inAppNotificationStream: bloc.inAppNotificationStream,
            /*workingHours: bloc.appliedOffers*/
            jobOffersSliders: bloc.jobOffersSliders,
              cashifterCodeStream: bloc.cashifterCodeStream,
            deliveryOrdersStream: bloc.deliverOrders
          );
          bloc.clearData();
           Future.wait<dynamic>(
              [bloc.fetchAppliedOpportunities(), bloc.fetchOpportunities()]);
        
          final tasks = await bloc.fetchInAppNotification();
          final startSoonShift = tasks.firstWhereOrNull(
              (element) => element.requiredConfirmStartSoonShift());
          final requiredTasks =
              tasks.where((element) => element.isRequired == true);
          final tasksTypes = requiredTasks.map((e) => e.type.toString()).toList();
          requiredTasks.forEach((element) {
            print('requiredTasksJSON ${element.toJson()}');
          });
          final employeeAttendanceTime = tasks.firstWhereOrNull(
                  (element) => element.employeeAttendanceTime());
        
          if (tasksTypes.contains(RequiredTasksTypes.dtaAttendance)) {
            yield RequiredRegisterAttendanceState();
          }
          if (tasksTypes.contains(RequiredTasksTypes.startShift)) {
            yield RequiredStartShiftState();
          }
          if (employeeAttendanceTime != null ) {
            print('RequiredTasksTypes.employeeAttendanceTime');
            bool isFirst = await bloc.getFirstOpenDialogPermissionGeofencing();
            TimeAutoAttendanceDto geoTask = TimeAutoAttendanceDto.fromJson(employeeAttendanceTime.objects);
            yield EmployeeAttendanceTimeState(geoTask, isFirst);
          }
        
          if (tasksTypes.contains(RequiredTasksTypes.autoAttendance)) {
            print('RequiredTasksTypes.autoAttendance');
            final dislcouserOpened =await bloc.getFirstOpenDialogPermissionGeofencing();
            bool isFirst =dislcouserOpened ;
        
            final projectInfoJson = requiredTasks.firstWhere(
                (element) => element.type == RequiredTasksTypes.autoAttendance);
            GeoTask geoTask = GeoTask.fromJson(projectInfoJson.objects, job: GeoJob.DTA);
            yield RequiredAutoAttendanceState(geoTask, isFirst);
          }
          if (startSoonShift?.toAppliedOffer() != null) {
            yield StartSoonShiftListener(
                appliedOffer: startSoonShift!.toAppliedOffer()!);
          }
          if (tasksTypes.contains(RequiredTasksTypes.clearanceCertificate)) {
            final task = requiredTasks.firstWhere((element) =>
                element.type == RequiredTasksTypes.clearanceCertificate);
            DisclosureRequiredTaskDto requiredTaskDto =
                DisclosureRequiredTaskDto.fromJson(task.objects);
            yield DisclosureRequiredTaskState(disclosureTaskDto: requiredTaskDto);
          }
          if (tasksTypes.contains(RequiredTasksTypes.confirmOrApologize)) {
            final task = requiredTasks.firstWhere((element) =>
                element.type == RequiredTasksTypes.confirmOrApologize);
            ConfirmAttendance confirmAttendance =
                ConfirmAttendance.fromJson(task.objects);
            yield ConfirmAttendanceState(confirmAttendance: confirmAttendance);
          }
        
          InAppRequiredTask? dynamicForm = requiredTasks
              .firstWhereOrNull((element) => element.isDynamicForm == true);
          if (dynamicForm != null && dynamicForm.isDynamicForm == true) {
            yield DynamicFormState(inAppRequiredTask: dynamicForm);
          }
           bloc.fetchJobOffersSliders();
           bloc.fetchSpecialOpportunities();
           bloc.fetchVipOpportunities();
           bloc.fetchFavoritesOpportunities();
           bloc.saveFaceRecognitionEncryptedFile();
        } else {
          await bloc.fetchJobOffersSliders();
          await bloc.fetchOpportunitiesUnAuth();
          yield OverviewPreLoginState(bloc.jobOffers,
              jobOffersSliders: bloc.jobOffersSliders);
        }
    } catch (e) {
      print('ErrorState OVERVIEW ${e}');
      yield ErrorState(e);
    }
  }
}

class ToggleAdminPanelEvent extends OverviewEvents {
  @override
  Stream<CommonState> applyAsync(
      {required CommonState currentState, required OverviewBloc bloc}) async* {
    bloc.toggleAdminPanel();
    yield ToggledUserState();
  }
}

class ApplyJobOfferNowEvent extends OverviewEvents {
  int id;

  ApplyJobOfferNowEvent(this.id);
  @override
  Stream<CommonState> applyAsync(
      {required CommonState currentState, required OverviewBloc bloc}) async* {
    yield LoadingStateListener();
    try {
      final response = await bloc.addFreeLanceOffer(id);
      yield SuccessStateListener<String>(data: response);
    } catch (e) {
      print('ErrorDialogStateAPPLYJOB $e');
      yield FailureStateListener(e);
    }
  }
}

class CheckCertificateJobEvent extends OverviewEvents {
  int id;

  CheckCertificateJobEvent(this.id);
  @override
  Stream<CommonState> applyAsync(
      {required CommonState currentState, required OverviewBloc bloc}) async* {

    yield LoadingStateListener();
    try {
      final response = await bloc.checkCertificateJob(id);
      if(response != null){
        final checkWorkingDocument = CheckWorkingDocument.fromDto(response);
        yield SuccessStateListener(data: checkWorkingDocument);
      } else{
        yield SuccessStateListener(data: null);
      }
    } catch (e) {
      print('ErrorDialogStateAPPLYJOB $e');
      yield FailureStateListener(e);
    }
  }
}

