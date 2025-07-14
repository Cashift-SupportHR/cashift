// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanTypeDto _$LoanTypeDtoFromJson(Map<String, dynamic> json) => LoanTypeDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      crmValue: json['crmValue'] as String?,
      loanValue: json['loanValue'] as String?,
    );

Map<String, dynamic> _$LoanTypeDtoToJson(LoanTypeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'crmValue': instance.crmValue,
      'loanValue': instance.loanValue,
    };
