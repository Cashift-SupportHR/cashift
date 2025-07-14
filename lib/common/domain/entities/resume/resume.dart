import 'package:json_annotation/json_annotation.dart';
import 'package:shiftapp/common/domain/entities/resume/job_item.dart';

part 'resume.g.dart';
/*  "phoneNumber": "string",
    "whatsAppNumber": "string",
    "cityName": "string",
    "idNumber": "string",
    "birthDateString": "string",
    "qualificationName": "string",
    "length": 0,
    "wieght": 0,
    "englishLevelName": "string",
    "computerLevelName": "string",
    "idBank": "string",
    "gender": "string"*/
@JsonSerializable(ignoreUnannotated: false)
class Resume {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'phoneNumber')
  final  String? phoneNumber;
  @JsonKey(name: 'nameAr')
  final  String? name;
  @JsonKey(name: 'email')
  final  String? email;
  @JsonKey(name: 'whatsAppNumber')
  final  String? whatsAppNumber;
  @JsonKey(name: 'cityId')
  final  int? cityId;
  @JsonKey(name: 'cityName')
  String? cityName;
  @JsonKey(name: 'idNumber')
  final  String? idNumber;
  @JsonKey(name: 'birthDateString')
  final  String? birthDateString;
  @JsonKey(name: 'birthDateHijri')
  final  String? birthDateHijri;
  @JsonKey(name: 'qualificationData')
  final  int? qualificationId;
  @JsonKey(name: 'currentSituation')
  final  int? currentSituation;
  @JsonKey(name: 'qualificationDataName')
    String? qualificationDataName;
  @JsonKey(name: 'qualificationName')
    String? qualificationName;
  @JsonKey(name: 'length')
  final  int? length;
  @JsonKey(name: 'wieght')
  final  int? wieght;
  @JsonKey(name: 'englishLevelId')
  final  int? englishLevel;
  @JsonKey(name: 'computerLevelId')
  final  int? computerLevel;
  @JsonKey(name: 'englishLevelName')
  String? englishLevelName;
  @JsonKey(name: 'computerLevelName')
  String? computerLevelName;
  @JsonKey(name: 'idBank')
  final  String? idBank;
  @JsonKey(name: 'genderName')
    String? genderName;
  @JsonKey(name: 'gender')
  final   bool? gender;
  @JsonKey(name: 'listOfJob')
  final   List<JobItem>? jobs;

  @JsonKey(name: 'isHijri')
  final   bool? isHijri;
  @JsonKey(name: 'haveInterView')
  final   bool? haveInterView;
  @JsonKey(name: 'districtId')
  final int? districtId;
  @JsonKey(name: 'favourateHours')
  final int? favourateHours;
  @JsonKey(name: 'timeWorkId')
  final int? timeWorkId;

  bool isCompleted(){

    return idNumber!=null;
  }
  List<int> getFavoriteJobsIds(){
    return jobs!=null ?jobs!.map((e) => e.id!).toList():[];
  }
  Resume({this.id, this.phoneNumber, this.whatsAppNumber, this.cityId,this.birthDateHijri,this.idNumber, this.birthDateString, this.qualificationId, this.length, this.wieght, this.englishLevel, this.computerLevel, this.idBank ,this.gender , this.name , this.email,this.jobs,this.currentSituation,this.qualificationName , this.isHijri ,this.haveInterView, this.districtId, this.favourateHours, this.timeWorkId});

  factory Resume.fromJson(Map<String, dynamic> json) => _$ResumeFromJson(json);

  Map<String, dynamic> toJson() => _$ResumeToJson(this);
}

