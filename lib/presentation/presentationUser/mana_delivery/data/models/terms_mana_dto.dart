import 'package:json_annotation/json_annotation.dart';

part 'terms_mana_dto.g.dart';

@JsonSerializable()
class TermsManaDto {
  @JsonKey(name: "termsType")
  final int? termsType;
  @JsonKey(name: "termsVersion")
  final String? termsVersion;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "content")
  final String? content;
  @JsonKey(name: "lastUpdated")
  final String? lastUpdated;

  TermsManaDto ({
    this.termsType,
    this.termsVersion,
    this.title,
    this.content,
    this.lastUpdated,
  });

  factory TermsManaDto.fromJson(Map<String, dynamic> json) {
    return _$TermsManaDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TermsManaDtoToJson(this);
  }
}


