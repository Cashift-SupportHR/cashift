import 'package:json_annotation/json_annotation.dart';

part 'job_filter_data.g.dart';
@JsonSerializable(ignoreUnannotated: false)
class JobFilterData {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'logo')
  String? logo;

  JobFilterData({this.id, this.name, this.logo});

  factory JobFilterData.fromJson(Map<String, dynamic> json) =>
      _$JobFilterDataFromJson(json);

  Map<String, dynamic> toJson() => _$JobFilterDataToJson(this);
}
