import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';

import '../../../data/models/attendance/attendance_config_dto.dart';


part 'job_offer_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class JobOfferDto {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'companyId')
  final int? companyId;
  @JsonKey(name: 'jobId')
  final int? jobId;
  @JsonKey(name: 'opportunitiesStrartTime')
  final String? opportunitiesStrartTime;
  @JsonKey(name: 'opportunitiesEndTime')
  final String? opportunitiesEndTime;
  @JsonKey(name: 'latitude')
  final double? latitude;
  @JsonKey(name: 'longtude')
  final double? longtude;
  @JsonKey(name: 'jobName')
  final String? jobName;
  @JsonKey(name: 'flagType')
  final int? flagType;
  @JsonKey(name: 'salary')
  final int? salary;
  @JsonKey(name: 'hourSalary')
  final double? hourSalary;
  @JsonKey(name: 'projectName')
  final String? projectName;
  @JsonKey(name: 'workingDate')
  final String? workingDate;
  @JsonKey(name: 'projectAddress')
  final String? projectAddress;
  @JsonKey(name: 'qualificationName')
  final String? qualificationName;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'jobRequirements')
  final JobRequirements? jobRequirements;
  @JsonKey(name: 'pathLogo')
  final String? pathLogo;
  @JsonKey(name: 'endShiftDate')
  final String? endShiftDate;
  @JsonKey(name: 'isFingerPrint')
  final String? isFingerPrint;
  @JsonKey(name: 'actualNumber')
  final int? actualNumber;
  @JsonKey(name: 'requiredCount')
  final int? requirmentCount;
  @JsonKey(name: 'avg')
  final num? avg;
  @JsonKey(name: 'projectLogo')
  final String? projectlogo;
  @JsonKey(name: 'jobLogo')
  final String? joblogo;
  @JsonKey(name: 'listPayment')
  final List<ObjPayment>? objPayment;
  @JsonKey(name: 'listJobUniForm')
  final List<String>? listJobUniForm;
  @JsonKey(name: 'IsShowBackGroundOpportunty')
  final bool? showBackgroundInSlider;
  @JsonKey(name: 'showPrice')
  final bool? showPrice;
  @JsonKey(name: 'showQuantity')
  final bool? showQuantity;
  @JsonKey(name: 'attendanceConfig')
  AttendanceConfigDto? attendanceConfigDto;

  @JsonKey(name: 'isAllowToTrack')
  final bool? isAllowToTrack;
  JobOfferDto({this.isAllowToTrack,
    this.id,
    this.actualNumber,
    this.requirmentCount,
    this.isFingerPrint,
    this.endShiftDate,
    this.pathLogo,
    this.avg,
    this.objPayment,
    this.description,
    this.jobId,
    this.flagType,
    this.opportunitiesStrartTime,
    this.opportunitiesEndTime,
    this.latitude,
    this.longtude,
    this.jobName,
    this.salary,
    this.hourSalary,
    this.projectName,
    this.workingDate,
    this.projectAddress,
    this.jobRequirements,
    this.companyId,
    this.projectlogo,
    this.joblogo,
    this.qualificationName,
    this.showBackgroundInSlider,
    this.listJobUniForm,
    this.showPrice,
    this.showQuantity,
    this.attendanceConfigDto,
  });

  factory JobOfferDto.fromJson(Map<String, dynamic> json) =>
      _$JobOfferDtoFromJson(json);

  Map<String, dynamic> toJson() => _$JobOfferDtoToJson(this);

  bool isFavorite() {
    return flagType == 1;
  }

  bool isVIP() {
    return flagType == 3;
  }

  bool isExpired() {
    return (actualNumber ?? 0) < 1;
  }

  LatLng location() => LatLng(latitude ?? 0.0, longtude ?? 0.0);

  DateTime workingDateTime() {
    return DateFormatter.dateFromString(workingDate,
        pattern: DateFormatter.DAY_MONTH_YEAR);
  }

  DateTime endDateTime() {
    return DateFormatter.dateFromString(endShiftDate,
        pattern: DateFormatter.DAY_MONTH_YEAR);
  }

  String workingDateString() {
    return DateFormatter.repairApiDate(workingDate ?? '');
  }

  String endDateString() {
    return DateFormatter.repairApiDate(endShiftDate ?? '');
  }

  String endTimeString() {
    return opportunitiesEndTime.toString();
  }

  String workingTimeString() {
    return opportunitiesStrartTime.toString();
  }

  int salaryRound() {
    return (salary ?? 0).round();
  }

  String logo() {
    return pathLogo ?? '';
  }

  @override
  String toString() {
    return '$jobName - $projectName - $projectAddress - $description - $qualificationName - $jobRequirements';
  }
}

@JsonSerializable(ignoreUnannotated: false)
class JobRequirements {
  @JsonKey(name: 'gender')
  final String? gender;
  @JsonKey(name: 'hoursCount')
  final int? hoursCount;
  @JsonKey(name: 'specialization')
  final String? specialization;

  JobRequirements({this.gender, this.hoursCount, this.specialization});

  factory JobRequirements.fromJson(Map<String, dynamic> json) =>
      _$JobRequirementsFromJson(json);

  Map<String, dynamic> toJson() => _$JobRequirementsToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class ObjPayment {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'logo')
  final String? logo;

  ObjPayment({this.name, this.logo});

  factory ObjPayment.fromJson(Map<String, dynamic> json) =>
      _$ObjPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$ObjPaymentToJson(this);
}
