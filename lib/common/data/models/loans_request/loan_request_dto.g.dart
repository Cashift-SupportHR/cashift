// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanRequestDto _$LoanRequestDtoFromJson(Map<String, dynamic> json) =>
    LoanRequestDto(
      typeLoans: json['typeLoans'] as String?,
      loanAmount: json['loanAmount'] as String?,
      installAmount: json['installAmount'] as String?,
      createdOn: json['createdOn'] as String?,
      totalMonth: json['totalMonth'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$LoanRequestDtoToJson(LoanRequestDto instance) =>
    <String, dynamic>{
      'typeLoans': instance.typeLoans,
      'loanAmount': instance.loanAmount,
      'installAmount': instance.installAmount,
      'createdOn': instance.createdOn,
      'totalMonth': instance.totalMonth,
      'description': instance.description,
    };
