// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_transactions_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTransactionsPrams _$AddTransactionsPramsFromJson(
  Map<String, dynamic> json,
) => AddTransactionsPrams(
  destination: json['destination'] as String?,
  description: json['description'] as String?,
  startDateTime: json['startDateTime'] as String?,
  endDateTime: json['endDateTime'] as String?,
);

Map<String, dynamic> _$AddTransactionsPramsToJson(
  AddTransactionsPrams instance,
) => <String, dynamic>{
  'destination': instance.destination,
  'description': instance.description,
  'startDateTime': instance.startDateTime,
  'endDateTime': instance.endDateTime,
};
