// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_transactions_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTransactionsPrams _$UpdateTransactionsPramsFromJson(
  Map<String, dynamic> json,
) => UpdateTransactionsPrams(
  id: (json['id'] as num?)?.toInt(),
  finalSummary: json['finalSummary'] as String?,
);

Map<String, dynamic> _$UpdateTransactionsPramsToJson(
  UpdateTransactionsPrams instance,
) => <String, dynamic>{
  'id': instance.id,
  'finalSummary': instance.finalSummary,
};
