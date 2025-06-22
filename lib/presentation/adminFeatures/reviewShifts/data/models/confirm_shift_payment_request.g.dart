// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_shift_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmShiftPaymentRequest _$ConfirmShiftPaymentRequestFromJson(
        Map<String, dynamic> json) =>
    ConfirmShiftPaymentRequest(
      id: (json['id'] as num?)?.toInt(),
      description: json['description'] as String?,
      descriptionForBlock: json['descriptionForBlock'] as String?,
      statusId: (json['statusId'] as num?)?.toInt(),
      blockTypeId: (json['blockTypeId'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      typeOfOpportunty: (json['typeOfOpportunty'] as num?)?.toInt(),
      evaluations: (json['evaluations'] as List<dynamic>?)
          ?.map((e) => JobEvaluationsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConfirmShiftPaymentRequestToJson(
        ConfirmShiftPaymentRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'descriptionForBlock': instance.descriptionForBlock,
      'statusId': instance.statusId,
      'blockTypeId': instance.blockTypeId,
      'userId': instance.userId,
      'typeOfOpportunty': instance.typeOfOpportunty,
      'evaluations': instance.evaluations,
    };
