// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'present_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PresentType _$PresentTypeFromJson(Map<String, dynamic> json) => PresentType(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$PresentTypeToJson(PresentType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'isActive': instance.isActive,
    };
