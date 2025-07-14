import 'package:json_annotation/json_annotation.dart'; 

part 'worker_work_place_dto.g.dart'; 

@JsonSerializable(nullable: true, ignoreUnannotated: false)
class WorkerWorkPlaceDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'typeFreeLance')
  String? typeFreeLance;
  @JsonKey(name: 'deviceName')
  String? deviceName;
  @JsonKey(name: 'focusPointTypeName')
  String? focusPointTypeName;
  @JsonKey(name: 'focusPointsTransactionName')
  String? focusPointsTransactionName;
  @JsonKey(name: 'focusPointName')
  String? focusPointName;
  @JsonKey(name: 'freelanceName')
  String? freelanceName;
  @JsonKey(name: 'startShift')
  String? startShift;
  @JsonKey(name: 'endShift')
  String? endShift;
  @JsonKey(name: 'images')
  String? images;
  @JsonKey(name: 'statusName')
  String? statusName;
  @JsonKey(name: 'statusColor')
  String? statusColor;
  @JsonKey(name: 'focusPointTermandCondition')
  List<String>? focusPointTermandCondition;
  @JsonKey(name: 'focusPointTypeTermandCondition')
  List<String>? focusPointTypeTermandCondition;
  @JsonKey(name: 'isBreak')
  bool? isBreak;
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'isStart')
  bool? isStart;
  @JsonKey(name: 'startShiftDateTime')
  String? startShiftDateTime;
  @JsonKey(name: 'endShiftDateTime')
  String? endShiftDateTime;

  WorkerWorkPlaceDto({this.id, this.typeFreeLance, this.deviceName, this.focusPointTypeName, this.focusPointsTransactionName, this.focusPointName, this.freelanceName, this.startShift, this.endShift, this.images, this.statusName, this.statusColor, this.focusPointTermandCondition, this.focusPointTypeTermandCondition, this.isBreak, this.status, this.isStart, this.startShiftDateTime, this.endShiftDateTime});

   factory WorkerWorkPlaceDto.fromJson(Map<String, dynamic> json) => _$WorkerWorkPlaceDtoFromJson(json);

   Map<String, dynamic> toJson() => _$WorkerWorkPlaceDtoToJson(this);
}

