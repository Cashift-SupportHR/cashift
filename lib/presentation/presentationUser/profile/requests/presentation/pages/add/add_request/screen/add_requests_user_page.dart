import 'package:flutter/material.dart';

import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../../../../../core/services/routes.dart';
import '../../../../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../../data/models/add_request_prams.dart';
import '../../../../../domain/entities/AddRequestConst.dart';
import '../../../../../domain/entities/ShiftRquestType.dart';
import '../bloc/add_requests_user_cubit.dart';
import 'add_requests_user_screen.dart';

class AddRequestsUserPage extends BaseBlocWidget<
    Initialized<List<ShiftRquestType>>, AddRequestsUserCubit> {
  @override
  String? title(BuildContext context) {
    return strings.add_request;
  }

  @override
  void loadInitialData(BuildContext context) {
    // TODO: implement loadInitialData
    bloc.fetchRequestsUserType();
  }

  AddRequestConst? prams ;

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<ShiftRquestType>> state) {
    return AddRequestsUserScreen(
      data: state.data,
      onAdd: (AddRequestPrams addRequestPrams,String  code) {
        prams =AddRequestConst(code: code, addRequestPrams: addRequestPrams)  ;
        bloc.addRequest(addRequestPrams);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    Navigator.pushNamed(context, Routes.confirmRequestsUserPage,
        arguments: prams);
  }
}
