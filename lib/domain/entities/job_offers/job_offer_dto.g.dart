// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_offer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobOfferDto _$JobOfferDtoFromJson(Map<String, dynamic> json) => JobOfferDto(
      isAllowToTrack: json['isAllowToTrack'] as bool?,
      id: (json['id'] as num?)?.toInt(),
      actualNumber: (json['actualNumber'] as num?)?.toInt(),
      requirmentCount: (json['requiredCount'] as num?)?.toInt(),
      isFingerPrint: json['isFingerPrint'] as String?,
      endShiftDate: json['endShiftDate'] as String?,
      pathLogo: json['pathLogo'] as String?,
      avg: json['avg'] as num?,
      objPayment: (json['listPayment'] as List<dynamic>?)
          ?.map((e) => ObjPayment.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      jobId: (json['jobId'] as num?)?.toInt(),
      flagType: (json['flagType'] as num?)?.toInt(),
      opportunitiesStrartTime: json['opportunitiesStrartTime'] as String?,
      opportunitiesEndTime: json['opportunitiesEndTime'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longtude: (json['longtude'] as num?)?.toDouble(),
      jobName: json['jobName'] as String?,
      salary: (json['salary'] as num?)?.toInt(),
      hourSalary: (json['hourSalary'] as num?)?.toDouble(),
      projectName: json['projectName'] as String?,
      workingDate: json['workingDate'] as String?,
      projectAddress: json['projectAddress'] as String?,
      jobRequirements: json['jobRequirements'] == null
          ? null
          : JobRequirements.fromJson(
              json['jobRequirements'] as Map<String, dynamic>),
      companyId: (json['companyId'] as num?)?.toInt(),
      projectlogo: json['projectLogo'] as String?,
      joblogo: json['jobLogo'] as String?,
      qualificationName: json['qualificationName'] as String?,
      showBackgroundInSlider: json['IsShowBackGroundOpportunty'] as bool?,
      listJobUniForm: (json['listJobUniForm'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      showPrice: json['showPrice'] as bool?,
      showQuantity: json['showQuantity'] as bool?,
      attendanceConfigDto: json['attendanceConfig'] == null
          ? null
          : AttendanceConfigDto.fromJson(
              json['attendanceConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JobOfferDtoToJson(JobOfferDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'jobId': instance.jobId,
      'opportunitiesStrartTime': instance.opportunitiesStrartTime,
      'opportunitiesEndTime': instance.opportunitiesEndTime,
      'latitude': instance.latitude,
      'longtude': instance.longtude,
      'jobName': instance.jobName,
      'flagType': instance.flagType,
      'salary': instance.salary,
      'hourSalary': instance.hourSalary,
      'projectName': instance.projectName,
      'workingDate': instance.workingDate,
      'projectAddress': instance.projectAddress,
      'qualificationName': instance.qualificationName,
      'description': instance.description,
      'jobRequirements': instance.jobRequirements,
      'pathLogo': instance.pathLogo,
      'endShiftDate': instance.endShiftDate,
      'isFingerPrint': instance.isFingerPrint,
      'actualNumber': instance.actualNumber,
      'requiredCount': instance.requirmentCount,
      'avg': instance.avg,
      'projectLogo': instance.projectlogo,
      'jobLogo': instance.joblogo,
      'listPayment': instance.objPayment,
      'listJobUniForm': instance.listJobUniForm,
      'IsShowBackGroundOpportunty': instance.showBackgroundInSlider,
      'showPrice': instance.showPrice,
      'showQuantity': instance.showQuantity,
      'attendanceConfig': instance.attendanceConfigDto,
      'isAllowToTrack': instance.isAllowToTrack,
    };

JobRequirements _$JobRequirementsFromJson(Map<String, dynamic> json) =>
    JobRequirements(
      gender: json['gender'] as String?,
      hoursCount: (json['hoursCount'] as num?)?.toInt(),
      specialization: json['specialization'] as String?,
    );

Map<String, dynamic> _$JobRequirementsToJson(JobRequirements instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'hoursCount': instance.hoursCount,
      'specialization': instance.specialization,
    };

ObjPayment _$ObjPaymentFromJson(Map<String, dynamic> json) => ObjPayment(
      name: json['name'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$ObjPaymentToJson(ObjPayment instance) =>
    <String, dynamic>{
      'name': instance.name,
      'logo': instance.logo,
    };
