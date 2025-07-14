
import '../../../data/models/bail_requests/index.dart';

class BailTermAndCondition {
  int? id;
  String? conditionName;
  int? statusId;

  BailTermAndCondition({
    this.id,
    this.conditionName,
    this.statusId,
  });

  factory BailTermAndCondition.fromDto(BailTermAndConditionDto json) {
    return BailTermAndCondition(
      id: json.id,
      conditionName: json.conditionName,
      statusId: json.statusId,
    );
  }


}
