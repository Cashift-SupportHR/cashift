// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_num_month_condition_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanNumMonthConditionDto _$LoanNumMonthConditionDtoFromJson(
        Map<String, dynamic> json) =>
    LoanNumMonthConditionDto(
      termandCondition: (json['termandCondition'] as List<dynamic>?)
          ?.map((e) => TermandCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      loansMonthVM: (json['loansMonthVM'] as List<dynamic>?)
          ?.map((e) => LoansMonth.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LoanNumMonthConditionDtoToJson(
        LoanNumMonthConditionDto instance) =>
    <String, dynamic>{
      'termandCondition': instance.termandCondition,
      'loansMonthVM': instance.loansMonthVM,
    };

TermandCondition _$TermandConditionFromJson(Map<String, dynamic> json) =>
    TermandCondition(
      isAccept: json['isAccept'] as bool?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TermandConditionToJson(TermandCondition instance) =>
    <String, dynamic>{
      'isAccept': instance.isAccept,
      'description': instance.description,
    };

LoansMonth _$LoansMonthFromJson(Map<String, dynamic> json) => LoansMonth(
      id: (json['id'] as num?)?.toInt(),
      nameMonth: json['nameMonth'] as String?,
      isGuarantor: json['isGuarantor'] as bool?,
    );

Map<String, dynamic> _$LoansMonthToJson(LoansMonth instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameMonth': instance.nameMonth,
      'isGuarantor': instance.isGuarantor,
    };
