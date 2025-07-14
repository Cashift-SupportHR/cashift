// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_absence_notice_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAbsenceNoticeParams _$AddAbsenceNoticeParamsFromJson(
        Map<String, dynamic> json) =>
    AddAbsenceNoticeParams(
      requestDate: json['requestDate'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$AddAbsenceNoticeParamsToJson(
        AddAbsenceNoticeParams instance) =>
    <String, dynamic>{
      'requestDate': instance.requestDate,
      'notes': instance.notes,
    };
