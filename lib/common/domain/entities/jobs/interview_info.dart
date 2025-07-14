import 'package:json_annotation/json_annotation.dart'; 

part 'interview_info.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class InterviewInfo {
  @JsonKey(name: 'cityName')
  String? cityName;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'latitude')
  double? latitude;
  @JsonKey(name: 'longtude')
  double? longtude;
  @JsonKey(name: 'timesOfWork')
  String? timesOfWork;
  @JsonKey(name: 'workDays')
  String? workDays;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'companyName')
  String? companyName;
  @JsonKey(name: 'companyLogo')
  String? companyLogo;

  InterviewInfo({this.cityName, this.name, this.phone, this.address, this.latitude, this.longtude, this.timesOfWork, this.workDays, this.description, this.email, this.companyName, this.companyLogo});

   factory InterviewInfo.fromJson(Map<String, dynamic> json) => _$InterviewInfoFromJson(json);

   Map<String, dynamic> toJson() => _$InterviewInfoToJson(this);
}

