// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_clearance_certificatet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeClearanceCertificate _$TypeClearanceCertificateFromJson(
        Map<String, dynamic> json) =>
    TypeClearanceCertificate(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$TypeClearanceCertificateToJson(
        TypeClearanceCertificate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };
