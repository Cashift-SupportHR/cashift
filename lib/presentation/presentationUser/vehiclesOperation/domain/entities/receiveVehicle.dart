
import '../../data/models/index.dart';
import '../../data/models/receive_vehicle_data_dto.dart';

 class ReceiveVehicle {
   int? totalData;
   int? pageSize;
   int? pageNumber;
   List<ReceiveVehicleData>? receiveVehicleData;

   ReceiveVehicle({
     this.totalData,
     this.pageSize,
     this.pageNumber,
     this.receiveVehicleData,
   });

   factory ReceiveVehicle.fromDto(ReceiveVehicleDto dto) {
     return ReceiveVehicle(
       totalData: dto.totalData,
       pageSize: dto.pageSize,
       pageNumber: dto.pageNumber,
       receiveVehicleData: dto.receiveVehicleDataDto
           ?.map((dataDto) => ReceiveVehicleData.fromDto(dataDto))
           .toList(),
     );
   }
 }

class ReceiveVehicleData {
  ReceiveVehicleData({
    this.id,
    this.vehicleId,
    this.vehicleBrand,
    this.vehicleModel,
    this.vehiclePlateNumber,
    this.vehicleHandoverDate,
    this.vehicleHandoverTime,
    this.freelancerInfoId,
    this.freelancerName,
    this.vehicleImage,
    this.handoverId,
    this.isComplete,
    this.projectName,
     this.shiftName,
   });

  int? id;
  int? handoverId;
  int? vehicleId;
  String? vehicleBrand;
  String? vehicleModel;
  String? projectName;
  String? vehiclePlateNumber;
  String? vehicleHandoverDate;
  String? vehicleHandoverTime;
  int? freelancerInfoId;
  String? freelancerName;
  String? vehicleImage;
  String? shiftName;
  bool? isComplete;

  factory ReceiveVehicleData.fromDto(ReceiveVehicleDataDto json) {
    return ReceiveVehicleData(
      vehicleId: json.vehicleId,
      id: json.id,
      vehicleBrand: json.vehicleBrand,
      vehicleModel: json.vehicleModel,
      vehiclePlateNumber: json.vehiclePlateNumber,
      vehicleHandoverDate: json.vehicleHandoverDate,
      vehicleHandoverTime: json.vehicleHandoverTime,
      freelancerInfoId: json.freelancerInfoId,
      freelancerName: json.freelancerName,
      vehicleImage: json.vehicleImage,
      isComplete: json.isComplete,
      handoverId: json.id,
      projectName: json.projectName,
      shiftName: json.shiftName,
       );
  }


}

