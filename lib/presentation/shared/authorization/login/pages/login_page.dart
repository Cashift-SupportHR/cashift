import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/splash/splash_page.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth/local_auth.dart';

import 'package:shiftapp/common/components/dialogs_manager.dart';

import '../../../../../common/components/base/app_widgets.dart';
import '../../../../../common/components/base/base_stateful_widget.dart';
import '../../../../../common/components/base/base_widget_bloc.dart';
import '../bloc/login_bloc.dart';
import 'login_screen.dart';
import 'package:shiftapp/main_index.dart';

class LoginPage extends BaseBlocWidget<UnInitState, LoginBloc> {
  static Future<bool> startWithResult(BuildContext context) async {
    final result = await Navigator.pushNamed(context, Routes.login);
    return result == true;
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return LoginScreen(
        performLogin: (value) {
          bloc.login(value);
        }, performLoginBio: (loginBio) {
      bloc.loginBio();
    });
  }

  @override
  void buildListener(BuildContext context, state) {
    super.buildListener(context, state);
    if (state is BiometricNotEnabledState) {
      DialogsManager.showConfirmationAnimatedDialog(context,
          message:
              '${strings.biometrics_service_not_enabled}\n  ${strings.do_want_to_enable_it}',
          onConfirm: () {
        performBiometricLogin(context, onSuccess: () {
          bloc.enableBio();
        });
      }, buttonName: strings.enable);
    }
  }

  @override
  void onRequestSuccess(String? message) {
    Navigator.pushNamedAndRemoveUntil(context, Routes.splash, (route) => false);
  }

  Future<void> performBiometricLogin(BuildContext context,
      {required Function onSuccess}) async {
    final LocalAuthentication auth = LocalAuthentication();
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    if (canAuthenticate) {
      try {
        final bool didAuthenticate = await auth.authenticate(
            localizedReason: strings.authenticate_bio_msg,
            options: const AuthenticationOptions(
              biometricOnly: true,
              useErrorDialogs: true,
            ),
            authMessages: [
              AndroidAuthMessages(
                signInTitle: strings.biometric_authentication,
                cancelButton: strings.no_thanks,
              ),
              IOSAuthMessages(
                cancelButton: strings.no_thanks,
              ),
            ]);
        print('didAuthenticate status ${didAuthenticate}');
        if (didAuthenticate) {
          onSuccess();
        }
      } on PlatformException catch (e) {
        print('PlatformException ${e.toString()}');
        // ...
        DialogsManager.showErrorDialog(
            context, strings.phone_not_supported_bio);
      }
    } else {
      print('NOt able to bio');
    }
  }
}
