import 'package:json_annotation/json_annotation.dart'; 

part 'loan_type_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class LoanTypeDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'crmValue')
  String? crmValue;
  @JsonKey(name: 'loanValue')
  String? loanValue;

  LoanTypeDto({this.id, this.name, this.crmValue, this.loanValue});

   factory LoanTypeDto.fromJson(Map<String, dynamic> json) => _$LoanTypeDtoFromJson(json);

   Map<String, dynamic> toJson() => _$LoanTypeDtoToJson(this);
}

