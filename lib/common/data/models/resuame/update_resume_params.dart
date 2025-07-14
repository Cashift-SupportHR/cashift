import 'package:json_annotation/json_annotation.dart'; 

part 'update_resume_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class UpdateResumeParams {
  @JsonKey(name: 'id')
    int? id;
  @JsonKey(name: 'name')
    String? name;
  @JsonKey(name: 'cityId')
    int? cityId;
  @JsonKey(name: 'otherCity')
    String? otherCity;
  @JsonKey(name: 'idNumber')
    String? idNumber;
  @JsonKey(name: 'birthDate')
    String? birthDate;
  @JsonKey(name: 'englishLevel')
    int? englishLevel;
  @JsonKey(name: 'computerLevel')
    int? computerLevel;
  @JsonKey(name: 'email')
    String? email;
  @JsonKey(name: 'gender')
    bool? gender;
  @JsonKey(name: 'currentSituation')
    int? currentSituation;
  @JsonKey(name: 'qualificationData')
    int? qualificationData;
  @JsonKey(name: 'qualificationName')
    String? qualificationName;
  @JsonKey(name: 'listOfJob')
    List<int>? listOfJob;
  @JsonKey(name: 'isHijri')
    bool? isHijri;
  @JsonKey(name: 'length')
    int? length;
  @JsonKey(name: 'wieght')
  int? weight;
  @JsonKey(name: 'districtId')
  int? districtId;
  @JsonKey(name: 'favourateHours')
  int? favourateHours;
  @JsonKey(name: 'timeWorkId')
  int? timeWorkId;

  UpdateResumeParams({this.id, this.name, this.cityId, this.otherCity, this.idNumber, this.birthDate, this.englishLevel, this.computerLevel, this.email, this.gender, this.currentSituation, this.qualificationData, this.qualificationName, this.listOfJob ,this.isHijri, this.length, this.weight, this.districtId, this.favourateHours, this.timeWorkId});

  factory UpdateResumeParams.fromJson(Map<String, dynamic> json) => _$UpdateResumeParamsFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateResumeParamsToJson(this);
}

