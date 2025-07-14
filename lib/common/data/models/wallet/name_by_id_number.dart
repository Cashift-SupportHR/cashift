import 'package:json_annotation/json_annotation.dart'; 

part 'name_by_id_number.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class NameByIdNumber {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;

  NameByIdNumber({this.name, this.phoneNumber});

   factory NameByIdNumber.fromJson(Map<String, dynamic> json) => _$NameByIdNumberFromJson(json);

   Map<String, dynamic> toJson() => _$NameByIdNumberToJson(this);
}

