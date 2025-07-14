


import '../../data/models/pledge_generalization_dto.dart';

class PledgeGeneralization {
  int? id;
  String? logo;
  String? title;
  String? subTitle;
  String? clearanceText;
  String? statusText;
  String? clearanceDate;
  bool? hasAction;
  String? confirmMessage;

  PledgeGeneralization({this.id, this.logo, this.title, this.subTitle, this.clearanceText, this.statusText, this.clearanceDate, this.hasAction, this.confirmMessage});

   factory PledgeGeneralization.fromDto(PledgeGeneralizationDto json){
     return PledgeGeneralization(
       id: json.id,
       logo: json.logo,
       title: json.title,
       subTitle: json.subTitle,
       clearanceText: json.clearanceText,
       statusText: json.statusText,
       clearanceDate: json.clearanceDate,
       hasAction: json.hasAction,
         confirmMessage: json.confirmMessage,
     );
   }
}

