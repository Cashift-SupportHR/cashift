import '../../data/models/car_terms_and_conditions_dto.dart';

class CarTermsAndConditionsEntity {
  final int? id;
  final String? versionTag;
  final String? title;
  final String? content;
  final String? effectiveFromUtc;
  final String? effectiveToUtc;
  final bool? isActive;

  CarTermsAndConditionsEntity({
    this.id,
    this.versionTag,
    this.title,
    this.content,
    this.effectiveFromUtc,
    this.effectiveToUtc,
    this.isActive,
  });

  factory CarTermsAndConditionsEntity.fromDto(CarTermsAndConditionsDto dto) =>
      CarTermsAndConditionsEntity(
        id: dto.id,
        versionTag: dto.versionTag,
        title: dto.title,
        content: dto.content,
        effectiveFromUtc: dto.effectiveFromUtc,
        effectiveToUtc: dto.effectiveToUtc,
        isActive: dto.isActive,
      );

  static List<CarTermsAndConditionsEntity> fromDtoList(
      List<CarTermsAndConditionsDto> dtos) =>
      dtos.map((dto) => CarTermsAndConditionsEntity.fromDto(dto)).toList();
}
