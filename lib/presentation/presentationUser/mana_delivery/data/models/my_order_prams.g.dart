// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_order_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyOrderPrams _$MyOrderPramsFromJson(Map<String, dynamic> json) => MyOrderPrams(
  key: json['key'] as String?,
  page: (json['page'] as num?)?.toInt(),
  pageSize: (json['pageSize'] as num?)?.toInt(),
);

Map<String, dynamic> _$MyOrderPramsToJson(MyOrderPrams instance) =>
    <String, dynamic>{
      if (instance.key case final value?) 'key': value,
      if (instance.page case final value?) 'page': value,
      if (instance.pageSize case final value?) 'pageSize': value,
    };
