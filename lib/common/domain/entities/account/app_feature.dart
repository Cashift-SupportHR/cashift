import 'package:json_annotation/json_annotation.dart';

part 'app_feature.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class AppFeature {
  @JsonKey(name: 'bankAccountEnable')
  final  bool bankAccountEnable;
  @JsonKey(name: 'rateEnable')
  final  bool ?  rateEnable;
  @JsonKey(name: 'adminEnable')
  final  bool ?  adminEnable;
  @JsonKey(name: 'isAllowFaceRecognition')
  final  bool ?  isAllowFaceRecognition;


  AppFeature({required this.bankAccountEnable , required this.isAllowFaceRecognition ,    this.rateEnable,this.adminEnable});

  factory AppFeature.fromJson(Map<String, dynamic> json) => _$AppFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$AppFeatureToJson(this);
}




