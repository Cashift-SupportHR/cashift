
import '../../../data/models/workerWorkPlaces/index.dart';

class FocusPointInfo {
  String? freelanceName;
  String? projectName;
  String? date;
  String? shiftName;
  String? startShift;
  String? endShift;

  FocusPointInfo(
      {this.freelanceName,
      this.projectName,
      this.date,
      this.shiftName,
      this.startShift,
      this.endShift});

  factory FocusPointInfo.fromDto(FocusPointInfoDto json) {
    return FocusPointInfo(
      freelanceName: json.freelanceName,
      projectName: json.projectName,
      date: json.date,
      shiftName: json.shiftName,
      startShift: json.startShift,
      endShift: json.endShift,
    );
  }
}
