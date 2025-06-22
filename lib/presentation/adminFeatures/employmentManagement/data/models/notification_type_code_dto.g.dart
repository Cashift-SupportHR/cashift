// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_type_code_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationTypeCodeDto _$NotificationTypeCodeDtoFromJson(
        Map<String, dynamic> json) =>
    NotificationTypeCodeDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$NotificationTypeCodeDtoToJson(
        NotificationTypeCodeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
