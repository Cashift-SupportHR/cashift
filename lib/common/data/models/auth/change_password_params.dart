import 'package:json_annotation/json_annotation.dart';

part 'change_password_params.g.dart';
// /
@JsonSerializable(ignoreUnannotated: false)
class ChangePasswordParams {
  @JsonKey(name: 'oldPassword')
  String? oldPassword;
  @JsonKey(name: 'newPassword')
  String? newPassword;

  ChangePasswordParams({this.oldPassword, this.newPassword});

  factory ChangePasswordParams.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordParamsToJson(this);
}
