import 'package:json_annotation/json_annotation.dart';
import 'package:shiftapp/data/datasources/remote/remote_constants.dart';

part 'user.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class User {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'name')
    String? name;
  @JsonKey(name: 'profileImagePath')
    String? profileImagePath;
  @JsonKey(name: 'isCompeleteProfile')
    bool? isCompeleteProfile;
  @JsonKey(name: 'phone')
  final  String? phone;
  @JsonKey(name: 'token')
    String? token;

  @JsonKey(name: 'refreshToken')
  String? refreshToken;

  @JsonKey(name: 'tokenExpiresAt')
  DateTime? tokenExpiresAt;

  @JsonKey(name: 'refreshTokenExpiresAt')
  DateTime? refreshTokenExpiresAt;

  @JsonKey(name: 'isAdmin')
  bool? isAdmin;

  User({
    this.id,
    this.name,
    this.profileImagePath,
    this.isCompeleteProfile,
    this.phone,
    this.token,
    this.refreshToken,
    this.tokenExpiresAt,
    this.refreshTokenExpiresAt,
    this.isAdmin,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String getImagePath(){
    return '$kSERVER_URL$profileImagePath';
  }
}
