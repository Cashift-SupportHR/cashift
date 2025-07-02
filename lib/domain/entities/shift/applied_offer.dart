import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/domain/entities/appliedOffers/opportunities_status.dart';
import 'package:shiftapp/domain/entities/shift/applied_offer_dto.dart';
import 'package:shiftapp/core/extensions/extensions.dart';

import '../../../data/models/attendance/attendance_config_dto.dart';
import 'deductions_dto.dart';

class AppliedOffer extends AppliedOfferDto {
  static const CONTROLLER_TYPE_NORMAL = "NORAML";
  static const CONTROLLER_TYPE_QR = "QRCODE";

  AppliedOffer({
    int? id,
    String? pathLogo,
    int? isCurrent,
    int? statusId,
    String? status,
    String? radius,
    String? opportunitiesStrartTime,
    String? opportunitiesEndTime,
    String? workingDate,
    String? workingDateTime,
    String? endWorkingDateTime,
    String? endWorkingDate,
    double? latitude,
    double? longtude,
    int? jobId,
    String? jobName,
    int? salary,
    String? projectId,
    String? projectName,
    String? address,
    String? isFingerPrint,
    int? startAllowMinutes,
    int? endAllowMinutes,
    String? description,
    String? specializtion,
    String? gender,
    String? qualificationName,
    int? requiredCount,
    int? actualNumber,
    String? addressCompany,
    double? latitudeCompany,
    double? longtudeCompany,
    List<String>? listJobUniForm,
    String? notes,
    bool? allowFaceRecognition,
    List<Deduction>? deductionsDto,
    List<String>? conditionName,
    num? totalDeductions,
    num? deservedAmount,
    AttendanceConfigDto? attendanceConfigDto,
  }) : super(
          id: id,
          pathLogo: pathLogo,
          deductionsDto: deductionsDto,
          deservedAmount: deservedAmount,
          totalDeductions: totalDeductions,
          isCurrent: isCurrent,
          statusId: statusId,
          status: status,
          radius: radius,
          opportunitiesStrartTime: opportunitiesStrartTime,
          opportunitiesEndTime: opportunitiesEndTime,
          workingDate: workingDate,
          workingDateTime: workingDateTime,
          endWorkingDateTime: endWorkingDateTime,
          endWorkingDate: endWorkingDate,
          latitude: latitude,
          longtude: longtude,
          jobId: jobId,
          jobName: jobName,
          salary: salary,
          projectId: projectId,
          projectName: projectName,
          address: address,
          isFingerPrint: isFingerPrint,
          description: description,
          specializtion: specializtion,
          gender: gender,
          qualificationName: qualificationName,
          requiredCount: requiredCount,
          actualNumber: actualNumber,
          addressCompany: addressCompany,
          latitudeCompany: latitudeCompany,
          longtudeCompany: longtudeCompany,
          listJobUniForm: listJobUniForm,
          notes: notes,
          conditionName: conditionName,
          allowFaceRecognition: allowFaceRecognition,
          attendanceConfigDto: attendanceConfigDto,
        );

  String startTime() {
    return workingDateTime != null
        ? DateFormatter.timeStampToTime(workingDateTime!)
        : '';
  }

  String finishTime() {
    return endWorkingDateTime != null
        ? DateFormatter.timeStampToTime(endWorkingDateTime!)
        : '';
  }

  DateTime? finishedDateTime() {
    try {
      final date = DateFormatter.dateFromTimeStamp(endWorkingDateTime);
      return date;
    } catch (e) {
      return null;
    }
  }

  String finishedDateTimeString() {
    try {
      final date = DateFormatter.formatDate(
          finishedDateTime()!, DateFormatter.DATE_TIME_UI);
      return date;
    } catch (e) {
      return '';
    }
  }

  String startDateTimeString() {
    try {
      final date =
          DateFormatter.formatDate(startDateTime(), DateFormatter.DATE_TIME_UI);
      return date;
    } catch (e) {
      return '';
    }
  }

  DateTime startDateTime() {
    DateTime date = DateFormatter.dateFromTimeStamp(workingDateTime);
    return date;
  }

  int? remainingTimeFinish() {
    // finishedDateTime();
    if (endWorkingDateTime?.isNullOrEmpty() == true) {
      return null;
    }
    final date = finishedDateTime();
    return date != null ? DateFormatter.differenceNowBySecond(date) : null;
  }

  String? workingHoursCount() {
    // finishedDateTime();
    if (endWorkingDateTime?.isNullOrEmpty() == true) {
      return null;
    }
    if (workingDateTime?.isNullOrEmpty() == true) {
      return null;
    }
    final end = finishedDateTime()!;
    final start = startDateTime();
    return DateFormatter.differenceTwoDatesByHours(start, end).toString();
  }

  String workingDateString() {
    return DateFormatter.repairApiDate(workingDate ?? '');
  }

  String endDateString() {
    return DateFormatter.repairApiDate(endWorkingDate ?? '');
  }

  bool isExpireTime() {
    return remainingTimeFinish() != null && remainingTimeFinish()! >= 1;
  }

  bool requiredQr() {
    return isFingerPrint == CONTROLLER_TYPE_QR;
  }

  bool isAccept() {
    return statusId == OpportunitiesStatus.Accept.index || isConfirm();
  }

  bool isConfirm() {
    return statusId == 32;
  }

  bool isStarted() {
    return statusId == OpportunitiesStatus.Start.index;
  }

  bool isPending() {
    return statusId == OpportunitiesStatus.Pending.index;
  }

  bool ableToAttendance() {
    return isStarted() || isAccept();
  }

  bool eligibleToFaceRecognition() {
    return attendanceConfigDto !=null ;
  }

  bool ableToCancel() {
    print('ableToCancel $status $statusId');
    return statusId != OpportunitiesStatus.Complete.index &&
        statusId != OpportunitiesStatus.Start.index &&
        statusId != OpportunitiesStatus.Reject.index &&
        statusId != OpportunitiesStatus.Absence.index &&
        statusId != 25

        ///لم يتم قبول الطلب 25
        &&
        statusId != 32 &&
        statusId != 17

        ///shift have been cancelled
        &&
        statusId != OpportunitiesStatus.StartNotComplete.index;
  }

  LatLng location() {
    return LatLng(latitude ?? 0.0, longtude ?? 0.0);
  }

  String logo() => pathLogo ?? '';
}
