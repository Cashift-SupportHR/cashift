import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

import '../../../../../data/exceptions/verification_face_exception.dart';
import '../../../common/common_state.dart';
import '../bloc/initialize_wallet_state.dart';
import '../bloc/wallet_bloc.dart';
import 'wallet_screen_v2.dart';

class WalletPage extends BaseBlocWidget<InitializeWalletState, WalletCubit> {
  WalletPage({Key? key}) : super(key: key);

  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  void loadInitialData(BuildContext context) {
    checkAndFetchInitData(context);
  }

  @override
  Widget buildWidget(BuildContext context, InitializeWalletState state) {
    return RefreshIndicator(
      onRefresh: () async {
        loadInitialData(context);
        return await Future.delayed(Duration(milliseconds: 1500));
      },
      child: WalletScreenV2(
        state: state,
        onUpdate: () {
          loadInitialData(context);
        },
      ),
    );
  }

  @override
  onClickReload() {
    loadInitialData(context);
  }

  Future<void> checkAndFetchInitData(BuildContext context) async {
    if(bloc.isLogin()) {
      await Future.delayed(
        Duration(milliseconds: 100),
            () async {
          final checkFace = await checkFaceRecognition(context);
          if (checkFace == true) {
            bloc.fetchWalletRequiredData();
          } else {
            bloc.emitVerificationFaceException();
          }
        },
      );
    }
  }
}
