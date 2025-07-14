import 'package:flutter/material.dart';

import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/profile/requests/presentation/pages/add/term_and_condation_request/screen/term_and_condation_request_page.dart';
import 'package:shiftapp/common/components/helper_widgets.dart';

import '../../../../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../../data/models/upload_file_request_prams.dart';
import '../../../../../domain/entities/AddRequestConst.dart';
import '../bloc/add_file_requests_cubit.dart';
import 'add_file_requests_user_screen.dart';

class AddFileRequestsUserPage
    extends BaseBlocWidget<UnInitState, AddFileRequestsUserCubit> {
  @override
  String? title(BuildContext context) {
    return strings.add_request;
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    AddRequestConst? prams = getArguments(context);
    return AddFileRequestsUserScreen(
      onSend: (file) {
        bloc.addFileRequest(
            uploadFileRequestPrams: UploadFileRequestPrams(
                CashifterRequestTypeId: prams?.addRequestPrams.cashifterRequestTypeId,
                NewPhoneNumber: prams?.addRequestPrams.newPhoneNumber),
            file: file);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    showSheet();
  }

  showSheet() {
    AddRequestConst? prams = getArguments(context);
    return showAppModalBottomSheet(
        isDivider: false,
        titlePadding: EdgeInsets.zero,
        context: context,
        child: TermCondationRequestsUserPage(typeCode: prams!.code));
  }
}
