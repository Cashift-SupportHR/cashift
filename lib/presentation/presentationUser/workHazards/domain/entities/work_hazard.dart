import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';

import '../../data/models/index.dart';

class WorkHazard {
  int? id;
  String? hazardPriorityLevelName;
  int? hazardPriorityLevelId;
  String? hazardTypeName;
  int? hazardTypeId;
  String? hazardStatusName;
  int? projectId;
  String? projectName;
  int? companyId;
  String? companyName;
  int? shiftId;
  String? shiftName;
  String? description;
  String? submissionDate;
  List<WorkHazardImageDto>? hazardDocuments;

  WorkHazard({
    this.id,
    this.hazardPriorityLevelName,
    this.hazardPriorityLevelId,
    this.hazardTypeName,
    this.hazardTypeId,
    this.hazardStatusName,
    this.projectId,
    this.projectName,
    this.companyId,
    this.companyName,
    this.shiftId,
    this.shiftName,
    this.description,
    this.submissionDate,
    this.hazardDocuments,
  });

  factory WorkHazard.fromDto(WorkHazardDto json) => WorkHazard(
        id: json.id,
        hazardPriorityLevelName: json.hazardPriorityLevelName,
        hazardPriorityLevelId: json.hazardPriorityLevelId,
        hazardTypeName: json.hazardTypeName,
        hazardTypeId: json.hazardTypeId,
        hazardStatusName: json.hazardStatusName,
        projectId: json.projectId,
        projectName: json.projectName,
        companyId: json.companyId,
        companyName: json.companyName,
        shiftId: json.shiftId,
        shiftName: json.shiftName,
        description: json.description,
        submissionDate: json.submissionDate,
        hazardDocuments: json.hazardDocuments,
      );

  static fromListDto(List<WorkHazardDto> json) {
    return json.map((e) => WorkHazard.fromDto(e)).toList();
  }

  String get getSubmissionDate =>
      DateFormatter.repairApiDate(submissionDate ?? '', apiPattern: DateFormatter.TIME_STAMP);

  List<String> get getImages => hazardDocuments?.map((e) => e.path ?? '').toList() ?? [];
}
