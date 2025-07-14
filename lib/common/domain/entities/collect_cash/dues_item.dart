import 'package:json_annotation/json_annotation.dart'; 

part 'dues_item.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class DuesItem {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'money')
  final  double? money;
  @JsonKey(name: 'statusName')
  final  String? statusName;
  @JsonKey(name: 'projectName')
  final  String? projectName;
  @JsonKey(name: 'workingDate')
  final  String? workingDate;
  @JsonKey(name: 'jobId')
  final  int? jobId;
  @JsonKey(name: 'statusCode')
  final  int? statusCode;
  @JsonKey(name: 'jobName')
  final  String? jobName;
  @JsonKey(name: 'city')
  final  String? city;
  @JsonKey(name: 'collectedDay')
  final  String? collectedDay;
  @JsonKey(name: 'address')
  final  String? address;
  @JsonKey(name: 'description')
  final  String? description;
  @JsonKey(name: 'startTime')
  final  String? startTime;
  @JsonKey(name: 'endTime')
  final  String? endTime;
  @JsonKey(name: 'freeLanceApplyId')
  final  int? freeLanceApplyId;

  @JsonKey(name: 'amount')
  final  num? amount;

  @JsonKey(name: 'totalShiftHourse')
  final  num? totalShiftHourse;

  @JsonKey(name: 'totalShiftMinutes')
  final  num? totalShiftMinutes;

  DuesItem({this.id, this.money, this.statusName, this.projectName, this.workingDate, this.jobId, this.statusCode, this.jobName, this.city, this.collectedDay, this.address, this.description, this.startTime, this.endTime, this.freeLanceApplyId , this.amount, this.totalShiftHourse ,this.totalShiftMinutes});

  factory DuesItem.fromJson(Map<String, dynamic> json) => _$DuesItemFromJson(json);

  Map<String, dynamic> toJson() => _$DuesItemToJson(this);
}

