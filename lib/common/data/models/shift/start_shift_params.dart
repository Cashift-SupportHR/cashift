import 'package:json_annotation/json_annotation.dart'; 

import '../../../../common/domain/entities/attendance/attendance_query.dart';

part 'start_shift_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class StartShiftParams {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'startTimeLatitude')
  final  String? startTimeLatitude;
  @JsonKey(name: 'startTimeLongtude')
  final  String? startTimeLongtude;
  @JsonKey(name: 'projectId')
  final  String? projectId;
  @JsonKey(name: 'isMock')
  final  bool? isMock;



  StartShiftParams({this.id, this.startTimeLatitude, this.startTimeLongtude ,this.projectId,this.isMock});

  factory StartShiftParams.fromJson(Map<String, dynamic> json) => _$StartShiftParamsFromJson(json);

  Map<String, dynamic> toJson() => _$StartShiftParamsToJson(this);
}

