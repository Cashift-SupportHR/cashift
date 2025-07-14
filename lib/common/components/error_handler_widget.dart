import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/common/data/datasources/remote/api_exception.dart';
import 'package:shiftapp/common/data/datasources/remote/resume_not_complete_exception.dart';
import 'package:shiftapp/common/data/datasources/remote/unauthorized_exception.dart';
import 'package:shiftapp/common/data/exceptions/app_base_exception.dart';
import 'package:shiftapp/common/data/exceptions/empty_list_exception.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:sizer/sizer.dart';

import '../data/exceptions/verification_face_exception.dart';
import 'base/base_stateless_widget.dart';

// ignore: must_be_immutable
class ErrorPlaceHolderWidget extends BaseStatelessWidget {
  final String? error;
  final String? title;
  final String? buttonName;
  final Function()? onClickReload;
  final dynamic exception;
  final Color? color;
  final bool showImage;
  final double? height;
  final Widget? image;

  ErrorPlaceHolderWidget(
      {Key? key,
      this.error,
      this.exception,
      this.title,
      this.buttonName,
      this.onClickReload,
      this.showImage = true,
      this.color,
      this.height,
      this.image})
      : super(key: key);
  Widget? placeHolderImage;
  String? message;

  bool isRequireLogin() {
    return (exception is DioError &&
            exception.error is UnAuthorizedException) ||
        exception is UnAuthorizedException;
  }

  bool isRequireRegisterFace() {
    return (exception is DioError &&
            exception.error is VerificationFaceException) ||
        exception is VerificationFaceException;
  }

  bool isRequireCv() {
    return (exception is DioError &&
            exception.error is ResumeNotCompletedException) ||
        exception is ResumeNotCompletedException;
  }

  getErrorMessage(BuildContext context) {
    placeHolderImage = SvgPicture.asset(
      'images/warning.svg',
      height: 40,
    );

    if (exception is DioError) {
      final dioEx = exception as DioError;

      if (exception.error is WebSocketException ||
          exception.error is HandshakeException) {
        placeHolderImage = Image.asset(
          'images/no_wifi.png',
          scale: 3,
          height: 10,
        );
        message = context.getStrings().error_internet_connection;
      } else if (exception.error is SocketException ||
          exception.error is TimeoutException ||
          exception.error is TimeoutException) {
        placeHolderImage = Image.asset(
          'images/no_wifi.png',
          width: 100,
        );
        message = context.getStrings().check_network_connection;
      } else if (dioEx.error is ApiException) {
        print('ApiException ${exception}');
        //old code
        // message = exception.data ; Error => Class 'DioError' has no instance getter 'data'.
        // new code
        message = dioEx.message;
        placeHolderImage = noDataPlaceHolder();
      } else if (isRequireLogin()) {
        message = context.getStrings().required_login;
      } else if (isRequireCv()) {
        message = context.getStrings().complete_cv;
      } else {
        message = context.getStrings().undefine_error;
      }
    }
    if (exception is EmptyListException) {
      message = exception.toString();
      placeHolderImage = noDataPlaceHolder();
    }
    if (exception is SocketException) {
      placeHolderImage = Image.asset('images/no_wifi.png');
      message = context.getStrings().check_network_connection;
    }

    if (isRequireLogin()) {
      placeHolderImage = SvgPicture.asset('images/login_placeholder.svg');
      message = context.getStrings().required_login;
    }

    if (isRequireCv()) {
      placeHolderImage = SvgPicture.asset('images/login_placeholder.svg');
      message = context.getStrings().complete_cv;
    }

    if (exception is WebSocketException || exception is HandshakeException) {
      placeHolderImage = Image.asset('images/no_wifi.png');
      message = context.getStrings().error_internet_connection;
    }

    if (exception is AppBaseException) {
      message = (exception as AppBaseException).toString();
    }

    message ??= context.getStrings().undefine_error;

    if (error != null) message = error!;
  }

  Widget noDataPlaceHolder() => SvgPicture.asset(
        'images/no_data_placeholder.svg',
        height: 200,
      );

  @override
  Widget build(BuildContext context) {
    getErrorMessage(context);
    return Material(
      child: Container(
          color: color ?? Colors.transparent,
          height: height,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  placeHolderImage != null && showImage
                      ? Container(
                          color: color ?? Colors.transparent,
                          child: image ?? placeHolderImage,
                          height: height != null ? (height! / 2) : null,
                          margin: EdgeInsets.only(bottom: 12),
                        )
                      : Container(),
                  title != null
                      ? Text(
                          title!,
                          style: kTextMedium.copyWith(
                              color: kGreyishBrown, fontSize: 12),
                        )
                      : Container(),
                  Text(
                    message.toString().trim(),
                    style: kTextRegular.copyWith(
                        color: kBrownishGrey, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  actionButton(context)
                ],
              ),
            ),
          )),
    );
  }

  String createButtonName() {
    return isRequireLogin()
        ? strings.login
        : isRequireCv()
            ? strings.complete_profile
            : isRequireRegisterFace()
                ? strings.verification
                : buttonName != null
                    ? buttonName!
                    : strings.click_to_reload;
  }

  Widget actionButton(BuildContext context) {
    return onClickReload != null || isRequireLogin() || isRequireCv()
        ? AppCupertinoButton(
            child: Text(
              createButtonName(),
              style: kTextSemiBold.copyWith(
                color: Colors.white,
                fontSize: 14.sp,
              ),
            ),
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            onPressed: isRequireLogin()
                ? () {
                    Navigator.pushNamed(context, Routes.login);
                  }
                : isRequireCv()
                    ? () {
                        Navigator.pushNamed(context, Routes.cv,
                            arguments: true);
                      }
                    : onClickReload,
          )
        : Container();
  }
}
