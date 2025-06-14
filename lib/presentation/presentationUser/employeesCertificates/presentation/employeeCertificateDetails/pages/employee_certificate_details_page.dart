import 'package:flutter/material.dart';

import '../../../../../../data/models/salary-definition-request/down_load_salary_definition.dart';
import '../../../../../shared/components/base_widget_bloc.dart';
import '../../../../../shared/components/files/file_view_screen.dart';
import '../../../../common/common_state.dart';
import '../bloc/employee_certificate_details_cubit.dart';

class EmployeeCertificateDetailsPage extends BaseBlocWidget<
    Initialized<DownLoadSalaryDefinition>, EmployeeCertificateDetailsCubit> {

  EmployeeCertificateDetailsPage({Key? key})
      : super(key: key);


  @override
  bool initializeByKoin() {
    return false;
  }


  @override
  void loadInitialData(context) {
    int id = ModalRoute.of(context)?.settings.arguments as int;
    bloc.downLoadEmployeeCertificate(id);
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<DownLoadSalaryDefinition> state) {
    return FileViewScreen(
      data: state.data,
    );
  }
  @override
  String  title (context)=> strings.employee_certificate;

}
