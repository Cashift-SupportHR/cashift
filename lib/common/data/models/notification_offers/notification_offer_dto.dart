import 'package:json_annotation/json_annotation.dart';

import 'job_requirements.dart';
import 'list_payment.dart';

part 'notification_offer_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class NotificationOfferDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'companyId')
  int? companyId;
  @JsonKey(name: 'jobId')
  int? jobId;
  @JsonKey(name: 'cityId')
  int? cityId;
  @JsonKey(name: 'strartTime')
  String? startTime;
  @JsonKey(name: 'opportunitiesStrartTime')
  String? opportunitiesStartTime;
  @JsonKey(name: 'opportunitiesEndTime')
  String? opportunitiesEndTime;
  @JsonKey(name: 'latitude')
  double? latitude;
  @JsonKey(name: 'longtude')
  double? longitude;
  @JsonKey(name: 'jobName')
  String? jobName;
  @JsonKey(name: 'salary')
  double? salary;
  @JsonKey(name: 'hourSalary')
  int? hourSalary;
  @JsonKey(name: 'workingDate')
  String? workingDate;
  @JsonKey(name: 'workingDateTime')
  String? workingDateTime;
  @JsonKey(name: 'endWorkingDateTime')
  String? endWorkingDateTime;
  @JsonKey(name: 'projectId')
  int? projectId;
  @JsonKey(name: 'projectName')
  String? projectName;
  @JsonKey(name: 'projectAddress')
  String? projectAddress;
  @JsonKey(name: 'jobRequirements')
  JobRequirements? jobRequirements;
  @JsonKey(name: 'radius')
  String? radius;
  @JsonKey(name: 'qualificationName')
  String? qualificationName;
  @JsonKey(name: 'flagType')
  int? flagType;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'isFingerPrint')
  String? isFingerPrint;
  @JsonKey(name: 'totalRequiredCount')
  int? totalRequiredCount;
  @JsonKey(name: 'requiredCount')
  int? requiredCount;
  @JsonKey(name: 'reserveNumber')
  int? reserveNumber;
  @JsonKey(name: 'isApprove')
  bool? isApprove;
  @JsonKey(name: 'countOfApply')
  int? countOfApply;
  @JsonKey(name: 'pathLogo')
  String? pathLogo;
  @JsonKey(name: 'actualNumber')
  int? actualNumber;
  @JsonKey(name: 'endShiftDate')
  String? endShiftDate;
  @JsonKey(name: 'avg')
  double? avg;
  @JsonKey(name: 'projectLogo')
  String? projectLogo;
  @JsonKey(name: 'jobLogo')
  String? jobLogo;
  @JsonKey(name: 'isShowBackGroundOpportunty')
  bool? isShowBackGroundOpportunity;
  @JsonKey(name: 'listPayment')
  List<ListPayment>? listPayment;

  NotificationOfferDto({this.id, this.companyId, this.jobId, this.cityId, this.startTime, this.opportunitiesStartTime, this.opportunitiesEndTime, this.latitude, this.longitude, this.jobName, this.salary, this.hourSalary, this.workingDate, this.workingDateTime, this.endWorkingDateTime, this.projectId, this.projectName, this.projectAddress, this.jobRequirements, this.radius, this.qualificationName, this.flagType, this.description, this.isFingerPrint, this.totalRequiredCount, this.requiredCount, this.reserveNumber, this.isApprove, this.countOfApply, this.pathLogo, this.actualNumber, this.endShiftDate, this.avg, this.projectLogo, this.jobLogo, this.isShowBackGroundOpportunity, this.listPayment});

   factory NotificationOfferDto.fromJson(Map<String, dynamic> json) => _$NotificationOfferDtoFromJson(json);

   Map<String, dynamic> toJson() => _$NotificationOfferDtoToJson(this);
}



