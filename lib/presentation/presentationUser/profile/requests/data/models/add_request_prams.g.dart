// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_request_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRequestPrams _$AddRequestPramsFromJson(Map<String, dynamic> json) =>
    AddRequestPrams(
      cashifterRequestTypeId: (json['cashifterRequestTypeId'] as num?)?.toInt(),
      newPhoneNumber: json['newPhoneNumber'] as String?,
    );

Map<String, dynamic> _$AddRequestPramsToJson(AddRequestPrams instance) =>
    <String, dynamic>{
      'cashifterRequestTypeId': instance.cashifterRequestTypeId,
      'newPhoneNumber': instance.newPhoneNumber,
    };
