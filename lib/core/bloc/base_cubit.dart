import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import 'package:shiftapp/common/domain/params/dashboard_required_action_respond_params.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../common/data/exceptions/verification_face_exception.dart';
import '../../common/data/models/user_overview/index.dart';
import '../../common/domain/entities/required_tasks/index.dart';
import '../../common/domain/usecases/respond_dashboard_required_action_usecase.dart';
import '../../common/domain/usecases/tasks_notifications_usecase.dart';
import '../../presentation/adminFeatures/di/injector.dart';
import '../../presentation/shared/check_face_recognation/page/check_face_recognatin_page.dart';

abstract class BaseCubit extends BlocBase<CommonState> {
  late RequiredTasksUseCase _requiredTasksUseCase;
  late RespondDashboardRequiredActionUseCase
      _respondDashboardRequiredActionUseCase;

  BaseCubit() : super(UnInitState()) {
    _requiredTasksUseCase = getIt.get<RequiredTasksUseCase>();
    _respondDashboardRequiredActionUseCase =
        getIt.get<RespondDashboardRequiredActionUseCase>();
  }

  executeBuilder<T>(Future<T> Function() invoke,
      {bool isRefresh = true,required ValueChanged<T> onSuccess, ValueChanged? onError}) async {
    try {
      if (isRefresh) {
        emit(LoadingState());
      }

      final response = await invoke();
      onSuccess(response);
    } catch (e) {
      print('executeBuilder ${e}');
      if (onError != null) {
        onError(e);
      } else {
        emit(ErrorState(e));
      }
      rethrow;
    }
  }



  executeListener<T>(Future<T> Function() invoke,
      {required ValueChanged<T> onSuccess, bool showLoading = true}) async {
    try {
      if (showLoading == true) {
        emit(LoadingStateListener());
      }
      final response = await invoke();
      onSuccess(response);
    } catch (e) {
      emit(FailureStateListener(e));
      rethrow;
    }
  }

  executeEmitterListener<T>(Future<ApiResponse> Function() invoke,
      {bool showLoading = true, ValueChanged<T>? onSuccess}) {
    executeListener(() => invoke(), onSuccess: (v) {
      emit((SuccessStateListener(data: v.message.toString())));
      onSuccess?.call(v.payload);
    }, showLoading: showLoading);
  }

  executeEmitterData<T>(Future<T> Function() invoke,
      {ValueChanged<T>? onSuccess}) {
    executeBuilder(() => invoke(), onSuccess: (data) {
      emit(Initialized(data: data));
      onSuccess?.call(data);
    });
  }

  executeMultiMethods<T>(
    Iterable<Future<T>> futures, {
    required Function(List<T> dataList) onSuccess,
  }) async {
    try {
      emit(LoadingState());
      final dataList = await Future.wait(futures);
      onSuccess(dataList.toList());
    } catch (e) {
      emit(ErrorState(e));
      rethrow;
    }
  }

  Future<void> detectOfRequiredTasks() async {
    print('detectOfRequiredTasks');

    emit(LoadingStateListener());
    try {
      await Future.delayed(const Duration(milliseconds: 50));
      final availableTasks = await _requiredTasksUseCase.call();

      final requiredTasks =
          availableTasks.where((element) => element.isRequired == true);
      final requiredTasksTypes = requiredTasks.map((e) => e.type);

      if (requiredTasksTypes.contains(RequiredTasksTypes.dtaAttendance)) {
        emit(RequiredRegisterAttendanceState());
      }
      if (requiredTasksTypes.contains(RequiredTasksTypes.startShift)) {
        emit(RequiredStartShiftState());
      }
      if (requiredTasksTypes
          .contains(RequiredTasksTypes.confirmStartSoonShift)) {
        emit(RequiredConfirmShiftState());
      }
      if (requiredTasksTypes
          .contains(RequiredTasksTypes.clearanceCertificate)) {
        final task = requiredTasks.firstWhere((element) =>
            element.type == RequiredTasksTypes.clearanceCertificate);
        DisclosureRequiredTaskDto requiredTaskDto =
            DisclosureRequiredTaskDto.fromJson(task.objects);
        emit(DisclosureRequiredTaskState(disclosureTaskDto: requiredTaskDto));
      }
      // isDynamicForm
      InAppRequiredTask? dynamicForm = requiredTasks
          .firstWhereOrNull((element) => element.isDynamicForm == true);
      if (dynamicForm != null && dynamicForm.isDynamicForm == true) {
        emit(DynamicFormState(inAppRequiredTask: dynamicForm));
      }
      if (requiredTasksTypes.contains(RequiredTasksTypes.confirmOrApologize)) {
        final task = requiredTasks.firstWhere(
            (element) => element.type == RequiredTasksTypes.confirmOrApologize);
        ConfirmAttendance confirmAttendance =
            ConfirmAttendance.fromJson(task.objects);
        emit(ConfirmAttendanceState(confirmAttendance: confirmAttendance));
      }
      emit(DismissDialogState());
    } catch (e) {
      emit(DismissDialogState());
      rethrow;
    }
  }

  confirmDashboardAction(DashboardRequiredActionRespondParams params) async {
    try {
      await _respondDashboardRequiredActionUseCase.call(params: params);
      detectOfRequiredTasks();
    } catch (e) {}
  }


  emitVerificationFaceException(){
    emit(ErrorState(VerificationFaceException()));
  }
}
