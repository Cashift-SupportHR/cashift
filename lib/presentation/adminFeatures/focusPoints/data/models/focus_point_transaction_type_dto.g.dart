// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_point_transaction_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FocusPointTransactionTypeDto _$FocusPointTransactionTypeDtoFromJson(
        Map<String, dynamic> json) =>
    FocusPointTransactionTypeDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$FocusPointTransactionTypeDtoToJson(
        FocusPointTransactionTypeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
