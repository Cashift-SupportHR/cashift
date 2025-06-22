// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatusDto _$OrderStatusDtoFromJson(Map<String, dynamic> json) =>
    OrderStatusDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      isShowFreeLanceAcceptedType: json['isShowFreeLanceAcceptedType'] as bool?,
      isShowProjects: json['isShowProjects'] as bool?,
      isShowShifts: json['isShowShifts'] as bool?,
      isShowDescription: json['isShowDescription'] as bool?,
    );

Map<String, dynamic> _$OrderStatusDtoToJson(OrderStatusDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isShowFreeLanceAcceptedType': instance.isShowFreeLanceAcceptedType,
      'isShowProjects': instance.isShowProjects,
      'isShowShifts': instance.isShowShifts,
      'isShowDescription': instance.isShowDescription,
    };
