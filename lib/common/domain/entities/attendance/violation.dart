import 'package:json_annotation/json_annotation.dart'; 

part 'violation.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class Violation {
  @JsonKey(name: 'violationName')
  final  String? violationName;
  @JsonKey(name: 'violationDescription')
  final  String? violationDescription;
  @JsonKey(name: 'violationDate')
  final  String? violationDate;
  @JsonKey(name: 'violationRepeated')
  final  String? violationRepeated;

  Violation({this.violationName, this.violationDescription, this.violationDate, this.violationRepeated});

   factory Violation.fromJson(Map<String, dynamic> json) => _$ViolationFromJson(json);

   Map<String, dynamic> toJson() => _$ViolationToJson(this);
}

