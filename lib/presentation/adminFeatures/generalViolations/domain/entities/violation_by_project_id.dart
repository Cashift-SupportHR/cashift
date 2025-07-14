import 'package:shiftapp/common/components/index.dart';

import '../../data/models/violation_by_project_id_dto.dart';

class ViolationByProjectId {
  int? id;
  String? name;
  num? violationAmount;
  int? scheduleViolationsTypeId;
  String? scheduleViolationsTypeName;
  String? scheduleViolationsTypeCode;

  ViolationByProjectId(
      {this.id,
      this.name,
      this.violationAmount,
      this.scheduleViolationsTypeId,
      this.scheduleViolationsTypeName,
      this.scheduleViolationsTypeCode});

  factory ViolationByProjectId.fromDto(ViolationByProjectIdDto json) =>
      ViolationByProjectId(
        id: json.id,
        name: json.name,
        violationAmount: json.violationAmount,
        scheduleViolationsTypeId: json.scheduleViolationsTypeId,
        scheduleViolationsTypeName: json.scheduleViolationsTypeName,
        scheduleViolationsTypeCode: json.scheduleViolationsTypeCode,
      );

  static List<ViolationByProjectId> fromListDto(
          List<ViolationByProjectIdDto> json) =>
      json.map((e) => ViolationByProjectId.fromDto(e)).toList();

  static List<Item> toItemsListPicker(List<ViolationByProjectId> items) =>
      items
          .map((e) => Item(
                value: e.name.toString(),
                index: e.id ?? 0,
                code: e.scheduleViolationsTypeCode ?? '',
        description: e.violationAmount?.toString() ?? '0.0',
              ))
          .toList();
}
