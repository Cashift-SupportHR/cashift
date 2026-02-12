import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class RefreshTokenParams {
  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  RefreshTokenParams({required this.refreshToken});

  factory RefreshTokenParams.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenParamsToJson(this);
}
