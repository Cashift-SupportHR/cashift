import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';

import '../../data/models/track_attendance_departure_image_dto.dart';

class TrackAttendanceDepartureImage {
  int? id;
  int? trackFaceRecognitionRequestId;
  String? faceRecognitionPath;
  String? addedDate;

  TrackAttendanceDepartureImage(
      {this.id,
      this.trackFaceRecognitionRequestId,
      this.faceRecognitionPath,
      this.addedDate});

  factory TrackAttendanceDepartureImage.fromDto(
          TrackAttendanceDepartureImageDto json) =>
      TrackAttendanceDepartureImage(
        id: json.id,
        trackFaceRecognitionRequestId: json.trackFaceRecognitionRequestId,
        faceRecognitionPath: json.faceRecognitionPath,
        addedDate: json.addedDate,
      );

  static List<TrackAttendanceDepartureImage> fromListDto(
          List<TrackAttendanceDepartureImageDto> json) =>
      json.map((e) => TrackAttendanceDepartureImage.fromDto(e)).toList();


  String get dateFormat => DateFormatter.repairApiDate(addedDate ?? '', apiPattern: DateFormatter.TIME_STAMP, pattern: DateFormatter.DATE_D_MMM_YYYY);
  String get timeFormat => DateFormatter.repairApiDate(addedDate ?? '', apiPattern: DateFormatter.TIME_STAMP, pattern: DateFormatter.TIME_UI);


}
