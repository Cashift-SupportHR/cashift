// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'working_document_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkingDocumentDto _$WorkingDocumentDtoFromJson(Map<String, dynamic> json) =>
    WorkingDocumentDto(
      benefits: (json['benefits'] as List<dynamic>?)
          ?.map((e) => BenefitDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      payments: (json['payments'] as List<dynamic>?)
          ?.map((e) => PaymentDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkingDocumentDtoToJson(WorkingDocumentDto instance) =>
    <String, dynamic>{
      'benefits': instance.benefits,
      'payments': instance.payments,
    };

BenefitDocument _$BenefitDocumentFromJson(Map<String, dynamic> json) =>
    BenefitDocument(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BenefitDocumentToJson(BenefitDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

PaymentDocument _$PaymentDocumentFromJson(Map<String, dynamic> json) =>
    PaymentDocument(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$PaymentDocumentToJson(PaymentDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
      'code': instance.code,
    };
