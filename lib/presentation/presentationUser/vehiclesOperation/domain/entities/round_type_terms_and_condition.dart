
import '../../data/models/round_type_terms_and_condition_dto.dart';

class RoundTypeTermsAndCondition {
  int? id;
  String? name;
  int? roundTypeId;
  String? roundTypeName;

  RoundTypeTermsAndCondition(
      {this.id, this.name, this.roundTypeId, this.roundTypeName});

  factory RoundTypeTermsAndCondition.fromDto(
          RoundTypeTermsAndConditionDto json) =>
      RoundTypeTermsAndCondition(
          id: json.id,
          name: json.name,
          roundTypeId: json.roundTypeId,
          roundTypeName: json.roundTypeName);

  static List<RoundTypeTermsAndCondition> fromListDto(List<RoundTypeTermsAndConditionDto> listDto) {
    return listDto.map((e) => RoundTypeTermsAndCondition.fromDto(e)).toList();
  }

}
