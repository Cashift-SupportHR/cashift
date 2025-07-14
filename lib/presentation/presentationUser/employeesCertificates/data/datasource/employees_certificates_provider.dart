
import 'package:injectable/injectable.dart';
import 'package:shiftapp/presentation/presentationUser/employeesCertificates/data/models/index.dart';
import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/user_endpoint.dart';

@Injectable()
class EmployeesCertificatesAPI {
  final UserEndpoint api;

  EmployeesCertificatesAPI(this.api);

  Future<ApiResponse<List<EmployeeCertificateDto>>> fetchEmployeesCertificates() async {
    return await api.fetchEmployeesCertificates();
  }

  Future<ApiResponse<DownLoadFileDto>> downLoadEmployeeCertificate(int id) async {
    return await api.downLoadEmployeeCertificate(id);
  }

}
