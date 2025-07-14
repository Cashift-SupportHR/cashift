import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/presentation/presentationUser/employeesCertificates/data/models/index.dart';

import '../../../../../common/data/models/api_response.dart';
 import '../datasource/employees_certificates_provider.dart';

@injectable
class EmployeesCertificatesItemRepository {

  final EmployeesCertificatesAPI _api;

  EmployeesCertificatesItemRepository(this._api);


  Future<List<EmployeeCertificateDto>> fetchEmployeesCertificates() async {
    final response = await _api.fetchEmployeesCertificates();
    return response.payload!;
  }

  Future<ApiResponse<DownLoadFileDto>> downLoadEmployeeCertificate(int id) async {
    final response = await _api.downLoadEmployeeCertificate(id);
    return response;
  }

}
