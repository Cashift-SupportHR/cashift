
import '../../data/models/vehicle_violation_data_dto.dart';
import '../../data/models/vehicle_violation_dto.dart';
class ContractViolationData{
  List<ContractViolation>? contractViolations;
  int? count;
  ContractViolationData({this.contractViolations, this.count});
  factory ContractViolationData.fromDto(ContractViolationDataDto dto) {
    return ContractViolationData(
      contractViolations: dto.contractViolations?.map((e) => ContractViolation.fromDto(e)).toList(),
      count: dto.count,
    );
  }

}
class ContractViolation {
  String? project;
  String? company;
  String? shift;
  String? contractViolationType;
  String? freeLanceName;
  String? freeLancePhone;
  List<ContractViolationAttachment>? contractViolationAttachments;
  int? id;
  String? details;
  double? lat;
  double? lng;
  int? projectId;
  int? companyId;
  int? shiftId;
  int? contractViolationTypeId;
  int? scheduleEmployeeWorkId;
  int? freeLanceId;
  String? companyName;
  String? streetName;

  ContractViolation({this.project, this.company, this.shift, this.contractViolationType, this.freeLanceName, this.freeLancePhone, this.contractViolationAttachments, this.id, this.details, this.lat, this.lng, this.projectId, this.companyId, this.shiftId, this.contractViolationTypeId, this.scheduleEmployeeWorkId, this.freeLanceId, this.companyName, this.streetName});

   factory ContractViolation.fromDto(ContractViolationDto json) => ContractViolation(
    project: json.project,
    company: json.company,
    shift: json.shift,
    contractViolationType: json.contractViolationType,
    freeLanceName: json.freeLanceName,
    freeLancePhone: json.freeLancePhone,
    contractViolationAttachments: json.contractViolationAttachments,
    id: json.id,
    details: json.details,
    lat: json.lat,
    lng: json.lng,
    projectId: json.projectId,
    companyId: json.companyId,
    shiftId: json.shiftId,
    contractViolationTypeId: json.contractViolationTypeId,
    scheduleEmployeeWorkId: json.scheduleEmployeeWorkId,
    freeLanceId: json.freeLanceId,
    companyName: json.companyName,
    streetName: json.streetName,
  );

   static List<ContractViolation> fromDtoList(List<ContractViolationDto> json) {
     return json.map((e) => ContractViolation.fromDto(e)).toList();
   }


   List<String> get getImages => contractViolationAttachments!.map((e) => e.path ?? '').toList();
}

