// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custody_handover_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustodyHandoverDto _$CustodyHandoverDtoFromJson(Map<String, dynamic> json) =>
    CustodyHandoverDto(
      id: (json['id'] as num?)?.toInt(),
      vehicleCustodyId: (json['vehicleCustodyId'] as num?)?.toInt(),
      vehicleCustodyName: json['vehicleCustodyName'] as String?,
      custodyHandoverId: (json['custodyHandoverId'] as num?)?.toInt(),
      custodyStatus: json['custodyStatus'] as bool?,
      custodyStatusName: json['custodyStatusName'] as String?,
      image: json['image'] as String?,
      issueDescription: json['issueDescription'] as String?,
      attachmentPath: json['attachmentPath'] as String?,
    );

Map<String, dynamic> _$CustodyHandoverDtoToJson(CustodyHandoverDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleCustodyId': instance.vehicleCustodyId,
      'vehicleCustodyName': instance.vehicleCustodyName,
      'custodyHandoverId': instance.custodyHandoverId,
      'custodyStatus': instance.custodyStatus,
      'custodyStatusName': instance.custodyStatusName,
      'image': instance.image,
      'issueDescription': instance.issueDescription,
      'attachmentPath': instance.attachmentPath,
    };
