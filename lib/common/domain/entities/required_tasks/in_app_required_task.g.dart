// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_required_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InAppRequiredTask _$InAppRequiredTaskFromJson(Map<String, dynamic> json) =>
    InAppRequiredTask(
      type: json['type'] as String?,
      objects: json['objects'],
      isRequired: json['isRequired'] as bool?,
      message: json['message'] as String?,
      routeName: json['routeName'] as String?,
      hasAction: json['hasAction'] as bool?,
      actionName: json['actionName'] as String?,
      isDynamicForm: json['isDynamicForm'] as bool?,
      isAdmin: json['isAdmin'] as bool?,
      negativeActionName: json['negativeButtonName'] as String?,
    );

Map<String, dynamic> _$InAppRequiredTaskToJson(InAppRequiredTask instance) =>
    <String, dynamic>{
      'type': instance.type,
      'isRequired': instance.isRequired,
      'objects': instance.objects,
      'message': instance.message,
      'routeName': instance.routeName,
      'hasAction': instance.hasAction,
      'actionName': instance.actionName,
      'isDynamicForm': instance.isDynamicForm,
      'isAdmin': instance.isAdmin,
      'negativeButtonName': instance.negativeActionName,
    };
