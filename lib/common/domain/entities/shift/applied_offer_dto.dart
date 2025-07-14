import 'package:json_annotation/json_annotation.dart';
import 'package:shiftapp/common/domain/entities/shift/applied_offer.dart';

import '../../../data/models/attendance/attendance_config_dto.dart';
import 'deductions_dto.dart';

part 'applied_offer_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class AppliedOfferDto {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'pathLogo')
  final String? pathLogo;
  @JsonKey(name: 'isCurrent')
  final int? isCurrent;
  @JsonKey(name: 'statusId')
  final int? statusId;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'radius')
  final String? radius;
  @JsonKey(name: 'opportunitiesStrartTime')
  final String? opportunitiesStrartTime;
  @JsonKey(name: 'opportunitiesEndTime')
  final String? opportunitiesEndTime;
  @JsonKey(name: 'workingDate')
  final String? workingDate;
  @JsonKey(name: 'workingDateTime')
  final String? workingDateTime;
  @JsonKey(name: 'endWorkingDateTime')
  final String? endWorkingDateTime;
  @JsonKey(name: 'endWorkingDate')
  final String? endWorkingDate;
  @JsonKey(name: 'latitude')
  final double? latitude;
  @JsonKey(name: 'longtude')
  final double? longtude;
  @JsonKey(name: 'jobId')
  final int? jobId;
  @JsonKey(name: 'jobName')
  final String? jobName;
  @JsonKey(name: 'salary')
  final int? salary;
  @JsonKey(name: 'projectId')
  final String? projectId;
  @JsonKey(name: 'projectName')
  final String? projectName;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'isFingerPrint')
  final String? isFingerPrint;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'specializtion')
  final String? specializtion;
  @JsonKey(name: 'gender')
  final String? gender;
  @JsonKey(name: 'qualificationName')
  final String? qualificationName;
  @JsonKey(name: 'requiredCount')
  final int? requiredCount;
  @JsonKey(name: 'actualNumber')
  final int? actualNumber;
  @JsonKey(name: 'addressCompany')
  final String? addressCompany;
  @JsonKey(name: 'latitudeCompany')
  final double? latitudeCompany;
  @JsonKey(name: 'longtudeCompany')
  final double? longtudeCompany;
  @JsonKey(name: 'listJobUniForm')
  final List<String>? listJobUniForm;
  @JsonKey(name: 'notes')
  final String? notes;
  @JsonKey(name: 'allowFaceRecognition')
  final bool? allowFaceRecognition;
  @JsonKey(name: 'deservedAmount')
  final num? deservedAmount;
  @JsonKey(name: 'totalDeductions')
  final num? totalDeductions;
  @JsonKey(name: 'deductions')
  final List<Deduction>? deductionsDto;
  @JsonKey(name: 'attendanceConfig')
  AttendanceConfigDto? attendanceConfigDto;
  @JsonKey(name: 'conditionName')
  final List<String>? conditionName;
  @JsonKey(name: 'isAllowToTrack')
  final bool? isAllowToTrack;
  AppliedOfferDto(
      {this.id,
        this.isAllowToTrack,
      this.pathLogo,
      this.deductionsDto,
      this.totalDeductions,
      this.deservedAmount,
      this.isCurrent,
      this.statusId,
      this.status,
      this.radius,
      this.opportunitiesStrartTime,
      this.opportunitiesEndTime,
      this.workingDate,
      this.workingDateTime,
      this.endWorkingDateTime,
      this.endWorkingDate,
      this.latitude,
      this.longtude,
      this.jobId,
      this.jobName,
      this.salary,
      this.projectId,
      this.projectName,
      this.address,
      this.isFingerPrint,
      this.description,
      this.specializtion,
      this.gender,
      this.qualificationName,
      this.requiredCount,
      this.actualNumber,
      this.addressCompany,
      this.latitudeCompany,
      this.longtudeCompany,
      this.listJobUniForm,
      this.notes,
      this.allowFaceRecognition,
      this.attendanceConfigDto,
        this.conditionName,});

  factory AppliedOfferDto.fromJson(Map<String, dynamic> json) => _$AppliedOfferDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AppliedOfferDtoToJson(this);
  AppliedOffer builder() {
    return AppliedOffer(
        id: id,
        description: description,
        latitude: latitude,
        jobId: jobId,
        qualificationName: qualificationName,
        address: address,
        longtude: longtude,
        actualNumber: actualNumber,
        addressCompany: addressCompany,
        endWorkingDate: endWorkingDate,
        endWorkingDateTime: endWorkingDateTime,
        gender: gender,
        isCurrent: isCurrent,
        isFingerPrint: isFingerPrint,
        jobName: jobName,
        latitudeCompany: latitudeCompany,
        longtudeCompany: longtudeCompany,
        opportunitiesEndTime: opportunitiesEndTime,
        opportunitiesStrartTime: opportunitiesStrartTime,
        pathLogo: pathLogo,
        projectId: projectId,
        projectName: projectName,
        radius: radius,
        salary: salary,
        requiredCount: requiredCount,
        specializtion: specializtion,
        status: status,
        statusId: statusId,
        workingDate: workingDate,
        workingDateTime: workingDateTime,
        listJobUniForm: listJobUniForm,
        notes: notes,
        deservedAmount: deservedAmount,
        totalDeductions: totalDeductions,
        deductionsDto: deductionsDto,
        allowFaceRecognition: allowFaceRecognition,
        attendanceConfigDto: attendanceConfigDto,
        conditionName: conditionName,
    );
  }
}
