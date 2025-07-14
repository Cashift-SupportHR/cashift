import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:shiftapp/common/data/datasources/remote/api_exception.dart';
import 'package:shiftapp/common/data/datasources/remote/resume_not_complete_exception.dart';
import 'package:shiftapp/common/data/datasources/remote/unauthorized_exception.dart';
import 'package:shiftapp/common/data/exceptions/app_base_exception.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/widgets/job_offers_widget_helper.dart';
import 'package:shiftapp/presentation/presentationUser/locationservice/locationservice.dart';
import '../../adminFeatures/di/injector.dart';
import '../../presentationUser/common/common_state.dart';
import '../check_face_recognation/page/check_face_recognatin_page.dart';
import 'datepicker/hijri_calendar.dart';
import 'dialogs_manager.dart';
import 'progress/progress_dialog.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  final strings = Get.context!.getStrings();
  final local = Get.locale?.languageCode ?? 'en';
  final publicContext = Get.context!;
  T inject<T extends Object>(){
    return  getIt.get<T>();
  }
  //static String routeName (){return '';}

  final CustomProgressDialog progress =
      DialogsManager.createProgress(Get.context!); 


  bool isRtl() => local == 'ar';

  BaseStatelessWidget({Key? key}) : super(key: key) {
    HijriCalendar.setLocal(local);
  }

  T? getArguments<T>(BuildContext context) {
    return context.getArguments();
  }

  handleErrorDialogBuilder(dynamic exception) {
    final context = Get.context!;
    bool isRequireLogin() {
      return (exception is DioError &&
              exception.error is UnAuthorizedException) ||
          exception is UnAuthorizedException;
    }

    String getErrorMessage() {
      final strings = context.getStrings();
      if (exception is DioError) {
        if (exception.error is WebSocketException ||
            exception.error is HandshakeException) {
          return context.getStrings().error_internet_connection;
        } else if (exception.error is SocketException ||
            exception.error is TimeoutException ||
            exception.error is TimeoutException) {
          return context.getStrings().error_internet_connection;
        } else if (exception.error is ApiException) {
          return exception.message ?? strings.undefine_error;
        } else if (isRequireLogin()) {
          return context.getStrings().required_login;
        } else {
          return context.getStrings().undefine_error;
        }
      }
      if (exception is ApiException) {
        return (exception).message;
      }
      if (exception is AppBaseException) {
        return context.isRTL() ? (exception).messageAr : (exception).messageEn;
      }

      if (exception is ResumeNotCompletedException) {
        return strings.complete_cv;
      }

      if (exception is SocketException) {
        return strings.error_internet_connection;
      }
      if (exception is WebSocketException || exception is HandshakeException) {
        return strings.error_internet_connection;
      }

      return exception.toString();
    }

    if (exception is ResumeNotCompletedException) {
      DialogsManager.showErrorDialogWithButton(context, getErrorMessage());
    } else if (isRequireLogin()) {
      DialogsManager.showAskLoginDialog(context, onLogin: () {});
    } else {
      DialogsManager.showErrorDialog(context, getErrorMessage());
    }
  }

  void showErrorDialog(String error, BuildContext context,{Function() ? onClickOk}) {
    DialogsManager.showErrorDialog(context, error,onClickOk: onClickOk);
  }

  showSuccessMessage(String message, {Function? onDismiss}) {
    /* DialogsManager.showSuccessfullyAnimDialog(Get.context!, onDismiss: () {
      if (onDismiss != null) onDismiss();
    }, message: message);*/
    showSuccessMessageDialog(message, onDismiss: onDismiss);
  }

  showSuccessMessageDialog(String message, {Function? onDismiss}) {
    DialogsManager.showSuccessDialog(Get.context!, message: message, onClickOk: () {
      print('onClickOkonClickOk');
      Navigator.pop(Get.context!,);
      if (onDismiss != null) onDismiss();
    });
  }

  void requestShare(String url) {
    JobOfferWidgetHelper.share(url);
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
    _location(Get.context!).then((value) {
      dismissProgress();
      onGetLocation(value);
    }).onError((error, stackTrace) {
      handleFetchLocationException(error);
    }).whenComplete(() {
      dismissProgress();
    });
  }

  void handleFetchLocationException(e) {
    LocationService.handleFetchLocationException(e, Get.context!);
  }

  bool isShowProgress = false;
  showProgress() {
    if (!isShowProgress) {
      progress.show();
      isShowProgress = true;
    }
  }

  dismissProgress() {
    progress.dismiss();
    isShowProgress = false;
  }

  

  void buildListener(BuildContext context, dynamic state) {

    if (state is LoadingStateListener) {
      showProgress();
    } else {
      dismissProgress();
    }

    if (state is FailureStateListener) {
      dismissProgress();
      handleErrorDialog(state.error, context);
      onRequestFail(state.error);
    }

    if (state is SuccessStateListener<String>) {
      dismissProgress();
      onRequestSuccess(state.data);
    }
    if (state is SuccessStateListener) {
      onSuccessDataState(state.data);
    }
  }

  void onRequestFail(Object error) {}

  void onSuccessDataState(data) {}
  void onRequestSuccess(String? message) {
    showSuccessMessage(message ?? '', onDismiss: () {
      onSuccessDismissed();
    });
  }

  void onSuccessDismissed() {}

  void handleApiError(error,
      {required Function(String message, String code) onHandleMessage}) {
    final errorApi = Get.context!.handleApiError(exception: error);
    onHandleMessage(errorApi.code, "0");
  }

  void handleErrorDialog(error, BuildContext context) {
    DialogsManager.showErrorDialog(
        context, context.handleApiErrorMessage(exception: error));
  }
  Future<bool> checkFaceRecognition(BuildContext context) async {
    bool isCheckFaceRecognition = await CheckFaceRecognitionPage.start(context);
    if (!isCheckFaceRecognition) {
      return false;
    }else{
      return true;
    }
  }

}
