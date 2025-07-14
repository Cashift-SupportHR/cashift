import 'package:json_annotation/json_annotation.dart'; 

part 'geofence_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class GeofenceDto {
  @JsonKey(name: 'latitude')
  String? latitude;
  @JsonKey(name: 'longtude')
  String? longtude;
  @JsonKey(name: 'radius')
  String? radius;
  @JsonKey(name: 'projectName')
  String? projectName;
  @JsonKey(name: 'isAutoAttendance')
  bool? isAutoAttendance;

  GeofenceDto({this.latitude, this.longtude, this.radius, this.projectName, this.isAutoAttendance});

   factory GeofenceDto.fromJson(Map<String, dynamic> json) => _$GeofenceDtoFromJson(json);

   Map<String, dynamic> toJson() => _$GeofenceDtoToJson(this);
}

