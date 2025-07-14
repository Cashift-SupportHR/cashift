 import 'package:share_plus/share_plus.dart';


import '../../../../../shared/components/base_widget_bloc.dart';
import '../../../../attendance/facerecognation/index.dart';
import '../../../../common/common_state.dart';
import '../../../data/models/index.dart';
import '../bloc/employees_certificates_cubit.dart';
import 'employees_certificates_screen.dart';

class EmployeesCertificatesPage extends BaseBlocWidget<
    Initialized<List<EmployeeCertificate>>, EmployeesCertificatesCubit> {

  EmployeesCertificatesPage({Key? key})
      : super(key: key);


  @override
  bool initializeByKoin() {
    return false;
  }


  @override
  void loadInitialData(context) {
    bloc.fetchEmployeesCertificates();
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<EmployeeCertificate>> state) {
    return EmployeesCertificatesScreen(
      data: state.data,
      onShareEmployeeCertificate: (id) {
        bloc.shareEmployeeCertificate(id);
      },
      onDownLoadEmployeeCertificate: (id) {
        bloc.downLoadEmployeeCertificate(id);
      },
    );
  }
  @override
  String  title (context)=> strings.employees_certificates;

  @override
  void buildListener(BuildContext context, state) async{
    super.buildListener(context, state);
    if (state is SuccessStateListener<List<XFile>>) {
      await Share.shareXFiles(
        state.data ?? [],
      );
    }
  }
}
