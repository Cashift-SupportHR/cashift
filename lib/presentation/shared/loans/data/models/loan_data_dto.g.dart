// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanDataDto _$LoanDataDtoFromJson(Map<String, dynamic> json) => LoanDataDto(
      id: (json['id'] as num?)?.toInt(),
      freelanceName: json['freelanceName'] as String?,
      freelanceIcon: json['freelanceIcon'] as String?,
      mobile: json['mobile'] as String?,
      idNumber: json['idNumber'] as String?,
      loanType: json['loanType'] as String?,
      loanValue: (json['loanValue'] as num?)?.toDouble(),
      deductPercentage: json['deductPercentage'] as String?,
      remainingLoan: (json['remainingLoan'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LoanDataDtoToJson(LoanDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'freelanceName': instance.freelanceName,
      'freelanceIcon': instance.freelanceIcon,
      'mobile': instance.mobile,
      'idNumber': instance.idNumber,
      'loanType': instance.loanType,
      'loanValue': instance.loanValue,
      'deductPercentage': instance.deductPercentage,
      'remainingLoan': instance.remainingLoan,
    };
