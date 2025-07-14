import '../../../../../common/domain/entities/shared/date_formatter.dart';
import '../../data/models/request_attendance_departure_details_dto.dart';

class TrackFaceRecognitionDetailsList {
  TrackFaceRecognitionDetailsList({
      this.id, 
      this.trackFaceRecognitionRequestId, 
      this.faceRecognitionPath, 
      this.projectId, 
      this.projectName, 
      this.shiftId, 
      this.shiftName, 
      this.addedDate, 
      this.status, 
      this.notes,});

  int? id;
  int? trackFaceRecognitionRequestId;
  String? faceRecognitionPath;
  int? projectId;
  String? projectName;
  int? shiftId;
  String? shiftName;
  String? addedDate;
  String? status;
  String? notes;

  factory TrackFaceRecognitionDetailsList.fromDto(
      TrackFaceRecognitionDetailsListDto json) =>
      TrackFaceRecognitionDetailsList(
        id: json.id,
        trackFaceRecognitionRequestId: json.trackFaceRecognitionRequestId,
        faceRecognitionPath: json.faceRecognitionPath,
        addedDate: json.addedDate,
        projectId: json.projectId,
        projectName: json.projectName,
        shiftId: json.shiftId,
        shiftName: json.shiftName,
        status: json.status,
        notes: json.notes,

      );



  String get dateFormat => DateFormatter.repairApiDate(addedDate ?? '', apiPattern: DateFormatter.TIME_STAMP, pattern: DateFormatter.DATE_D_MMM_YYYY);
  String get timeFormat => DateFormatter.repairApiDate(addedDate ?? '', apiPattern: DateFormatter.TIME_STAMP, pattern: DateFormatter.TIME_UI);


}