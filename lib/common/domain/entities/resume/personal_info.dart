class PersonalInfo{
  final String? name ;
  final String? email ;
  final String? birthdate ;
  final String? hBirthdate ;
  final String? idNumber ;
  final bool isMale;
  final int ? cityId ;
  final bool ? isHijri ;
  final int? length;
  final int? weight;
  final int? districtId;

  PersonalInfo({  this.name, this.email , this.hBirthdate ,  this.birthdate,  this.idNumber, required this.isMale ,
   this.cityId ,this.isHijri, this.length, this.weight, this.districtId});

  String normalizeDate(){
    return birthdate??'' ;
  }
}