// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_reservation_warning_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmReservationWarningPrams _$ConfirmReservationWarningPramsFromJson(
        Map<String, dynamic> json) =>
    ConfirmReservationWarningPrams(
      orderId: (json['orderId'] as num?)?.toInt(),
      warehouseId: (json['warehouseId'] as num?)?.toInt(),
      acknowledgedPenalty: json['acknowledgedPenalty'] as bool?,
    );

Map<String, dynamic> _$ConfirmReservationWarningPramsToJson(
        ConfirmReservationWarningPrams instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'warehouseId': instance.warehouseId,
      'acknowledgedPenalty': instance.acknowledgedPenalty,
    };
