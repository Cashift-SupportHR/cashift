import 'package:json_annotation/json_annotation.dart';

part 'attendance_query.g.dart';
@JsonSerializable(ignoreUnannotated: false)
class AttendanceQuery {
  @JsonKey(name: 'latitude')
  final  double? latitude;
  @JsonKey(name: 'longtude')
  final  double? longitude;
  @JsonKey(name: 'projectId')
  final  String? projectId;
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'presentId')
  final  int? presentId;
  @JsonKey(name: 'isMock')
  final  bool? isMock;

  AttendanceQuery({this.latitude, this.longitude, this.projectId, this.id, this.presentId,this.isMock});

   factory AttendanceQuery.fromJson(Map<String, dynamic> json) => _$AttendanceQueryFromJson(json);

   Map<String, dynamic> toJson() => _$AttendanceQueryToJson(this);
}