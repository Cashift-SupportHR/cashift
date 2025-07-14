import 'package:json_annotation/json_annotation.dart';

part 'absencenotice.g.dart';

/*

 "requestDate": "string",
      "absenceId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "notes": "string"
 */

@JsonSerializable(ignoreUnannotated: false)
class AbsenceDateParams {
  @JsonKey(name: 'requestDate')
  final  String? requestDate;
  @JsonKey(name: 'absenceId')
  final  String? absenceId;
  @JsonKey(name: 'notes')
  final  String? notes;

  factory AbsenceDateParams.fromJson(Map<String, dynamic> json) => _$AbsenceDateParamsFromJson(json);

  AbsenceDateParams(this.requestDate, this.absenceId, this.notes, );

  Map<String, dynamic> toJson() => _$AbsenceDateParamsToJson(this);
}

