import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shiftapp/data/models/auth/confirm_otp_params.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/presentation/presentationUser/verification/bloc/verification_bloc.dart';
import 'package:shiftapp/presentation/presentationUser/verification/pages/verification_screen.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';
import 'package:shiftapp/presentation/shared/components/base_stateful_widget.dart';
import 'package:shiftapp/presentation/shared/components/dialogs_manager.dart';

class VerificationPageModel {
  final String phone;

  final bool verifyForLogin;

  VerificationPageModel({required this.phone, this.verifyForLogin = true});
}

class VerificationPage extends StatefulWidget {

  VerificationPage({Key? key}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends BaseState<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    GetIt getIt = GetIt.instance;
    final bloc = getIt.get<VerificationBloc>();
    final verificationPageModel = context.getArguments<VerificationPageModel>();
    final phone = verificationPageModel!.phone;
    final progress = DialogsManager.createProgress(context);
    return AppScaffold(
      barColor: Colors.white,
      body: BlocConsumer<VerificationBloc, CommonState>(
          bloc: bloc,
          listenWhen: (previous, current) {
            return true;
          },
          listener: (context, state) {
            if (state is LoadingState) {
              progress.show();
            }
            if (state is SuccessState) {
              progress.dismiss();
              print('state.data ${state.data}');
              Navigator.pop(context, state.successResponse);
            }
            if (state is ErrorState) {
              progress.dismiss();
              DialogsManager.handleErrorDialogBuilder(context, state.error);
            }
            if (state is LoadingStateListener) {
              progress.show();
            }
            if (state is SuccessStateListener) {
              setState(() {
                progress.dismiss();
              });
            }
            if (state is FailureStateListener) {
              progress.dismiss();
              DialogsManager.handleErrorDialogBuilder(context, state.error);
            }
          },
          buildWhen: (previous, current) {
            return false;
          },
          builder: (context, state) {
            return VerificationScreen(
              onComplete: (String otp) {
                print('VerificationScreen onComplete ${otp}');
                if (verificationPageModel.verifyForLogin) {
                  bloc.add(ConfirmOtpEvent(
                      ConfirmOtpParams(code: otp, phone: phone)));
                } else {
                  bloc.add(ConfirmRestPasswordOtpEvent(
                      ConfirmOtpParams(code: otp, phone: phone)));
                }
              },
              phone: phone,
              onResendOTP: () {
                bloc.add(ResendOtpEvent(phone));
              },
            ); // return widget here based on BlocA's state
          }),
      title: 'تأكيد رقم الهاتف',
    );
  }
}
