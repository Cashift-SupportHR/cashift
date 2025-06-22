// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_trip_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoundTripDetailsDto _$RoundTripDetailsDtoFromJson(Map<String, dynamic> json) =>
    RoundTripDetailsDto(
      id: (json['id'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      typeName: json['typeName'] as String?,
      startRound: json['startRound'] as String?,
      endRound: json['endRound'] as String?,
      roundTime: json['roundTime'] as String?,
    );

Map<String, dynamic> _$RoundTripDetailsDtoToJson(
        RoundTripDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notes': instance.notes,
      'typeName': instance.typeName,
      'startRound': instance.startRound,
      'endRound': instance.endRound,
      'roundTime': instance.roundTime,
    };
