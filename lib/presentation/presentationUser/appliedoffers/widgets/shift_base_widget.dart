import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:shiftapp/config.dart';
import 'package:shiftapp/common/data/models/shift/cancel_shift_params.dart';
import 'package:shiftapp/common/domain/entities/shift/applied_offer.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/bloc/applied_offers_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/pages/qrcode_screen.dart';
 import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/locationservice/locationservice.dart';
import 'package:shiftapp/presentation/presentationUser/rate/pages/rate_page.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import 'package:shiftapp/presentation/shared/components/dialogs_manager.dart';
import '../../../../common/domain/entities/attendancerecoginatin/register_attendance_request_cashift.dart';
import '../cancelOpprtunity/cancel_opportunity_apologizing_page.dart';
import '../../../../core/services/routes.dart';

abstract class ShiftBaseWidget<T> extends BaseBlocWidget<T, AppliedOffersCubit> {
  AppliedOffer? currentShift;
  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return buildConsumer(context);
  }

  void onChangeStatus() {}

  @override
  void onRequestSuccess(String? message) {
    showSuccessMessage(message ?? '', onDismiss: () {
      onChangeStatus();
      rate();
      onSuccessDismissed();
    });
  }

  Future<void> rate() async {
    final enabled = await bloc.enableRate();
    if (enabled && currentShift != null && currentShift!.isStarted()) {
      RatePage.show(context, currentShift!.id!);
    }
  }

  void confirmAttendanceRequest(BuildContext context, AppliedOffer shift,
      {required Function onConfirm}) {
    if (!shift.ableToAttendance()) {
      return;
    }
    DialogsManager.showConfirmationAnimatedDialog(context, onConfirm: () {
      onConfirm();
    },
        message:
            '${shift.isAccept() ? strings.start_shift_label : strings.finish_shift_label}${shift.jobName}');
  }

  Future scanQr(BuildContext context, AppliedOffer shift) async {
    if (Config.isDebuggable) {
      File? file;
      return Future.value(QrCode(shift.projectId.toString(),file));
    }
    return await Navigator.pushNamed(context, Routes.qrScanner) as QrCode;
  }

  QrCode? detectQr(qrcode, AppliedOffer shift) {
    if (qrcode != null && qrcode is QrCode) {
      return qrcode;
    } else {
      return null;
    }
  }

  Future<LocationData> _location(BuildContext context) async {
    try {
      final position = await LocationService.determinePosition(context);
      return position;
    } catch (e) {
      return Future.error(e);
    }
  }

  void fetchLocation({required Function(LocationData location) onGetLocation}) {
    showProgress();
    _location(context).then((value) {
      onGetLocation(value);
    }).onError((error, stackTrace) {
      handleFetchLocationException(error);
    }).whenComplete(() {
      dismissProgress();
    });
  }

  void handleFetchLocationException(e) {
    LocationService.handleFetchLocationException(e, context);
    // if (e is LocationPermissionDeniedException) {
    //   DialogsManager.showConfirmationDialog(context,
    //       message: e.toString(),
    //       buttonName: strings.open_app_settings, onConfirm: () {
    //     Geolocator.openAppSettings();
    //   });
    // } else if (e is AppLocationServiceDisabledException) {
    //   DialogsManager.showConfirmationDialog(context,
    //       message: e.toString(),
    //       buttonName: strings.open_location_settings, onConfirm: () {
    //     Geolocator.openLocationSettings();
    //   });
    // } else {
    //   DialogsManager.showMessageDialog(context, e.toString(), onClickOk: () {});
    // }
  }

  void _detectAttendanceAndQr(BuildContext context, AppliedOffer shift,
      {required Function(QrCode qrCode) onReady}) async {
    if (shift.requiredQr()) {
      final scanResult = await scanQr(context, shift);
      final qrCode = detectQr(scanResult, shift);

      if (qrCode != null) {
        onReady(qrCode);
      } else {
        DialogsManager.showMessageDialog(context, context.getStrings().error_qr,
            onClickOk: () {});
      }
    } else {
      File? file;
      onReady(QrCode(shift.projectId.toString(),file));
    }
  }

  void _sendChangeShiftEvent(
      LocationData position, AppliedOffer shift, QrCode qrCode) {
    bloc.changeShiftStatus(
        appliedOffers: shift, position: position, qr: qrCode);
  }

  Future<void> performAttendance(AppliedOffer shift) async {
    currentShift = shift;
    if (!shift.ableToAttendance()) {
      return;
    } else{
      await Navigator.pushNamed(context,  Routes.cashiftAttendancePage,
          arguments: RegisterAttendanceRequestCashift(cashift: shift));
      onChangeStatus();
      rate();
    }
  }

  void cancelShift(int id) {
    CancelOpportunityApologizingPage.showCancelOpportunityApologizing(context,
        id: id,
        onConfirm: (String message) {
      perform(message, id);
    });
  }

  void perform(String message, int id) {
    bloc.cancelShift(createCancelParams(message, id));
  }

  CancelShiftParams createCancelParams(String message, int id) {
    return CancelShiftParams(id: id, description: message);
  }

  bool enableButtonStatus(AppliedOffer shift) {
    return shift.ableToAttendance();
  }

  String statusButtonName(AppliedOffer shift) {
    return shift.isAccept() ? strings.checkin : strings.checkout;
  }

  @override
  void onSuccessDismissed() {
    Navigator.pop(context, true);
  }
}
