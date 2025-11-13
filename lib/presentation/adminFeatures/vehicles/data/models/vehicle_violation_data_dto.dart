import 'package:json_annotation/json_annotation.dart';
import 'package:shiftapp/presentation/adminFeatures/vehicles/data/models/vehicle_violation_dto.dart';

part 'vehicle_violation_data_dto.g.dart';

@JsonSerializable()
class ContractViolationDataDto {
  @JsonKey(name: "contractViolations")
  final List<ContractViolationDto>? contractViolations;
  @JsonKey(name: "count")
  final int? count;

  ContractViolationDataDto ({
    this.contractViolations,
    this.count,
  });

  factory ContractViolationDataDto.fromJson(Map<String, dynamic> json) {
    return _$ContractViolationDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ContractViolationDataDtoToJson(this);
  }
}
