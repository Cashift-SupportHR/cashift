
import '../../../data/models/salary-definition-request/index.dart';

class ReasonSalaryDefinitionRequest {
  String id;
  String name;
  ReasonSalaryDefinitionRequest({
      required this.id,
      required this.name,});

  factory ReasonSalaryDefinitionRequest.fromJson(ReasonSalaryDefinitionRequestDto json) {
    return ReasonSalaryDefinitionRequest(
      id: json.id!,
      name: json.name!,
    );
  }

}