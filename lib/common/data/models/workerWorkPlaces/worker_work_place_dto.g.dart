// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_work_place_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkerWorkPlaceDto _$WorkerWorkPlaceDtoFromJson(Map<String, dynamic> json) =>
    WorkerWorkPlaceDto(
      id: (json['id'] as num?)?.toInt(),
      typeFreeLance: json['typeFreeLance'] as String?,
      deviceName: json['deviceName'] as String?,
      focusPointTypeName: json['focusPointTypeName'] as String?,
      focusPointsTransactionName: json['focusPointsTransactionName'] as String?,
      focusPointName: json['focusPointName'] as String?,
      freelanceName: json['freelanceName'] as String?,
      startShift: json['startShift'] as String?,
      endShift: json['endShift'] as String?,
      images: json['images'] as String?,
      statusName: json['statusName'] as String?,
      statusColor: json['statusColor'] as String?,
      focusPointTermandCondition:
          (json['focusPointTermandCondition'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      focusPointTypeTermandCondition:
          (json['focusPointTypeTermandCondition'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      isBreak: json['isBreak'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      isStart: json['isStart'] as bool?,
      startShiftDateTime: json['startShiftDateTime'] as String?,
      endShiftDateTime: json['endShiftDateTime'] as String?,
    );

Map<String, dynamic> _$WorkerWorkPlaceDtoToJson(WorkerWorkPlaceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'typeFreeLance': instance.typeFreeLance,
      'deviceName': instance.deviceName,
      'focusPointTypeName': instance.focusPointTypeName,
      'focusPointsTransactionName': instance.focusPointsTransactionName,
      'focusPointName': instance.focusPointName,
      'freelanceName': instance.freelanceName,
      'startShift': instance.startShift,
      'endShift': instance.endShift,
      'images': instance.images,
      'statusName': instance.statusName,
      'statusColor': instance.statusColor,
      'focusPointTermandCondition': instance.focusPointTermandCondition,
      'focusPointTypeTermandCondition': instance.focusPointTypeTermandCondition,
      'isBreak': instance.isBreak,
      'status': instance.status,
      'isStart': instance.isStart,
      'startShiftDateTime': instance.startShiftDateTime,
      'endShiftDateTime': instance.endShiftDateTime,
    };
