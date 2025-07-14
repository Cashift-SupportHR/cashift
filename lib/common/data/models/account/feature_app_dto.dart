

import 'package:json_annotation/json_annotation.dart';

part 'feature_app_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class FeatureAppDto {
  @JsonKey(name: 'id')
  final  int id;
  @JsonKey(name: 'name')
  final  String name;
  @JsonKey(name: 'code')
  final  String code;
  @JsonKey(name: 'status')
  final  bool status;
  @JsonKey(name: 'faceRecognitionConfig')
  FaceRecognitionConfig?  faceRecognitionConfig;

  FeatureAppDto({  this.faceRecognitionConfig,required this.id, required this.name, required this.code, required this.status});

  factory FeatureAppDto.fromJson(Map<String, dynamic> json) => _$FeatureAppDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureAppDtoToJson(this);

}

@JsonSerializable(ignoreUnannotated: false)
class FaceRecognitionConfig {
  @JsonKey(name: 'isAllowFaceRecognition')
  bool? isAllowFaceRecognition;
  @JsonKey(name: 'eyeCheck')
  bool? eyeCheck;
  @JsonKey(name: 'moveFace')
  bool? moveFace;
  @JsonKey(name: 'smile')
  bool? smile;

  FaceRecognitionConfig({this.isAllowFaceRecognition, this.eyeCheck, this.moveFace, this.smile});

  factory FaceRecognitionConfig.fromJson(Map<String, dynamic> json) => _$FaceRecognitionConfigFromJson(json);

  Map<String, dynamic> toJson() => _$FaceRecognitionConfigToJson(this);
}
