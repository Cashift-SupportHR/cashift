// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_price_opportunity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchedulePriceOpportunity _$SchedulePriceOpportunityFromJson(
  Map<String, dynamic> json,
) => SchedulePriceOpportunity(
  isAllowEditPrice: json['isAllowEditPrice'] as bool?,
  salary: (json['salary'] as num?)?.toDouble(),
);

Map<String, dynamic> _$SchedulePriceOpportunityToJson(
  SchedulePriceOpportunity instance,
) => <String, dynamic>{
  'isAllowEditPrice': instance.isAllowEditPrice,
  'salary': instance.salary,
};
