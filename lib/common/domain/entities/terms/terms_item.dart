import 'package:json_annotation/json_annotation.dart'; 

part 'terms_item.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class TermsItem {
  @JsonKey(name: 'conditionName')
  final  String? conditionName;

  TermsItem({ this.conditionName});

  factory TermsItem.fromJson(Map<String, dynamic> json) => _$TermsItemFromJson(json);

  Map<String, dynamic> toJson() => _$TermsItemToJson(this);
}

