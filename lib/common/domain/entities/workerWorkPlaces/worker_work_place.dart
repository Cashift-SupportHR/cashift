
import '../../../data/models/workerWorkPlaces/index.dart';

class WorkerWorkPlace {
  final int? id;
  final String? typeFreeLance;
  final String? deviceName;
  final String? focusPointTypeName;
  final String? focusPointsTransactionName;
  final String? focusPointName;
  final String? freelanceName;
  final String? startShift;
  final String? endShift;
  final String? images;
  final dynamic statusName;
  final dynamic statusColor;
  final List<String>? focusPointTermAndCondition;
  final List<String>? focusPointTypeTermAndCondition;
  final bool? isBreak;
  final int? status;
  final bool? isStart;
  final String? startShiftDateTime;
final String? endShiftDateTime;

  WorkerWorkPlace({ this.id,
    this.typeFreeLance,
    this.deviceName,
    this.focusPointTypeName,
    this.focusPointsTransactionName,
    this.focusPointName,
    this.freelanceName,
    this.startShift,
    this.endShift,
    this.images,
    this.statusName,
    this.statusColor,
    this.focusPointTermAndCondition,
    this.focusPointTypeTermAndCondition,
    this.isBreak,
    this.status,
    this.isStart,
    this.startShiftDateTime,
    this.endShiftDateTime,
  });

  factory WorkerWorkPlace.fromDto(WorkerWorkPlaceDto json) {
    return WorkerWorkPlace(
id: json.id,
      typeFreeLance: json.typeFreeLance,
      deviceName: json.deviceName,
      focusPointTypeName: json.focusPointTypeName,
      focusPointsTransactionName: json.focusPointsTransactionName,
      focusPointName: json.focusPointName,
      freelanceName: json.freelanceName,
      startShift: json.startShift,
      endShift: json.endShift,
      images: json.images,
      statusName: json.statusName,
      statusColor: json.statusColor,
      focusPointTermAndCondition: json.focusPointTermandCondition,
      focusPointTypeTermAndCondition: json.focusPointTypeTermandCondition,
      isBreak: json.isBreak,
      status: json.status,
      isStart: json.isStart,
      startShiftDateTime: json.startShiftDateTime,
      endShiftDateTime: json.endShiftDateTime,
    );
  }
}

