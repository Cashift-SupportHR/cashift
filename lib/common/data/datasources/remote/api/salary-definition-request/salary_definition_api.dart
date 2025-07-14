//absencenotice

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/salary-definition-request/index.dart';
import '../../../../../network/source/user_endpoint.dart';
import '../../../../models/api_response.dart';

@Injectable()
class SalaryDefinitionAPI {
  final UserEndpoint api;

  SalaryDefinitionAPI(this.api);

  Future<ApiResponse<List<SalaryDefinitionRequestDto>>> fetchSalaryDefinitionRequest(int type) async {
    return await api.fetchSalaryDefinitionRequest(type);
  }

  Future<ApiResponse<String>> addSalaryDefinition(AddSalaryDefinitionRequestPrams query) async {
    return await api.addSalaryDefinition(query);
  }

  Future<ApiResponse<List<TypeOfCommerce>>> fetchTypeOFCommerce() async {
    return await api.fetchTypeOFCommerce();
  }

  Future<ApiResponse<DownLoadFileDto>> downLoadSalaryDefinition(String id, String type) async {
    return await api.downLoadSalaryDefinition(id, type);
  }

  Future<ApiResponse<List<ReasonSalaryDefinitionRequestDto>>> fetchReasonSalaryDefinitionRequest() async {
    return await api.fetchReasonSalaryDefinitionRequest();
  }

}
