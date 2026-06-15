// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_notifications_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionNotificationsPrams _$ActionNotificationsPramsFromJson(
  Map<String, dynamic> json,
) => ActionNotificationsPrams(
  notificationId: (json['notificationId'] as num?)?.toInt(),
  action: json['action'] as String?,
);

Map<String, dynamic> _$ActionNotificationsPramsToJson(
  ActionNotificationsPrams instance,
) => <String, dynamic>{
  'notificationId': instance.notificationId,
  'action': instance.action,
};
