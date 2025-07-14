import 'package:json_annotation/json_annotation.dart'; 

part 'check_app_version_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CheckAppVersionParams {
  @JsonKey(name: 'versionCode')
  final  String? versionCode;
  @JsonKey(name: 'platform')
  final  String? platform;

  CheckAppVersionParams({this.versionCode, this.platform});

  factory CheckAppVersionParams.fromJson(Map<String, dynamic> json) => _$CheckAppVersionParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CheckAppVersionParamsToJson(this);
}

