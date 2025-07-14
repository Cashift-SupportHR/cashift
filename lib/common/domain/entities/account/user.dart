import 'package:json_annotation/json_annotation.dart';
import 'package:shiftapp/common/data/datasources/remote/remote_constants.dart';

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

  User({this.id, this.name, this.profileImagePath, this.isCompeleteProfile, this.phone, this.token});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String getImagePath(){
    return '$kSERVER_URL$profileImagePath';
  }
}

