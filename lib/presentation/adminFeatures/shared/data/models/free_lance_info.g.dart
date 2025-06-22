// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'free_lance_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeLanceInfo _$FreeLanceInfoFromJson(Map<String, dynamic> json) =>
    FreeLanceInfo(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      isAssign: json['isAssign'] as bool?,
    );

Map<String, dynamic> _$FreeLanceInfoToJson(FreeLanceInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'isAssign': instance.isAssign,
    };
