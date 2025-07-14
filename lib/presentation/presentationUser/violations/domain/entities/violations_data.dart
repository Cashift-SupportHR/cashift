import 'package:json_annotation/json_annotation.dart';
import 'package:shiftapp/presentation/presentationUser/violations/data/models/violation_user_dto.dart';

import '../../data/models/violations_user_data_dto.dart';


@JsonSerializable(ignoreUnannotated: true)
class ViolationsData {
  String? description;
  List<ViolationUserDto>? apply;

  ViolationsData({this.description, this.apply});

   factory ViolationsData.fromDto(ViolationsUserDataDto json){
     return ViolationsData(
       description: json.description,
       apply: json.apply,
     );
   }
}

