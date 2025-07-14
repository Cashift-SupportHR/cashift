

import '../../data/models/employee_certificate_dto.dart';

class EmployeeCertificate {
  int? id;
  String? titleHead;
  String? logoHead;
  String? name;
  String? birthDate;
  String? logo;
  String? logoUser;

  EmployeeCertificate({this.id, this.titleHead, this.logoHead, this.name, this.birthDate, this.logo, this.logoUser});

   factory EmployeeCertificate.fromDto(EmployeeCertificateDto json){
     return EmployeeCertificate(
       id: json.id,
       titleHead: json.titleHead,
       logoHead: json.logoHead,
       name: json.name,
       birthDate: json.birthDate,
       logo: json.logo,
       logoUser: json.logoUser
     );
   }
}

