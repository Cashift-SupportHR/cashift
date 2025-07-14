import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/base/app_widgets.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';
import '../../../../common/common_state.dart';
import '../bloc/qrcode_bloc.dart';
import 'qrcode_screen.dart';

class QrCodePage extends BaseBlocWidget<Initialized<String>, QrCodeCubit> {

  @override
  bool initializeByKoin() {
    return false;
  }
  QrCodePage({Key? key}) : super(key: key);
  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchUserData();
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<String> id) {
    return   AppScaffold (
      body:   QrCodeScreen(
       model: id.data,
      )
    );
  }
}
