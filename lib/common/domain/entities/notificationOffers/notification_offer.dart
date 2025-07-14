
import 'package:shiftapp/common/data/models/notification_offers/list_payment.dart';

import '../../../data/models/notification_offers/job_requirements.dart';
import '../../../data/models/notification_offers/notification_offer_dto.dart';


class NotificationOffer {
  final int? id;
  final int? companyId;
  final int? jobId;
  final int? cityId;
  final String? strartTime;
  final String? opportunitiesStrartTime;
  final String? opportunitiesEndTime;
  final double? latitude;
  final double? longtude;
  final String? jobName;
  final double? salary;
  final int? hourSalary;
  final String? workingDate;
  final String? workingDateTime;
  final String? endWorkingDateTime;
  final int? projectId;
  final String? projectName;
  final String? projectAddress;
  final JobRequirements? jobRequirements;
  final String? radius;
  final String? qualificationName;
  final int? flagType;
  final String? description;
  final String? isFingerPrint;
  final int? totalRequiredCount;
  final int? requiredCount;
  final int? reserveNumber;
  final bool? isApprove;
  final int? countOfApply;
  final String? pathLogo;
  final int? actualNumber;
  final String? endShiftDate;
  final double? avg;
  final String? projectLogo;
  final String? jobLogo;
  final bool? isShowBackGroundOpportunty;
  final List<ListPayment>? listPayment;


  NotificationOffer({
    this.id,
    this.companyId,
    this.jobId,
    this.cityId,
    this.strartTime,
    this.opportunitiesStrartTime,
    this.opportunitiesEndTime,
    this.latitude,
    this.longtude,
    this.jobName,
    this.salary,
    this.hourSalary,
    this.workingDate,
    this.workingDateTime,
    this.endWorkingDateTime,
    this.projectId,
    this.projectName,
    this.projectAddress,
    this.jobRequirements,
    this.radius,
    this.qualificationName,
    this.flagType,
    this.description,
    this.isFingerPrint,
    this.totalRequiredCount,
    this.requiredCount,
    this.reserveNumber,
    this.isApprove,
    this.countOfApply,
    this.pathLogo,
    this.actualNumber,
    this.endShiftDate,
    this.avg,
    this.projectLogo,
    this.jobLogo,
    this.isShowBackGroundOpportunty,
    this.listPayment,
  });


  factory NotificationOffer.fromDto(NotificationOfferDto json) {
    return NotificationOffer(
      id: json.id,
      companyId: json.companyId,
      jobId: json.jobId,
      cityId: json.cityId,
      strartTime: json.startTime,
      opportunitiesStrartTime: json.opportunitiesStartTime,
      opportunitiesEndTime: json.opportunitiesEndTime,
      latitude: json.latitude,
      longtude: json.longitude,
      jobName: json.jobName,
      salary: json.salary,
      hourSalary: json.hourSalary,
      workingDate: json.workingDate,
      workingDateTime: json.workingDateTime,
      endWorkingDateTime: json.endWorkingDateTime,
      projectId: json.projectId,
      projectName: json.projectName,
      projectAddress: json.projectAddress,
      jobRequirements: json.jobRequirements,
      radius: json.radius,
      qualificationName: json.qualificationName,
      flagType: json.flagType,
      description: json.description,
      isFingerPrint: json.isFingerPrint,
      totalRequiredCount: json.totalRequiredCount,
      requiredCount: json.requiredCount,
      reserveNumber: json.reserveNumber,
      isApprove: json.isApprove,
      countOfApply: json.countOfApply,
      pathLogo: json.pathLogo,
      actualNumber: json.actualNumber,
      endShiftDate: json.endShiftDate,
      avg: json.avg,
      projectLogo: json.projectLogo,
      jobLogo: json.jobLogo,
      isShowBackGroundOpportunty: json.isShowBackGroundOpportunity,
      listPayment: json.listPayment,
    );
  }
}
