import '../../../../../l10n/app_localizations.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../shared/components/texts/list_row_texts_icons_v2.dart';
import '../../data/models/vehicles_dto.dart';

/// id : 1
/// vehicleCode : "790f51fe-712b-418a-9ac4-df1e1daabb51"
/// model : "Corella"
/// yearOfManufacture : 2015
/// plateNumber : "asd 1"
/// licenseNumber : "123456"
/// licenseExpiryDate : "2025-05-01T00:00:00"
/// specifications : "Toyota Corella 2015"
/// vehicleImage : "https://cashift-my.sharepoint.com/personal/dcc_cashift_onmicrosoft_com/_layouts/15/download.aspx?UniqueId=f0728c10-2d8e-46c3-8815-f9243fa427f5&Translate=false&tempauth=v1.eyJzaXRlaWQiOiIwOTQ1MmNiYS00YWFjLTQxNjAtODkzMC0wMDVmZjcwY2U1ZDUiLCJhcHBfZGlzcGxheW5hbWUiOiJjbGVhcmFuY2VjZXJ0aWZpY2F0aW9uIiwiYXVkIjoiMDAwMDAwMDMtMDAwMC0wZmYxLWNlMDAtMDAwMDAwMDAwMDAwL2Nhc2hpZnQtbXkuc2hhcmVwb2ludC5jb21AMGI4NTJmZWEtMGVjNy00YjAwLWI3OGItYzNiYmQ2NDc5NzlhIiwiZXhwIjoiMTcyODU1NDY3MSJ9.CgoKBHNuaWQSAjY0EgsI8pKS3JLFtD0QBRoLMjAuMjAuNDQuOTcqLGZsci9jMUpwd21QNDRHK2diUUlJM2hZdkJaZW9NYTU2UElPODcyVmhUNEU9MJ4BOAFCEKFYfZBbAACgC9y4lT8PdW9KEGhhc2hlZHByb29mdG9rZW56ATG6AUBhbGxzaXRlcy53cml0ZSBhbGxmaWxlcy53cml0ZSBhbGxmaWxlcy5yZWFkIGFsbHNpdGVzLmZ1bGxjb250cm9swgFJZGMzN2JjODItOWY0ZC00MjJjLWE2MjgtMmRkZDBlMzY0ZGQ3QDBiODUyZmVhLTBlYzctNGIwMC1iNzhiLWMzYmJkNjQ3OTc5YcgBAQ.bPk6tRR4-k7orFHz8AeirSFXiW3qDakEMobB41BytqA&ApiVersion=2.0"
/// licenseImage : ""
/// vehicleBrandName : "تويوتا"
/// vehicleBrandId : 3
/// companyName : "شركة تضاريس نجد"
/// companyId : 21
/// projectName : "سينومي - النخيل مول الدمام"
/// projectId : 68
/// vehicleColorName : "بيضاء"
/// vehicleColorId : 1

class Vehicle {
  Vehicle({
      this.id, 
      this.vehicleCode, 
      this.model, 
      this.yearOfManufacture, 
      this.plateNumber, 
      this.licenseNumber, 
      this.licenseExpiryDate, 
      this.specifications, 
      this.vehicleImage, 
      this.licenseImage, 
      this.vehicleBrandName, 
      this.vehicleBrandId, 
      this.companyName, 
      this.companyId, 
      this.projectName, 
      this.projectId, 
      this.vehicleColorName, 
      this.vehicleColorId,});

  int? id;
  String? vehicleCode;
  String? model;
  int? yearOfManufacture;
  String? plateNumber;
  String? licenseNumber;
  String? licenseExpiryDate;
  String? specifications;
  String? vehicleImage;
  String? licenseImage;
  String? vehicleBrandName;
  int? vehicleBrandId;
  String? companyName;
  int? companyId;
  String? projectName;
  int? projectId;
  String? vehicleColorName;
  int? vehicleColorId;

  factory Vehicle.fromDto(VehiclesDto json) {
    return Vehicle(
      id: json.id,
      vehicleCode: json.vehicleCode,
      model: json.model,
      yearOfManufacture: json.yearOfManufacture,
      plateNumber: json.plateNumber,
      licenseNumber: json.licenseNumber,
      licenseExpiryDate: json.licenseExpiryDate,
      specifications: json.specifications,
      vehicleImage: json.vehicleImage,
      companyName: json.companyName,
      vehicleBrandName: json.vehicleBrandName,
      vehicleBrandId: json.vehicleBrandId,
      companyId: json.companyId,
      projectName: json.projectName,
      projectId: json.projectId,
       vehicleColorName:json.color
     );
  }


  static List<Vehicle> fromListDto(List<VehiclesDto> json) {
    return json.map((e) => Vehicle.fromDto(e)).toList();
  }



  List<ListRowTextItem> toListRowTextItems(AppLocalizations strings) {
    return [
      ListRowTextItem(
        title: strings.company_name,
        value: companyName ?? '',
        icon: AppIcons.buildingsOutline,
      ),
      ListRowTextItem(
        title: strings.project_name,
        value: projectName ?? '',
        icon: AppIcons.projectName,
      ),
      ListRowTextItem(
        title: strings.vehicle_number,
        value: plateNumber ?? '',
        icon: AppIcons.vehicle_number,
      ),
    ];
  }
}