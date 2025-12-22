import '../../data/models/terms_mana_dto.dart';

class TermsManaEntity {
  final int? termsType;
  final String? termsVersion;
  final String? title;
  final String? content;
  final String? lastUpdated;

  TermsManaEntity({
    this.termsType,
    this.termsVersion,
    this.title,
    this.content,
    this.lastUpdated,
  });

  factory TermsManaEntity.fromDto(TermsManaDto dto) {
    return TermsManaEntity(
      termsType: dto.termsType,
      termsVersion: dto.termsVersion,
      title: dto.title,
      content: dto.content,
      lastUpdated: dto.lastUpdated,
    );
  }

  static List<TermsManaEntity> fromDtoList(List<TermsManaDto> dtos) =>
      dtos.map(TermsManaEntity.fromDto).toList();
}
