// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'installment_with_cashift_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstallmentWithCashiftDto _$InstallmentWithCashiftDtoFromJson(
        Map<String, dynamic> json) =>
    InstallmentWithCashiftDto(
      id: (json['id'] as num?)?.toInt(),
      installmentCount: json['installmentCount'] as String?,
      certificateCost: (json['certificateCost'] as num?)?.toInt(),
      textPercentageInstallment: json['textPercentageInstallment'] as String?,
      paymentFees: (json['paymentFees'] as num?)?.toInt(),
      cashiftFees: (json['cashiftFees'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InstallmentWithCashiftDtoToJson(
        InstallmentWithCashiftDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'installmentCount': instance.installmentCount,
      'certificateCost': instance.certificateCost,
      'textPercentageInstallment': instance.textPercentageInstallment,
      'paymentFees': instance.paymentFees,
      'cashiftFees': instance.cashiftFees,
    };
