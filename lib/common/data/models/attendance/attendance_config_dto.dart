import 'package:json_annotation/json_annotation.dart'; 

part 'attendance_config_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AttendanceConfigDto {
  @JsonKey(name: 'moveFace')
  bool? moveFace;
  @JsonKey(name: 'location')
  bool? location;
  @JsonKey(name: 'qrcode')
  bool? qrcode;
  @JsonKey(name: 'eyeCheck')
  bool? eyeCheck;
  @JsonKey(name: 'smile')
  bool? smile;
  @JsonKey(name: 'isDirectDetectFace', includeToJson: false, includeFromJson: false)
  bool? isDirectDetectFace;


  AttendanceConfigDto({this.moveFace, this.location,  this.qrcode, this.eyeCheck, this.smile, this.isDirectDetectFace});

   factory AttendanceConfigDto.fromJson(Map<String, dynamic> json) => _$AttendanceConfigDtoFromJson(json);

   Map<String, dynamic> toJson() => _$AttendanceConfigDtoToJson(this);
}

