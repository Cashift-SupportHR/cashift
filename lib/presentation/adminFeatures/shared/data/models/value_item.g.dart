// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValueItem _$ValueItemFromJson(Map<String, dynamic> json) => ValueItem(
      value: (json['value'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ValueItemToJson(ValueItem instance) => <String, dynamic>{
      'value': instance.value,
      'name': instance.name,
    };
