import 'package:json_annotation/json_annotation.dart'; 

part 'start_attendance_focus_point_params.g.dart'; 

@JsonSerializable(nullable: true, ignoreUnannotated: false)
class StartAttendanceFocusPointParams {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'focusPointId')
  String? focusPointId;
  @JsonKey(name: 'latitude')
  String? latitude;
  @JsonKey(name: 'longtude')
  String? longtude;

  StartAttendanceFocusPointParams({this.id, this.focusPointId, this.latitude, this.longtude});

   factory StartAttendanceFocusPointParams.fromJson(Map<String, dynamic> json) => _$StartAttendanceFocusPointParamsFromJson(json);

   Map<String, dynamic> toJson() => _$StartAttendanceFocusPointParamsToJson(this);
}

