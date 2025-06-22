// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_shiftsprams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewShiftsprams _$ReviewShiftspramsFromJson(Map<String, dynamic> json) =>
    ReviewShiftsprams(
      statusId: (json['statusId'] as num?)?.toInt(),
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      searchString: json['searchString'] as String?,
    );

Map<String, dynamic> _$ReviewShiftspramsToJson(ReviewShiftsprams instance) =>
    <String, dynamic>{
      'statusId': instance.statusId,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'searchString': instance.searchString,
    };
