// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_offer_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationOfferParams _$NotificationOfferParamsFromJson(
        Map<String, dynamic> json) =>
    NotificationOfferParams(
      companyId: json['companyId'] as String?,
      projectId: json['projectId'] as String?,
      oppId: json['oppId'] as String?,
    );

Map<String, dynamic> _$NotificationOfferParamsToJson(
        NotificationOfferParams instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'projectId': instance.projectId,
      'oppId': instance.oppId,
    };
