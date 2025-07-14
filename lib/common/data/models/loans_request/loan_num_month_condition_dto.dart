import 'package:json_annotation/json_annotation.dart'; 

part 'loan_num_month_condition_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class LoanNumMonthConditionDto {
  @JsonKey(name: 'termandCondition')
  List<TermandCondition>? termandCondition;
  @JsonKey(name: 'loansMonthVM')
  List<LoansMonth>? loansMonthVM;

  LoanNumMonthConditionDto({this.termandCondition, this.loansMonthVM});

   factory LoanNumMonthConditionDto.fromJson(Map<String, dynamic> json) => _$LoanNumMonthConditionDtoFromJson(json);

   Map<String, dynamic> toJson() => _$LoanNumMonthConditionDtoToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class TermandCondition {
  @JsonKey(name: 'isAccept')
  bool? isAccept;
  @JsonKey(name: 'description')
  String? description;

  TermandCondition({this.isAccept, this.description});

   factory TermandCondition.fromJson(Map<String, dynamic> json) => _$TermandConditionFromJson(json);

   Map<String, dynamic> toJson() => _$TermandConditionToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class LoansMonth {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'nameMonth')
  String? nameMonth;
  @JsonKey(name: 'isGuarantor')
  bool? isGuarantor;

  LoansMonth({this.id, this.nameMonth, this.isGuarantor});

   factory LoansMonth.fromJson(Map<String, dynamic> json) => _$LoansMonthFromJson(json);

   Map<String, dynamic> toJson() => _$LoansMonthToJson(this);
}

