import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/salary-definition-request/index.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/pages/salary_definition_requests_list.dart';
  import '../../../../shared/components/base_widget_bloc.dart';
import '../../../common/common_state.dart';
import '../bloc/salary_definition_request_cubit.dart';

class SalaryDefinitionRequestsPage extends BaseBlocWidget<
    Initialized<List<SalaryDefinitionRequest>>, SalaryDefinitionRequestCubit> {
  final int type;

  SalaryDefinitionRequestsPage({Key? key, required this.type})
      : super(key: key);

  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  void loadInitialData(context) {
    bloc.fetchSalaryDefinitionRequest(type);
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<SalaryDefinitionRequest>> state) {
    return SalaryDefinitionRequestsList(
      requests: state.data,
      type: type,
      onDownloadFile: (id, type) {
        bloc.downLoadSalaryDefinition(id: id, type: type);
      },
    );
  }
}
