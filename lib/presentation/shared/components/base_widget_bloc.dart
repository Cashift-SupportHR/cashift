import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftapp/core/services/permission_detector.dart';
import 'package:shiftapp/common/domain/params/dashboard_required_action_respond_params.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/adminFeatures/di/injector.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/buttons/row_buttons.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';
import '../../../common/data/models/user_overview/index.dart';
import '../../../common/domain/entities/required_tasks/confirm_attendance.dart';
import '../../../common/domain/entities/required_tasks/index.dart';
import '../../../core/bloc/base_cubit.dart';
import '../../../core/services/routes.dart';
import '../../presentationUser/attendance/facerecognation/index.dart';
import '../../presentationUser/profile/addHomeAddress/pages/add_home_address_page.dart';
import '../../presentationUser/required_tasks/confirm_attendance/pages/confirm_attendance_builder.dart';
import '../../presentationUser/required_tasks/pages/required_tasks_builder.dart';
import '../../presentationUser/resources/colors.dart';
import '../check_face_recognation/page/check_face_recognatin_page.dart';
import 'app_widgets.dart';
import 'base_stateless_widget.dart';
import 'dialogs_manager.dart';
import 'loading_widget.dart';
// You have to addopportunityemployee this manually, for some reason it cannot be added automatically

import 'error_handler_widget.dart';
import 'offline_place_holder/offline_place_holder_widget.dart';
import 'slide_animation.dart';

