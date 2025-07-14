



import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/salary-definition-request/index.dart';

import '../../datasources/remote/api/salary-definition-request/salary_definition_api.dart';

@Injectable()
class SalaryDefinitionRepository {

  final SalaryDefinitionAPI _api;

  SalaryDefinitionRepository(this._api);

  Future<List<SalaryDefinitionRequestDto> > fetchSalaryDefinitionRequest(int type) async {
    final service = await _api.fetchSalaryDefinitionRequest(type);
    return service.payload!;
  }

  Future<List<TypeOfCommerce>> fetchTypeOFCommerce() async {
    final response = await _api.fetchTypeOFCommerce();
    return response.payload!;
  }

  Future<String> addSalaryDefinition({required AddSalaryDefinitionRequestPrams addSalaryDefinitionRequestPrams}) async {
    final response = await _api.addSalaryDefinition(addSalaryDefinitionRequestPrams);
    return response.payload!;
  }

  Future<DownLoadFileDto> downLoadSalaryDefinition({required String id, required String type}) async {
    final response = await _api.downLoadSalaryDefinition(id, type);
    return response.payload!;
  }

  Future<List<ReasonSalaryDefinitionRequestDto>> fetchReasonSalaryDefinitionRequest() async {
    final response = await _api.fetchReasonSalaryDefinitionRequest();
    return response.payload!;
  }
}