import 'package:flutter/cupertino.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';

import '../../../../../main_index.dart';
import '../../data/models/track_attendance_departure_dto.dart';

class TrackAttendanceDeparture {
  int? id;
  String? startDate;
  String? endDate;
  String? status;
  int? freelancerId;
  String? freelancerName;
  String? freelancerPhone;

  TrackAttendanceDeparture(
      {this.id,
      this.startDate,
      this.endDate,
      this.status,
      this.freelancerId,
      this.freelancerName,
      this.freelancerPhone});

  factory TrackAttendanceDeparture.fromDtp(TrackAttendanceDepartureDto json) {
    return TrackAttendanceDeparture(
      id: json.id,
      startDate: json.startDate,
      endDate: json.endDate,
      status: json.status,
      freelancerId: json.freelancerId,
      freelancerName: json.freelancerName,
      freelancerPhone: json.freelancerPhone,
    );
  }

  static List<TrackAttendanceDeparture> fromListDto(
      List<TrackAttendanceDepartureDto> json) {
    return json.map((e) => TrackAttendanceDeparture.fromDtp(e)).toList();
  }

  String dateRange (
      AppLocalizations strings) =>'${strings.from} ${formatDate(startDate ?? '')} ${strings.to} ${formatDate(endDate ?? '')}';

  String formatDate(String date) => DateFormatter.repairApiDate(date, apiPattern: DateFormatter.DATE_TIME_API, pattern: DateFormatter.DATE_D_MMM_YYYY);
}
