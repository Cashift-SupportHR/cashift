// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cashifter_loan_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCashifterLoanParams _$AddCashifterLoanParamsFromJson(
        Map<String, dynamic> json) =>
    AddCashifterLoanParams(
      id: (json['id'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      freelenceId: (json['freelenceId'] as num?)?.toInt(),
      loanTypeId: (json['loanTypeId'] as num?)?.toInt(),
      loanValue: (json['loanValue'] as num?)?.toInt(),
      deductPercentage: (json['deductPercentage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddCashifterLoanParamsToJson(
        AddCashifterLoanParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'freelenceId': instance.freelenceId,
      'loanTypeId': instance.loanTypeId,
      'loanValue': instance.loanValue,
      'deductPercentage': instance.deductPercentage,
    };
