import '../../../../../common/domain/entities/shared/date_formatter.dart';
import '../../data/models/follow_up_violation_dto.dart';

class FollowUpViolation {
  int? violationId;
  String? violationType;
  String? companyName;
  String? dateOfViolationApplying;
  String? time;
  String? streetName;
  String? details;
  List<String>? imagesPath;
  String? adminAction;
  String? shiftAdminAction;
  String? importantLevel;
  bool? allowEdit;

  FollowUpViolation({
    this.violationId,
    this.violationType,
    this.companyName,
    this.dateOfViolationApplying,
    this.time,
    this.streetName,
    this.details,
    this.imagesPath,
    this.adminAction,
    this.shiftAdminAction,
    this.importantLevel,
    this.allowEdit,
  });

  factory FollowUpViolation.fromDto(FollowUpViolationDto dto) => FollowUpViolation(
    violationId: dto.violationId,
    violationType: dto.violationType,
    companyName: dto.companyName,
    dateOfViolationApplying: dto.dateOfViolationApplying,
    time: dto.time,
    streetName: dto.streetName,
    details: dto.details,
    imagesPath: dto.imagesPath,
    adminAction: dto.adminAction,
    shiftAdminAction: dto.shiftAdminAction,
    importantLevel: dto.importantLevel,
    allowEdit: dto.allowEdit,
  );

  static List<FollowUpViolation> fromDtoList(List<FollowUpViolationDto> dtos) =>
      dtos.map((dto) => FollowUpViolation.fromDto(dto)).toList();


  String get getSubmissionDate =>
      DateFormatter.repairApiDate(
          '${dateOfViolationApplying ?? ''} $time', apiPattern: DateFormatter.TIME_STAMP);
}
