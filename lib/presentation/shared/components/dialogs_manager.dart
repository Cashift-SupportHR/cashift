// ignore: import_of_legacy_library_into_null_safe
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shiftapp/core/services/routes.dart';
import 'package:shiftapp/data/datasources/remote/api_exception.dart';
import 'package:shiftapp/data/datasources/remote/resume_not_complete_exception.dart';
import 'package:shiftapp/data/datasources/remote/unauthorized_exception.dart';
import 'package:shiftapp/data/exceptions/app_base_exception.dart';
import 'package:shiftapp/data/repositories/local/local_repository.dart';
import 'package:shiftapp/domain/entities/shared/AppVersionApdate.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/progress/progress_dialog.dart';
import 'package:shiftapp/presentation/shared/components/progress/progress_transition.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/resources/resources.dart';
import 'package:shiftapp/presentation/presentationUser/resume/pages/resume_pages.dart';
import 'package:shiftapp/presentation/shared/components/restart_app_widget.dart';
import 'package:shiftapp/presentation/shared/components/success_animation_widget.dart';
import 'package:shiftapp/utils/app_icons.dart';
import 'package:shiftapp/utils/app_utils.dart';

import '../authorization/login/pages/login_page.dart';
import 'decorations/decorations.dart';
import 'image_builder.dart';
import 'material_text.dart';
import 'underline_widget.dart';

class DialogsManager {
  static final strings = Get.context!.getStrings();

