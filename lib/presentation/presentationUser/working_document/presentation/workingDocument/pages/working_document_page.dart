import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/working_document/presentation/workingDocument/pages/working_document_screen.dart';

import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../common/common_state.dart';
import '../../../domain/entities/working_document.dart';
import '../bloc/working_document_cubit.dart';


class WorkingDocumentPage extends BaseBlocWidget<
    Initialized<WorkingDocument>, WorkingDocumentCubit> {

  WorkingDocumentPage({Key? key})
      : super(key: key);


  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  void loadInitialData(context) {
    int? jobId = getArguments(context) as int? ?? 0;
    bloc.fetchWorkingDocumentData(jobId);
  }

  @override
  String? title(context) => strings.working_document;

  @override
  Widget buildWidget(
      BuildContext context, Initialized<WorkingDocument> state) {
    return WorkingDocumentScreen(
      data: state.data,
    );
  }

  // @override
  //  onRequestSuccess(message) {
  //   bloc.fetchUsers();
  // }
}
