import 'package:json_annotation/json_annotation.dart'; 

part 'maintenance_dto.g.dart';


@JsonSerializable()
class MaintenanceDataDto {
  @JsonKey(name: "faultsAndMaintenance")
  final List<MaintenanceDto>? faultsAndMaintenance;
  @JsonKey(name: "count")
  final int? count;

  MaintenanceDataDto ({
    this.faultsAndMaintenance,
    this.count,
  });

  factory MaintenanceDataDto.fromJson(Map<String, dynamic> json) {
    return _$MaintenanceDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MaintenanceDataDtoToJson(this);
  }
}

@JsonSerializable(ignoreUnannotated: false)
class MaintenanceDto {
  @JsonKey(name: 'fautMaintenanceId')
  int? fautMaintenanceId;
  @JsonKey(name: 'faultMaintenanceType')
  String? faultMaintenanceType;
  @JsonKey(name: 'dateFaultApplying')
  String? dateFaultApplying;
  @JsonKey(name: 'time')
  String? time;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'faultMaintenanceImagesBefore')
  List<String>? faultMaintenanceImagesBefore;
  @JsonKey(name: 'faultMaintenanceImagesAfter')
  List<String>? faultMaintenanceImagesAfter;
  @JsonKey(name: 'adminAction')
  String? adminAction;
  @JsonKey(name: 'shiftAdminAction')
  String? shiftAdminAction;
  @JsonKey(name: 'importantLevel')
  String? importantLevel;
  @JsonKey(name: 'allowEdit')
  bool? allowEdit;

  MaintenanceDto({this.fautMaintenanceId, this.faultMaintenanceType, this.dateFaultApplying, this.time, this.description, this.faultMaintenanceImagesBefore, this.faultMaintenanceImagesAfter, this.adminAction, this.shiftAdminAction, this.importantLevel, this.allowEdit});

   factory MaintenanceDto.fromJson(Map<String, dynamic> json) => _$MaintenanceDtoFromJson(json);

   Map<String, dynamic> toJson() => _$MaintenanceDtoToJson(this);
}

