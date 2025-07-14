
class AddressHomeDialogDto {
  String? logo;
  String? mainText;
  String? description;

  AddressHomeDialogDto({this.logo, this.mainText, this.description});

   factory AddressHomeDialogDto.fromJson(Map<String, dynamic> json) => AddressHomeDialogDto(
        logo: json['logo'],
        mainText: json['mainText'],
        description: json['description'],
      );
}

