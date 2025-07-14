import 'package:json_annotation/json_annotation.dart'; 

part 'logger_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class LoggerParams {
  @JsonKey(name: 'tagName')
  final  String? tagName;
  @JsonKey(name: 'phoneNumber')
    String? phoneNumber;
  @JsonKey(name: 'error')
  final  String? error;
  @JsonKey(name: 'object')
  final  String? object;
  @JsonKey(name: 'description')
  final  String? description;

  LoggerParams({this.tagName, this.phoneNumber, this.error, this.object, this.description});

  factory LoggerParams.fromJson(Map<String, dynamic> json) => _$LoggerParamsFromJson(json);

  Map<String, dynamic> toJson() => _$LoggerParamsToJson(this);
}