  static showAlertDialogConfirm({
    required BuildContext context,
    required String title,
    required String? message,
    Widget? body,
    required String confirmText,
    required Function() onConfirm,
    Widget? container,
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            titlePadding: const EdgeInsets.all(0),
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: SizedBox(
              //width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, right: 15),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: kTextSemiBold.copyWith(
                              color: kPrimary, fontSize: 28),
                        ),
                        const UnderlineWidget(),
                      ],
                    ),
                  ),
                  const CloseButton(),
                ],
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                message == null
                    ? body!
                    : Text(
                        message,
                        style: kTextRegular.copyWith(
                            color: kPrimary, fontSize: 12),
                      ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                container ?? const SizedBox.shrink(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: 105,
                    height: 28,
                    child: AppCupertinoButton(
                      text: confirmText,
                      textStyle: kTextSemiBold.copyWith(
                          color: kPrimaryLight, fontSize: 14),
                      radius: BorderRadius.circular(8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      onPressed: () {
                        Navigator.pop(context);
                        onConfirm();
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  static CustomProgressDialog createProgress(BuildContext context) {
    return CustomProgressDialog(context,
        dismissable: false,
        loadingWidget: const CircularProgressIndicator(
          strokeWidth: 2,
        ),
        onDismiss: () {},
        transitionDuration: const Duration(milliseconds: 500),
        backgroundColor: const Color(0x33000000),
        blur: 2,
        dialogTransitionType: DialogTransitionType.Shrink);
  }
  static CustomProgressDialog createProgressWithMessage(BuildContext context) {
    return CustomProgressDialog(context,
        dismissable: false,
        loadingWidget: Container(

          decoration: Decorations.decorationOnlyRadius(radius: 15),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                 strings.cheek_face,
                  style: kTextMedium,
                ),
                SizedBox(height: 20,),
                LinearProgressIndicator(color: kPrimary,)
              ],
            ),
          ),
        ),
        onDismiss: () {},
        transitionDuration: const Duration(milliseconds: 500),
        backgroundColor: const Color(0x33000000),
        blur: 2,
        dialogTransitionType: DialogTransitionType.Shrink);
  }



  static showLogoutDialog(BuildContext context,
      {required Function() onClickOk}) {
    showConfirmationDialog(context,
        message: context.getStrings().logout_message, onClickOk: onClickOk);
  }

  static handleErrorDialogBuilder(BuildContext context, dynamic exception) {
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
      showErrorDialogWithButton(context, getErrorMessage());
    } else if (isRequireLogin()) {
      showAskLoginDialog(context, onLogin: () {});
    } else {
      showErrorDialog(context, getErrorMessage());
    }
  }

  static showErrorDialogWithButton(BuildContext context, String text) {
    AlertDialog alert = AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            context.getStrings().ok_button,
            style: kTextBold.copyWith(color: Colors.grey, fontSize: 14),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, Routes.cv);
          },
          child: Text(
            context.getStrings().complete_profile,
            style: kTextBold.copyWith(color: kPrimary, fontSize: 14),
          ),
        )
      ],
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 60,
              child: Image.asset(
                'images/error.gif',
                height: 60,
              ),
            ),
            Text(
              text,
              style: kTextMedium.copyWith(color: kFontDark, fontSize: 12),
            ),
          ],
        ),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }

  static showCustomDialog(BuildContext context, Widget content,
      {Color? barrierColor}) {
    showDialog(
        barrierColor: barrierColor ?? kPrimaryDark.withOpacity(0.7),
        barrierDismissible: false,
        context: context,
        useSafeArea: true,
        builder: (_) => content);
  }

  static showAlertDialog(BuildContext context, Widget content,
      {ShapeBorder? shape}) {
    AlertDialog alert = AlertDialog(
      content: Container(
        child: content,
      ),
      shape: shape,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }

  static showSuccessfullyAnimDialog(BuildContext context,
      {required Function onDismiss, String? message}) {
    showCustomDialog(
        context,
        SuccessAnimationWidget(
          onFinish: () {
            Navigator.pop(context);
            onDismiss();
          },
          message: message,
        ));
  }

  static showLanguageDialog(BuildContext context,
      {required Function(AppLocals) onSelectLocal}) {
    /*ListPickerWidget.showPicker(
        context: context,
        title: context.getStrings().change_language_label,
        items: [Item(index: 0, value: 'English'),Item(index: 1, value: 'العربية')],
        onSelectItem: (item) {});
    */
    AlertDialog alert = AlertDialog(
      title: Text(
        AppResources.getStrings(context).select_language_title,
        style: kTextMedium,
      ),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              child: const MaterialText('اللغة العربية',
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  style: kTextLabel),
              onTap: () {
                onSelectLocal(AppLocals.AR);
              },
            ),
            const Divider(
              height: 1,
              color: kGreyishBrown,
            ),
            InkWell(
              child: const MaterialText('English',
                  style: kTextLabel,
                  padding: EdgeInsets.only(top: 12, bottom: 12)),
              onTap: () {
                onSelectLocal(AppLocals.EN);
              },
            )
          ],
        ),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }

  static showAskLoginDialog(BuildContext context, {required Function onLogin}) {
    showConfirmationDialog(context,
        message: context.getStrings().must_login_first, onClickOk: () async {
      Navigator.pop(context);
      await Navigator.pushNamed(context, Routes.login);
    });
    /*   AlertDialog alert = AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            context.getStrings().cancel_button,
            style: kTextBold.copyWith(color: Colors.grey, fontSize: 14),
          ),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            await Navigator.pushNamed(context, LoginPage.routeName);
            //  onLogin();
          },
          child: Text(
            context.getStrings().login,
            style: kTextBold.copyWith(color: kPrimary, fontSize: 14),
          ),
        )
      ],
      content: Container(
        height: 200,
        child: Column(
          children: [
            Container(
              height: 150,
              child: Image.asset('images/error.gif'),
            ),
            Text(
              context.getStrings().must_login_first,
              style: kTextMedium.copyWith(color: kFontDark, fontSize: 12),
            ),
          ],
        ),
      ),
    );

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });*/
  }

  static showConfirmationAnimatedDialog(BuildContext context,
      {required String message,
      String? buttonName,
      required Function() onConfirm,
      String? negativeButtonName,
      bool? hideCancelButton,
      bool? dismissible = true,
        String? description,
      Function()? negativeTap}) {
    baseDialog(context, message: message, icon: AppIcons.infoAlert,
        onClickOk: () {
      if (dismissible == true) {
        Navigator.pop(context);
      }
      onConfirm();
    },
        confirmButtonName: buttonName,
        dismissible: dismissible,
        negativeTap: negativeTap,
        description: description,
        negativeButtonName: negativeButtonName,
        hideCancelButton: hideCancelButton ?? false);
  }

  static showMessageDialog(BuildContext context, String text,
      {required Function() onClickOk}) {
    showInfoDialog(context, message: text, onClickOk: () {
      Navigator.pop(context);
      onClickOk();
    });
  }

  static void showNewVersionDialog(
      AppVersionAppUpdate checkOfAppUpdate, BuildContext context,
      {required Function onDismiss}) {
    AlertDialog alert = AlertDialog(
      actions: [
        TextButton(
          onPressed: () async {
            final res = await AppUtils.launchAppLink();
            if (checkOfAppUpdate.isForceUpdate == true) {
              RestartWidget.restartApp(context);
            } else {
              Navigator.pop(context);
            }
            onDismiss();
          },
          child: Text(
            context.getStrings().ok_button,
            style: kTextBold.copyWith(color: kPrimaryDark, fontSize: 14),
          ),
        ),
        checkOfAppUpdate.isForceUpdate != true
            ? TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  onDismiss();
                },
                child: Text(
                  context.getStrings().not_now,
                  style: kTextBold.copyWith(color: kGrey_94, fontSize: 14),
                ),
              )
            : Container()
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.info_rounded,
            color: kAccent,
          ),
          Text(
            context.getStrings().new_version_available,
            style: kTextMedium.copyWith(fontSize: 14),
          ),
        ],
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: checkOfAppUpdate.isForceUpdate != true,
        useRootNavigator: false,
        context: context,
        builder: (BuildContext context) {
          return checkOfAppUpdate.isForceUpdate == true
              ? WillPopScope(
                  onWillPop: () => onBackPress(context),
                  child: alert,
                )
              : alert;
        },
      );
    });
  }

  static onBackPress(BuildContext context) {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  static baseDialog(
    BuildContext context, {
    String? confirmButtonName,
    required String message,
    String? description,
    Function()? onClickOk,
    bool? dismissible = true,
    Function()? negativeTap,
    required String icon,
    String? negativeButtonName,
    bool hideCancelButton = true,
    Widget? cutomBodyWidegt,
    StreamStateInitial<bool>? isActiveConfirmButtonStream,
  }) {
    StreamStateInitial<bool> isConfirmButtonStream =
        isActiveConfirmButtonStream ?? StreamStateInitial();
    showGeneralDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.all(10),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: icon.split('.').last.contains('png')
              ? kBuildImage(icon, border: 0, size: 70, fit: BoxFit.contain)
              : kLoadSvgInCirclePath(icon, height: 90, width: 90),
          content: WillPopScope(
            onWillPop: () async {
              return dismissible == true;
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(message,
                    style:
                        kTextSemiBold.copyWith(fontSize: 22, color: kBlack_3C)),
                if (description != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      description ?? '',
                      style:
                          kTextRegular.copyWith(fontSize: 13, color: kGray_64),
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (cutomBodyWidegt != null) cutomBodyWidegt,
              ],
            ),
          ),
          actions: [
            StreamBuilder<bool>(
                initialData: true,
                stream: isConfirmButtonStream.stream,
                builder: (context, snapshot) {
                  return TextButton(
                    onPressed: snapshot.data == false
                        ? null
                        : () {
                            if (onClickOk != null) {
                              onClickOk();
                            } else {
                              Navigator.pop(context);
                            }
                          },
                    child: Text(
                      confirmButtonName ?? context.getStrings().ok_button,
                      style: kTextBold.copyWith(
                          color: snapshot.data == false ? kGray_00 : kPrimary,
                          fontSize: 14),
                    ),
                  );
                }),
            hideCancelButton == true
                ? const SizedBox.shrink()
                : TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (negativeTap != null) {
                        negativeTap();
                      }
                    },
                    child: Text(
                      negativeButtonName ?? context.getStrings().cancel_button,
                      style:
                          kTextBold.copyWith(color: Colors.grey, fontSize: 14),
                    ),
                  ),
          ],
        );
      },
      transitionBuilder: (context, a1, a2, child) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(opacity: a1.value, child: child),
        );
      },
    );
  }

  static showSuccessDialog(BuildContext context,
      {required String message, Function()? onClickOk}) {
    return baseDialog(context,
        message: message, icon: AppIcons.successAlert, onClickOk: onClickOk);
  }

  static showErrorDialog(BuildContext context, String text,
      {Function()? onClickOk}) {
    baseDialog(context,
        message: text, icon: AppIcons.errorAlert, onClickOk: onClickOk);
  }

  static showInfoDialog(
    BuildContext context, {
    required String message,
    Function()? onClickOk,
    bool? cancelable,
    String? negativeButtonName,
    String? confirmButtonName,
  }) {
    baseDialog(context,
        message: message,
        icon: AppIcons.infoAlert,
        onClickOk: onClickOk,
        negativeButtonName: negativeButtonName,
        confirmButtonName: confirmButtonName,
        dismissible: cancelable);
  }

  static showConfirmationDialog(
    BuildContext context, {
    required String message,
    Function()? onClickOk,
    Function()? negativeTap,
    String? negativeButtonName,
  }) {
    baseDialog(context,
        message: message,
        icon: AppIcons.infoAlert,
        onClickOk: onClickOk,
        negativeTap: negativeTap,
        negativeButtonName: negativeButtonName,
        hideCancelButton: false);
  }

  static customDialog(BuildContext context,
      {required Widget child, bool dismissible = true}) {
    return showGeneralDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return WillPopScope(
            child: child,
            onWillPop: () async {
              return dismissible == true;
            });
      },
      transitionBuilder: (context, a1, a2, child) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(opacity: a1.value, child: child),
        );
      },
    );
  }
}
