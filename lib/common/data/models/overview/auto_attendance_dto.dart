import 'package:json_annotation/json_annotation.dart'; 

part 'auto_attendance_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class AutoAttendanceDto {
  @JsonKey(name: 'latitude')
  String? latitude;
  @JsonKey(name: 'longtude')
  String? longtude;
  @JsonKey(name: 'typeAttendance')
  int? typeAttendance;

  AutoAttendanceDto({this.latitude, this.longtude, this.typeAttendance});

   factory AutoAttendanceDto.fromJson(Map<String, dynamic> json) => _$AutoAttendanceDtoFromJson(json);

   Map<String, dynamic> toJson() => _$AutoAttendanceDtoToJson(this);
}

