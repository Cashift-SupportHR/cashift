import 'package:json_annotation/json_annotation.dart';

part 'car_terms_and_conditions_dto.g.dart';

@JsonSerializable()
class CarTermsAndConditionsDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "versionTag")
  final String? versionTag;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "content")
  final String? content;
  @JsonKey(name: "effectiveFromUtc")
  final String? effectiveFromUtc;
  @JsonKey(name: "effectiveToUtc")
  final String? effectiveToUtc;
  @JsonKey(name: "isActive")
  final bool? isActive;

  CarTermsAndConditionsDto ({
    this.id,
    this.versionTag,
    this.title,
    this.content,
    this.effectiveFromUtc,
    this.effectiveToUtc,
    this.isActive,
  });

  factory CarTermsAndConditionsDto.fromJson(Map<String, dynamic> json) {
    return _$CarTermsAndConditionsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CarTermsAndConditionsDtoToJson(this);
  }
}


