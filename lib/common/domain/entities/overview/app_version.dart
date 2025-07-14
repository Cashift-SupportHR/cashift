import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
part 'app_version.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AppVersion {
  @JsonKey(name: 'androidVersoin')
  final  int? androidVersoin;
  @JsonKey(name: 'androidForceUpdate')
  final  bool? androidForceUpdate;
  @JsonKey(name: 'iosVersoin')
  final int ? iosVersoin;
  @JsonKey(name: 'iosForceUpdate')
  final  bool? iosForceUpdate;

  int? getVersion(){
    if(Platform.isAndroid){
      return androidVersoin ;
    }else{
      return iosVersoin;
    }
  }
  bool? isForceUpdate(){
    if(Platform.isAndroid){
      return androidForceUpdate ;
    }else{
      return iosForceUpdate;
    }
  }
  AppVersion({this.androidVersoin, this.androidForceUpdate, this.iosVersoin, this.iosForceUpdate});

  factory AppVersion.fromJson(Map<String, dynamic> json) => _$AppVersionFromJson(json);

  Map<String, dynamic> toJson() => _$AppVersionToJson(this);
}

