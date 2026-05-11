import 'package:json_annotation/json_annotation.dart';

part 'penalty_warning_dto.g.dart';

@JsonSerializable()
class PenaltyWarningDto {
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "severity")
  final String? severity;
  @JsonKey(name: "confirmButtonText")
  final String? confirmButtonText;
  @JsonKey(name: "cancelButtonText")
  final String? cancelButtonText;

  PenaltyWarningDto ({
    this.title,
    this.message,
    this.severity,
    this.confirmButtonText,
    this.cancelButtonText,
  });

  factory PenaltyWarningDto.fromJson(Map<String, dynamic> json) {
    return _$PenaltyWarningDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PenaltyWarningDtoToJson(this);
  }
}


