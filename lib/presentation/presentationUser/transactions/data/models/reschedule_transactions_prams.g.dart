// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reschedule_transactions_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RescheduleTransactionsPrams _$RescheduleTransactionsPramsFromJson(
  Map<String, dynamic> json,
) => RescheduleTransactionsPrams(
  id: (json['id'] as num?)?.toInt(),
  description: json['description'] as String?,
  startDateTime: json['startDateTime'] as String?,
  endDateTime: json['endDateTime'] as String?,
);

Map<String, dynamic> _$RescheduleTransactionsPramsToJson(
  RescheduleTransactionsPrams instance,
) => <String, dynamic>{
  'id': instance.id,
  'description': instance.description,
  'startDateTime': instance.startDateTime,
  'endDateTime': instance.endDateTime,
};
