
import 'package:json_annotation/json_annotation.dart';

part 'company_filter_data.g.dart';
@JsonSerializable(ignoreUnannotated: false)
class CompanyFilterData {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'logo')
  String? logo;

  CompanyFilterData({this.id, this.name, this.logo});

  factory CompanyFilterData.fromJson(Map<String, dynamic> json) => _$CompanyFilterDataFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyFilterDataToJson(this);
}