abstract class BaseBlocWidget<T, B extends BaseCubit>
    extends BaseStatelessWidget {
  late BuildContext context;
  late B bloc = getBloc();

  B getBloc() {
    return getIt.get<B>();
  }

  BaseBlocWidget({Key? key}) : super(key: key);

  @protected
  Widget buildWidget(BuildContext context, T state);

  void buildListener(BuildContext context, dynamic state) {
    if (state is LoadingStateListener) {
      showProgress();
    } else {
      dismissProgress();
    }

    if (state is FailureStateListener) {
      handleErrorDialog(state.error, context);
      onRequestFail(state.error);
    }

    if (state is SuccessStateListener) {
      onSuccessState(state);
    }
    if (state is ShareDialogState) {
      requestShare(state.url);
    }
    if (state is RequiredRegisterAttendanceState) {
      showAlertRequiredRegisterAttendance(context);
    }
    if (state is RequiredStartShiftState) {
      showAlertRequiredStartShift(context);
    }
    if (state is DisclosureRequiredTaskState) {
      showAlertDisclosureRequiredTask(context,
          disclosureTaskDto: state.disclosureTaskDto);
    }

    if (state is DynamicFormState) {
      showDynamicFormConfirmDialog(context, data: state.inAppRequiredTask);
    }

    if (state is ConfirmAttendanceState) {
      showConfirmAttendanceDialog(
        context,
        data: state.confirmAttendance,
      );
    }
  }

  @protected
  void loadInitialData(BuildContext context) {}

  @protected
  String? title(BuildContext context) {
    return null;
  }

  @override
  void onSuccessDataState(data) {
    if (data is String) {
      onRequestSuccess(data);
    }
  }

  void onSuccessState(SuccessStateListener state) {
    onSuccessDataState(state.data);
  }

  @protected
  Widget? bottomNavigationBar(BuildContext context) {
    return null;
  }

  @protected
  Widget? leading(BuildContext context) {
    return null;
  }

  @protected
  bool isDivider(BuildContext context) {
    return true;
  }

  @protected
  bool detectRequiredTasks() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    //onBuild(bloc);
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    return mainFrame(body: buildConsumer(context));
  }

  Widget mainFrame({required Widget body}) {
    return Container(
      color: kBackground,
      child: WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: AppScaffold(
          body: body,
          onClickBack: () {
            onBackPress();
          },
          title: title(context),
          actions: appBarActions(context),
          leading: leading(context),
          isDivider: isDivider(context),
          bottomNavigationBar: bottomNavigationBar(context),
        ),
      ),
    );
  }

  Widget buildWidgetState(CommonState state, BuildContext context) {
    print('buildWidgetState $state');
    if (state is LoadingState) {
      return loadingWidget();
    }
    if (state is T) {
      detectOfRequiredTasks(context);
      return buildWidget(context, state as T);
    }
    if (state is OfflineState) {
      print('OfflineException');
      return offlineErrorPlaceHolder();
    }

    if (state is ErrorState) {
      return handleApiErrorPlaceHolder(state.error, onReload: onClickReload);
    }
    return onBuildUnInitWidget(context);
  }

  Widget loadingWidget() => LoadingView();

  Widget onBuildUnInitWidget(BuildContext context) {
    return const Center();
  }

  Widget handleApiErrorPlaceHolder(error,
      {Function()? onReload, String? buttonName, double? height}) {
    return ErrorPlaceHolderWidget(
      exception: error,
      onClickReload: onReload,
      buttonName: buttonName,
      height: height,
    );
  }

  Widget offlineErrorPlaceHolder() {
    return OfflinePlaceHolderWidget();
  }

  onClickReload() {
    loadInitialData(context);
  }

  void onSuccessRequiredTasks() {}

  @deprecated
  bool initializeByKoin() {
    return true;
  }

  BlocConsumer buildConsumer(BuildContext context) {
    this.context = context;
    loadInitialData(context);

    return BlocConsumer<B, CommonState>(
        bloc: bloc,
        listenWhen: (state, current) => current is CommonStateFListener,
        buildWhen: (state, current) => current is CommonStateFBuilder,
        builder: (context, state) => buildWidgetState(state, context),
        listener: (context, state) => buildListener(context, state));
  }

  _onWillPop(BuildContext context) {
    print('onBackPress');
    if (Navigator.canPop(context)) {
      onBackPress();
    } else {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

  void onBackPress() {
    Navigator.pop(context, false);
  }

  Future<void> detectOfRequiredTasks(BuildContext context) async {
    if (detectRequiredTasks() == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        bloc.detectOfRequiredTasks();
     });
    }
  }

  Future<void> showAlertRequiredRegisterAttendance(BuildContext context) async {
    // await Future.delayed(const Duration(milliseconds: 1500));
    DialogsManager.showConfirmationAnimatedDialog(context,
        message: strings.register_attendance_required, onConfirm: () async {
      final result = await Navigator.pushNamed(context, Routes.attendancePage);
      if (result is bool && result == true) {
        Navigator.pop(context);
      }
    },
        hideCancelButton: true,
        dismissible: false,
        buttonName: strings.attendance_registration);
  }

  Future<void> showAlertRequiredStartShift(BuildContext context) async {
    // await Future.delayed(const Duration(milliseconds: 1500));
    DialogsManager.showConfirmationAnimatedDialog(context,
        message: strings.attendance_cashift_required, onConfirm: () async {
      final result = await Navigator.pushNamed(context, Routes.currentShift);
      if (result is bool && result == true) {
        Navigator.pop(context);
      }
    },
        hideCancelButton: true,
        dismissible: false,
        buttonName: strings.attendance_registration);
  }

  Future<void> showAlertDisclosureRequiredTask(BuildContext context,
      {required DisclosureRequiredTaskDto disclosureTaskDto}) async {
    DialogsManager.customDialog(context,
        child: RequiredTasksDialogBuilder(
          requiredTaskDto: disclosureTaskDto,
          onRefresh: () {
            onSuccessRequiredTasks();
          },
        ),
        dismissible: false);
  }

  Future<void> showConfirmAttendanceDialog(
    BuildContext context, {
    required ConfirmAttendance data,
    // required Function() onRefresh,
  }) async {
    DialogsManager.customDialog(context,
        child: ConfirmAttendanceBuilder(
          data: data,
        ),
        dismissible: false);
  }

  showDynamicFormConfirmDialog(BuildContext context,
      {required InAppRequiredTask data}) {
    if('/${data.routeName}' == Routes.addHomeAddressPage){
      AddHomeAddressPage.showDialogNavigator(context, data: data);
    } else {
      DialogsManager.showInfoDialog(
        context,
        cancelable: data.negativeActionName != null,
        message: data.message ?? '',
        negativeButtonName: data.negativeActionName,
        confirmButtonName: data.actionName ?? '',
        onClickOk: () {
          if(data.routeName.isNullOrEmpty()){
            bloc.confirmDashboardAction(DashboardRequiredActionRespondParams(
              type: data.type,
              objectData: jsonEncode(data.objects),
            ));
          }else{
            Navigator.pushNamed(context, '/${data.routeName}',
                arguments: data.dataObject());
          }
          Navigator.pop(context);
        },
      );
    }
  }

  Future<bool> detectCameraAndStoragePermission(BuildContext context) =>
      PermissionDetector.detectCameraAndStoragePermission(context);

  List<Widget>? appBarActions(BuildContext context) {
    return null;
  }

}
