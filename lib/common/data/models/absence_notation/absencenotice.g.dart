// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absencenotice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbsenceDateParams _$AbsenceDateParamsFromJson(Map<String, dynamic> json) =>
    AbsenceDateParams(
      json['requestDate'] as String?,
      json['absenceId'] as String?,
      json['notes'] as String?,
    );

Map<String, dynamic> _$AbsenceDateParamsToJson(AbsenceDateParams instance) =>
    <String, dynamic>{
      'requestDate': instance.requestDate,
      'absenceId': instance.absenceId,
      'notes': instance.notes,
    };
