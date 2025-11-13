import '../../data/models/maintenance_dto.dart';

class MaintenanceData {
  List<Maintenance>? data;
  int? count;
  MaintenanceData({this.data, this.count});
  factory MaintenanceData.fromDto(MaintenanceDataDto dto) {
    return MaintenanceData(
      data:
          dto.faultsAndMaintenance?.map((e) => Maintenance.fromDto(e)).toList(),
      count: dto.count,
    );
  }
}

class Maintenance {
  int? fautMaintenanceId;
  String? faultMaintenanceType;
  String? dateFaultApplying;
  String? time;
  String? description;
  List<String>? faultMaintenanceImagesBefore;
  List<String>? faultMaintenanceImagesAfter;
  String? adminAction;
  String? shiftAdminAction;
  String? importantLevel;
  bool? allowEdit;

  Maintenance({
    this.fautMaintenanceId,
    this.faultMaintenanceType,
    this.dateFaultApplying,
    this.time,
    this.description,
    this.faultMaintenanceImagesBefore,
    this.faultMaintenanceImagesAfter,
    this.adminAction,
    this.shiftAdminAction,
    this.importantLevel,
    this.allowEdit,
  });

  factory Maintenance.fromDto(MaintenanceDto dto) => Maintenance(
    fautMaintenanceId: dto.fautMaintenanceId,
    faultMaintenanceType: dto.faultMaintenanceType,
    dateFaultApplying: dto.dateFaultApplying,
    time: dto.time,
    description: dto.description,
    faultMaintenanceImagesBefore: dto.faultMaintenanceImagesBefore,
    faultMaintenanceImagesAfter: dto.faultMaintenanceImagesAfter,
    adminAction: dto.adminAction,
    shiftAdminAction: dto.shiftAdminAction,
    importantLevel: dto.importantLevel,
    allowEdit: dto.allowEdit,
  );

  static List<Maintenance> fromDtoList(List<MaintenanceDto> dtos) =>
      dtos.map((dto) => Maintenance.fromDto(dto)).toList();
}
