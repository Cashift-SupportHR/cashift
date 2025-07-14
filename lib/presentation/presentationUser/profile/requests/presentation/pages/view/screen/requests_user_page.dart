import 'package:flutter/material.dart';

import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/profile/requests/presentation/pages/view/screen/requests_user_screen.dart';

import '../../../../../../../../core/services/routes.dart';
import '../../../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../../../salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../domain/entities/RequestsUser.dart';
import '../bloc/requests_user_cubit.dart';

class RequestsUserPage
    extends BaseBlocWidget<Initialized<List<RequestsUser>>, RequestsUserCubit> {
  @override
  void loadInitialData(BuildContext context) {
    // TODO: implement loadInitialData
    bloc.fetchRequestsUser();
  }

  @override
  String? title(BuildContext context) {
    return strings.requests;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return mainFrame(
      body: Column(
        children: [
          TitleAndAddNewRequest(
            title: strings.requests,
            textButton: strings.add_request,
            onTap: () {
              Navigator.pushNamed(context, Routes.addRequestsUserPage);
            },
          ),
          Expanded(child: buildConsumer(context)),
        ],
      ),
    );
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<RequestsUser>> state) {
    return RequestsUserScreen(
      data: state.data,
    );
  }
}
