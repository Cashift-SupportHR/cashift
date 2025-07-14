import 'package:flutter/material.dart';
import 'package:shiftapp/common/data/models/activity_log/index.dart';
import 'package:shiftapp/common/domain/entities/shift/applied_offer_dto.dart';
import 'package:shiftapp/presentation/adminFeatures/di/injector.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/geofence/dialog_background_service.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import 'package:shiftapp/presentation/shared/components/dialogs_manager.dart';
import 'package:shiftapp/presentation/shared/components/user_notifier_widget.dart';

import '../../../../main_index.dart';
import '../../../../common/components/adminToggle/cubit/admin_toggle_cubit.dart';
import '../../appliedoffers/widgets/cancel_shift_widget.dart';
import '../../joboffers/job_offer_details/job_offer_details_page.dart';
import 'bloc/overview_bloc.dart';
import 'bloc/overview_cubit.dart';
import 'bloc/overview_state.dart';
import 'pages/overview_screen.dart';

class OverviewPage extends BaseBlocWidget<OverviewState, OverviewCubit> {
  @override
  bool initializeByKoin() {
    return false;
  }

  var isShowingDiscouser = false;

  @override
  void loadInitialData(BuildContext context) {
    bloc.loadInitialData();

  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  onClickReload() {
    loadInitialData(context);
  }

  @override
  void onRequestSuccess(String? message) {
    super.onRequestSuccess(message);
    loadInitialData(context);
  }

  @override
  void buildListener(BuildContext context, state) {
    super.buildListener(context, state);
    if (state is StartSoonShiftListener) {
      showAlertShiftDialog(context, state.appliedOffer);
    }
    if (state is ToggledUserState) {
      Navigator.pushReplacementNamed(context, Routes.home);
    }
    if (state is DisclosureRequiredTaskState) {
      showAlertDisclosureRequiredTask(context,
          disclosureTaskDto: state.disclosureTaskDto);
    }
    if (state is RequiredAutoAttendanceState) {
      return;
      if (state.isFirst) {
        /*showBackgroundServiceDialog(context, onSave: () {
          AutoAttendanceBackgroundService.start(
              TimeAutoAttendanceDto.fromJson(state.geo.toJson()), context);
        });*/
      } else {
        /*  AutoAttendanceBackgroundService.start(
            TimeAutoAttendanceDto.fromJson(state.geo.toJson()), context);*/
      }
    }
    if (state is EmployeeAttendanceTimeState) {
      return;
      if (state.isFirst) {
        showBackgroundServiceDialog(context, onSave: () {
          //AutoAttendanceBackgroundService.start(state.geoTimeTask, context);
        });
      } else {
        // TimeBackgroundService.start(state.geoTimeTask, context);
      }
    }
    if (state is ConfirmAttendanceState) {
      showConfirmAttendanceDialog(
        context,
        data: state.confirmAttendance,
      );
    }
  }

  cancelJob(int id, BuildContext context) async {
    CancelShiftWidget.showCancelShiftDialog(context, onConfirm: (message) {
      bloc.confirmActivity(ConfirmActivityParams(
          description: message,
          id: id,
          statusId: ConfirmActivityStatus.Reject));
    });
  }

  acceptJob(int id) {
    fetchLocation(onGetLocation: ((location) {
      bloc.confirmActivity(ConfirmActivityParams(
          longitude: location.longitude,
          latitude: location.latitude,
          id: id,
          statusId: ConfirmActivityStatus.ApproveFromHome));
    }));
  }

  Future<void> showAlertShiftDialog(
      BuildContext context, AppliedOfferDto shift) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    DialogsManager.showConfirmationAnimatedDialog(context,
        message: strings.confirm_attendance_message +
            '\n' +
            shift.jobName.toString() +
            ' ' +
            shift.projectName.toString(), onConfirm: () {
      acceptJob(shift.id!);
    }, negativeTap: () {
      cancelJob(shift.id!, context);
    }, negativeButtonName: strings.cancel_shift_title);
  }

  int jobId = 0;

  Widget body(BuildContext context, OverviewState state) {
    return Scaffold(
      backgroundColor: kBackground,
      body: RefreshIndicator(
        onRefresh: () {
          loadInitialData(context);
          return bloc.stream.firstWhere((element) => element is! LoadingState);
        },
        child: OverviewScreenV2(
          state: state,
          onRequestEvent: (event) {
            bloc.requestEvent(event);
          },
          onRefresh: () {
            loadInitialData(context);
          },
          onChangeDate: (dateTime) {
            bloc.filterOffers(dateTime: dateTime);
          },
          onApplyJobNow: (id) {
            bloc.applyJobNow(id);
          },
          onCheckCertificateJob: (id) {
            jobId = id;
            navigateToDetails(context);
            // bloc.add(CheckCertificateJobEvent(id));
          },
        ),
      ),
    );
  }

  @override
  Widget buildWidget(BuildContext context, OverviewState state) {
    return body(context, state);
  }

  @override
  Widget build(BuildContext context) {
    return UserNotifierWidget(
        onUpdate: () {
          loadInitialData(context);
        },
        child: mainFrame(body: buildConsumer(context)));
  }

  navigateToDetails(BuildContext context) =>
      Navigator.pushNamed(context, Routes.jobOfferDetails,
          arguments: JobOfferDetailsPageArgs(
            jobId,
          ));
}
