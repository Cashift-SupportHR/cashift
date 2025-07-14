// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applied_offer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppliedOfferDto _$AppliedOfferDtoFromJson(Map<String, dynamic> json) =>
    AppliedOfferDto(
      id: (json['id'] as num?)?.toInt(),
      isAllowToTrack: json['isAllowToTrack'] as bool?,
      pathLogo: json['pathLogo'] as String?,
      deductionsDto: (json['deductions'] as List<dynamic>?)
          ?.map((e) => Deduction.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDeductions: json['totalDeductions'] as num?,
      deservedAmount: json['deservedAmount'] as num?,
      isCurrent: (json['isCurrent'] as num?)?.toInt(),
      statusId: (json['statusId'] as num?)?.toInt(),
      status: json['status'] as String?,
      radius: json['radius'] as String?,
      opportunitiesStrartTime: json['opportunitiesStrartTime'] as String?,
      opportunitiesEndTime: json['opportunitiesEndTime'] as String?,
      workingDate: json['workingDate'] as String?,
      workingDateTime: json['workingDateTime'] as String?,
      endWorkingDateTime: json['endWorkingDateTime'] as String?,
      endWorkingDate: json['endWorkingDate'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longtude: (json['longtude'] as num?)?.toDouble(),
      jobId: (json['jobId'] as num?)?.toInt(),
      jobName: json['jobName'] as String?,
      salary: (json['salary'] as num?)?.toInt(),
      projectId: json['projectId'] as String?,
      projectName: json['projectName'] as String?,
      address: json['address'] as String?,
      isFingerPrint: json['isFingerPrint'] as String?,
      description: json['description'] as String?,
      specializtion: json['specializtion'] as String?,
      gender: json['gender'] as String?,
      qualificationName: json['qualificationName'] as String?,
      requiredCount: (json['requiredCount'] as num?)?.toInt(),
      actualNumber: (json['actualNumber'] as num?)?.toInt(),
      addressCompany: json['addressCompany'] as String?,
      latitudeCompany: (json['latitudeCompany'] as num?)?.toDouble(),
      longtudeCompany: (json['longtudeCompany'] as num?)?.toDouble(),
      listJobUniForm: (json['listJobUniForm'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      notes: json['notes'] as String?,
      allowFaceRecognition: json['allowFaceRecognition'] as bool?,
      attendanceConfigDto: json['attendanceConfig'] == null
          ? null
          : AttendanceConfigDto.fromJson(
              json['attendanceConfig'] as Map<String, dynamic>),
      conditionName: (json['conditionName'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AppliedOfferDtoToJson(AppliedOfferDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pathLogo': instance.pathLogo,
      'isCurrent': instance.isCurrent,
      'statusId': instance.statusId,
      'status': instance.status,
      'radius': instance.radius,
      'opportunitiesStrartTime': instance.opportunitiesStrartTime,
      'opportunitiesEndTime': instance.opportunitiesEndTime,
      'workingDate': instance.workingDate,
      'workingDateTime': instance.workingDateTime,
      'endWorkingDateTime': instance.endWorkingDateTime,
      'endWorkingDate': instance.endWorkingDate,
      'latitude': instance.latitude,
      'longtude': instance.longtude,
      'jobId': instance.jobId,
      'jobName': instance.jobName,
      'salary': instance.salary,
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'address': instance.address,
      'isFingerPrint': instance.isFingerPrint,
      'description': instance.description,
      'specializtion': instance.specializtion,
      'gender': instance.gender,
      'qualificationName': instance.qualificationName,
      'requiredCount': instance.requiredCount,
      'actualNumber': instance.actualNumber,
      'addressCompany': instance.addressCompany,
      'latitudeCompany': instance.latitudeCompany,
      'longtudeCompany': instance.longtudeCompany,
      'listJobUniForm': instance.listJobUniForm,
      'notes': instance.notes,
      'allowFaceRecognition': instance.allowFaceRecognition,
      'deservedAmount': instance.deservedAmount,
      'totalDeductions': instance.totalDeductions,
      'deductions': instance.deductionsDto,
      'attendanceConfig': instance.attendanceConfigDto,
      'conditionName': instance.conditionName,
      'isAllowToTrack': instance.isAllowToTrack,
    };
